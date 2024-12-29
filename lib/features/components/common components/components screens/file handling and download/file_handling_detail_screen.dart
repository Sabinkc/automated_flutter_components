import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

import 'package:file_picker/file_picker.dart';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:flutter_dropzone/flutter_dropzone.dart';

import 'package:dotted_border/dotted_border.dart';

import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class File_Data_Model {
  final String name;
  final String mime;
  final int bytes;
  final String url;

  File_Data_Model(
      {required this.name,
      required this.mime,
      required this.bytes,
      required this.url});

  String get size {
    final kb = bytes / 1024;
    final mb = kb / 1024;
    return mb > 1
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
  }
}

class DropZoneWidget extends StatefulWidget {
  final ValueChanged<File_Data_Model> onDroppedFile;

  const DropZoneWidget({Key? key, required this.onDroppedFile})
      : super(key: key);

  @override
  _DropZoneWidgetState createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  late DropzoneViewController controller;
  bool highlight = false;

  @override
  Widget build(BuildContext context) {
    return buildDecoration(
      child: Stack(
        children: [
          DropzoneView(
            onCreated: (controller) => this.controller = controller,
            onDrop: UploadedFile,
            onHover: () => setState(() => highlight = true),
            onLeave: () => setState(() => highlight = false),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.cloud_upload_outlined,
                  size: 80,
                  color: Colors.white,
                ),
                Text(
                  'Drop Files Here',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final events = await controller.pickFiles();
                    if (events.isEmpty) return;
                    UploadedFile(events.first);
                  },
                  icon: Icon(Icons.search),
                  label: Text(
                    'Choose File',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future UploadedFile(dynamic event) async {
    final name = event.name;
    final mime = await controller.getFileMIME(event);
    final byte = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    print('Name : $name');
    print('Mime: $mime');
    print('Size : ${byte / (1024 * 1024)}');
    print('URL: $url');

    final droppedFile =
        File_Data_Model(name: name, mime: mime, bytes: byte, url: url);
    widget.onDroppedFile(droppedFile);
    setState(() {
      highlight = false;
    });
  }

  Widget buildDecoration({required Widget child}) {
    final colorBackground = highlight ? Colors.blue : Colors.green;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.all(10),
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: Colors.white,
          strokeWidth: 3,
          dashPattern: [8, 4],
          radius: Radius.circular(10),
          padding: EdgeInsets.zero,
          child: child,
        ),
        color: colorBackground,
      ),
    );
  }
}

class DroppedFileWidget extends StatelessWidget {
  final File_Data_Model? file;
  const DroppedFileWidget({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: buildImage(context)),
      ],
    );
  }

  Widget buildImage(BuildContext context) {
    if (file == null) return buildEmptyFile('No Selected File');

    print(file!.url);

    return Column(
      children: [
        if (file != null) buildFileDetail(file),
        Image.network(
          file!.url,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
          errorBuilder: (context, error, _) => buildEmptyFile('No Preview'),
        ),
      ],
    );
  }

  Widget buildEmptyFile(String text) {
    return Container(
      width: 120,
      height: 120,
      color: Colors.blue.shade300,
      child: Center(child: Text(text)),
    );
  }

  Widget buildFileDetail(File_Data_Model? file) {
    final style = TextStyle(fontSize: 20);
    return Container(
      margin: EdgeInsets.only(left: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Selected File Preview ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          Text(
            'Name: ${file?.name}',
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
          ),
          const SizedBox(height: 10),
          Text('Type: ${file?.mime}', style: style),
          const SizedBox(height: 10),
          Text('Size: ${file?.size}', style: style),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}

class DragAndDropScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DragAndDropScreen> {
  File_Data_Model? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Drag and drop', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor:
            CommonColor.primaryColor, // You can customize the color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: 300,
                  child: DropZoneWidget(
                    onDroppedFile: (file) => setState(() => this.file = file),
                  ),
                ),
                SizedBox(height: 20),
                DroppedFileWidget(file: file),
              ],
            )),
      ),
    );
  }
}

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  _FilePickerScreenState createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  String? singleFileName; // To store the selected single file name
  String? singleFileSize; // To store the selected single file size
  List<String> multipleFileNames =
      []; // List to store names of multiple selected files

  // Method to pick a single file
  Future<void> _pickSingleFile(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles();

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        setState(() {
          singleFileName = file.name;
          singleFileSize =
              file.size != null ? '${file.size} bytes' : 'Unknown size';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File picked successfully: $singleFileName')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No file selected')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  // Method to pick multiple files with a limit of 3
  Future<void> _pickMultipleFiles(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(allowMultiple: true);

      if (result != null && result.files.isNotEmpty) {
        if (result.files.length > 3) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error: You can select a maximum of 3 files only'),
            ),
          );
          return;
        }

        setState(() {
          multipleFileNames = result.files.map((file) => file.name).toList();
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  '${multipleFileNames.length} files picked successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No files selected')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Picker', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Adjust this for your theme
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _pickSingleFile(context),
                child: const Text('Pick Single File'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _pickMultipleFiles(context),
                child: const Text('Pick Multiple Files'),
              ),
              const SizedBox(height: 16),
              if (singleFileName != null) ...[
                Text('Picked File: $singleFileName'),
                Text('File Size: $singleFileSize'),
              ],
              if (multipleFileNames.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Text('Picked Files:'),
                ...multipleFileNames.map((file) => Text(file)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class FileUploadScreen extends StatefulWidget {
  const FileUploadScreen({super.key});

  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  String? fileName; // To store the selected single file name
  String? fileSize; // To store the selected single file size
  List<String> selectedFiles = []; // List to store multiple selected file names

  // Method to handle single file upload
  Future<void> _uploadSingleFile(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles();

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        setState(() {
          fileName = file.name;
          fileSize = file.size != null ? '${file.size} bytes' : 'Unknown size';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File uploaded successfully: $fileName')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No file selected')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  // Method to handle multiple file uploads
  Future<void> _uploadMultipleFiles(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(allowMultiple: true);

      if (result != null && result.files.isNotEmpty) {
        if (result.files.length > 3) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Error: Maximum of 3 files can be uploaded')),
          );
          return;
        }

        setState(() {
          selectedFiles = result.files.map((file) => file.name).toList();
        });

        for (var file in result.files) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('File uploaded successfully: ${file.name}')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No files selected')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Upload', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Adjust this for your theme
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _uploadSingleFile(context),
                child: const Text('Upload Single File'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _uploadMultipleFiles(context),
                child: const Text('Upload Multiple Files'),
              ),
              const SizedBox(height: 16),
              if (fileName != null) ...[
                Text('Selected File: $fileName'),
                Text('File Size: $fileSize'),
              ],
              if (selectedFiles.isNotEmpty) ...[
                const SizedBox(height: 16),
                const Text('Selected Files:'),
                ...selectedFiles.map((file) => Text(file)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// class DragAndDropScreen extends StatefulWidget {
//   const DragAndDropScreen({super.key});

//   @override
//   _DragAndDropScreenState createState() => _DragAndDropScreenState();
// }

// class _DragAndDropScreenState extends State<DragAndDropScreen> {
//   late DropzoneViewController _controller;
//   String _fileName = '';
//   bool _isHovering = false;

//   // Handles the file drop event
//   void _onDrop(dynamic ev) {
//     final file = ev[0];
//     setState(() {
//       _fileName = file['name']; // Extract the file name and display it
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Drag and Drop file',
//             style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: CommonColor.primaryColor, // Adjust this for your theme
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context); // Navigate back to the previous screen
//           },
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Drag & drop zone
//             Container(
//               width: 300,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: _isHovering ? Colors.lightBlue[100] : Colors.transparent,
//                 border: Border.all(color: Colors.blue, width: 2),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: DropzoneView(
//                 onCreated: (controller) {
//                   _controller = controller;
//                 },
//                 onDrop: _onDrop, // Handle the drop event
//                 onHover: () {
//                   setState(() {
//                     _isHovering = true; // Show hover effect
//                   });
//                 },
//                 onLeave: () {
//                   setState(() {
//                     _isHovering = false; // Remove hover effect
//                   });
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//             // Display file name if a file is dropped
//             if (_fileName.isNotEmpty)
//               Text(
//                 'File Name: $_fileName', // Display the name of the dropped file
//                 style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             // Provide instructions if no file is dropped
//             if (_fileName.isEmpty)
//               const Text(
//                 'Drag and drop a file here',
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class DownloadFileScreen extends StatefulWidget {
  const DownloadFileScreen({super.key});

  @override
  _DownloadFileScreenState createState() => _DownloadFileScreenState();
}

class _DownloadFileScreenState extends State<DownloadFileScreen> {
  bool isDownloading = false;
  String? downloadedFileName;
  String errorMessage = '';

  // Simulate the download of the file from assets to the device storage
  Future<void> _downloadFile(BuildContext context) async {
    setState(() {
      isDownloading = true;
      errorMessage = ''; // Reset error message
    });

    try {
      // Retrieve the file from the assets folder
      final byteData = await rootBundle.load('assets/sampleFile.pdf');

      // Get the path to the app's document directory
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/sampleFile.pdf';

      // Write the byte data to the file
      final file = File(filePath);
      await file.writeAsBytes(byteData.buffer.asUint8List());

      setState(() {
        downloadedFileName = filePath; // Store the path where the file is saved
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File downloaded to: $filePath')),
      );
    } catch (e) {
      setState(() {
        errorMessage = 'Error: ${e.toString()}';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      setState(() {
        isDownloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Download File', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor:
            CommonColor.primaryColor, // You can customize the color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: isDownloading ? null : () => _downloadFile(context),
                child: isDownloading
                    ? const CircularProgressIndicator()
                    : const Text('Download File'),
              ),
              const SizedBox(height: 16),
              if (downloadedFileName != null) ...[
                Text('File saved at: $downloadedFileName'),
              ],
              if (errorMessage.isNotEmpty) ...[
                Text(
                  errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}







class FileViewerScreen extends StatelessWidget {
  const FileViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File Viewer')),
      body: const FileViewer(),
    );
  }
}

class FileViewer extends StatelessWidget {
  const FileViewer({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return const WebPdfViewer();
    } else {
      return const MobilePdfViewer();
    }
  }
}

class WebPdfViewer extends StatelessWidget {
  const WebPdfViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url: WebUri(
            'https://mozilla.github.io/pdf.js/web/viewer.html?file=assets/sampleFile.pdf'),
      ),
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(),
      ),
    );
  }
}

class MobilePdfViewer extends StatelessWidget {
  const MobilePdfViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return PDFView(
      filePath: 'assets/sampleFile.pdf', // Path to PDF in your assets folder
    );
  }
}


// class FileViewerScreen extends StatelessWidget {
//   const FileViewerScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('File Viewer')),
//       body: const Center(
//         child: FileViewer(), // Widget to display file from assets
//       ),
//     );
//   }
// }

// class FileViewer extends StatelessWidget {
//   const FileViewer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         ElevatedButton(
//           onPressed: () => _viewPdfFile(context),
//           child: const Text('View PDF File'),
//         ),
//       ],
//     );
//   }

//   // Function to load and view PDF from assets
//   Future<void> _viewPdfFile(BuildContext context) async {
//     final ByteData data = await rootBundle.load('assets/sampleFile.pdf');
//     final buffer = data.buffer.asUint8List(); // Convert ByteData to Uint8List

//     // Navigate to PDF viewer screen
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PdfViewer(pdfData: buffer),
//       ),
//     );
//   }
// }

// class PdfViewer extends StatelessWidget {
//   final Uint8List pdfData;

//   const PdfViewer({super.key, required this.pdfData});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('PDF Viewer')),
//       body: PDFView(
//         onRender: (pages) {
//           print('PDF Rendered: $pages pages');
//         },
//         onError: (error) {
//           print('Error loading PDF: $error');
//         },
//         onPageError: (page, error) {
//           print('Error on page $page: $error');
//         },
//         pdfData: pdfData, // Pass the loaded PDF data to the PDF viewer
//       ),
//     );
//   }
// }

// class ImageViewer extends StatelessWidget {
//   final Uint8List imageData;

//   const ImageViewer({super.key, required this.imageData});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Image Viewer')),
//       body: Center(
//         child: Image.memory(imageData), // Display image from memory
//       ),
//     );
//   }
// }


class FileExplorerScreen extends StatelessWidget {
  const FileExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File Explorer')),
      body: const Center(child: Text('File Explorer Screen')),
    );
  }
}
