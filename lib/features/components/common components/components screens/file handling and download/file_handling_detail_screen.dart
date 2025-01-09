import 'package:flutter/cupertino.dart';
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
            onDropFile: UploadedFile,
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

// class DragAndDropScreen extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<DragAndDropScreen> {
//   File_Data_Model? file;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:
//             const Text('Drag and drop', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor:
//             CommonColor.primaryColor, // You can customize the color
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context); // Navigate back to the previous screen
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//             alignment: Alignment.center,
//             padding: EdgeInsets.all(15),
//             child: Column(
//               children: [
//                 Container(
//                   height: 300,
//                   child: DropZoneWidget(
//                     onDroppedFile: (file) => setState(() => this.file = file),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 DroppedFileWidget(file: file),
//               ],
//             )),
//       ),
//     );
//   }
// }

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
      // Simulate a delay (remove in production)
      await Future.delayed(const Duration(seconds: 2));

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

      // Show a SnackBar after the progress is hidden
      Future.delayed(const Duration(milliseconds: 300), () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(milliseconds: 300),
            content: Text('File downloaded to: $filePath'),
          ),
        );
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error: ${e.toString()}';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(milliseconds: 300),
          content: Text('Error: ${e.toString()}'),
        ),
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
        title: const Text(
          'Download File',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Customize as needed
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
          child: isDownloading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Downloading file...'),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed:
                          isDownloading ? null : () => _downloadFile(context),
                      child: const Text('Download sampleFile'),
                    ),
                    const SizedBox(height: 16),
                    if (downloadedFileName != null)
                      Text(
                        'File saved at: $downloadedFileName',
                        textAlign: TextAlign.center,
                      ),
                    if (errorMessage.isNotEmpty)
                      Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}

// class FileViewerScreen extends StatefulWidget {
//   const FileViewerScreen({super.key});

//   @override
//   _FileViewerScreenState createState() => _FileViewerScreenState();
// }

// class _FileViewerScreenState extends State<FileViewerScreen> {
//   String? filePath;
//   bool isLoading = true;

//   // Load the PDF file from assets and save it to the app's document directory
//   Future<void> _loadPDF() async {
//     try {
//       // Load PDF from assets
//       final byteData = await rootBundle.load('assets/sampleFile.pdf');

//       // Get the path to the app's document directory
//       final directory = await getApplicationDocumentsDirectory();
//       final filePath = '${directory.path}/sampleFile.pdf';

//       // Write the byte data to the file
//       final file = File(filePath);
//       await file.writeAsBytes(byteData.buffer.asUint8List());

//       setState(() {
//         this.filePath = filePath;
//         isLoading = false; // Stop loading once the file is saved
//       });
//     } catch (e) {
//       setState(() {
//         isLoading = false; // Stop loading in case of an error
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error loading PDF: ${e.toString()}')),
//       );
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _loadPDF(); // Call the function to load the PDF when the screen is created
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('File Viewer', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.blue, // Customize as needed
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context); // Navigate back to the previous screen
//           },
//         ),
//       ),
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator()) // Show loading indicator
//           : filePath == null
//               ? const Center(
//                   child: Text(
//                     'Error loading file.',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 )
//               : PDFView(
//                   filePath: filePath!,
//                   enableSwipe: true,
//                   swipeHorizontal: true,
//                   autoSpacing: false,
//                   pageFling: true,
//                   onError: (error) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Failed to load PDF: $error')),
//                     );
//                   },
//                   onRender: (pages) {
//                     debugPrint('PDF loaded with $pages pages');
//                   },
//                   onPageChanged: (page, total) {
//                     debugPrint('Page $page of $total');
//                   },
//                 ),
//     );
//   }
// }

class FileViewerScreen extends StatelessWidget {
  const FileViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Viewer', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Customize as needed
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => FileViewerContentScreen()));
              },
              child: Text("View sampleFile"))),
    );
  }
}

class FileViewerContentScreen extends StatefulWidget {
  const FileViewerContentScreen({super.key});

  @override
  _FileViewerScreenState createState() => _FileViewerScreenState();
}

class _FileViewerScreenState extends State<FileViewerContentScreen> {
  String? filePath;
  bool isLoading = true;

  // Load the PDF file from assets and save it to the app's document directory
  Future<void> _loadPDF() async {
    try {
      // Load PDF from assets
      final byteData = await rootBundle.load('assets/sampleFile.pdf');

      // Get the path to the app's document directory
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/sampleFile.pdf';

      // Write the byte data to the file
      final file = File(filePath);
      await file.writeAsBytes(byteData.buffer.asUint8List());

      setState(() {
        this.filePath = filePath;
        isLoading = false; // Stop loading once the file is saved
      });
    } catch (e) {
      setState(() {
        isLoading = false; // Stop loading in case of an error
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading PDF: ${e.toString()}')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPDF(); // Load PDF file when the screen is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('sampleFile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Customize as needed
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Show loading indicator
          : filePath == null
              ? const Center(
                  child: Text(
                    'Error loading file.',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              : PDFView(
                  filePath: filePath!,
                  enableSwipe: true,
                  swipeHorizontal: false, // Vertical scroll enabled
                  autoSpacing: false,
                  pageFling: true,
                  onError: (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to load PDF: $error')),
                    );
                  },
                  onRender: (pages) {
                    debugPrint('PDF loaded with $pages pages');
                  },
                  onPageChanged: (page, total) {
                    debugPrint('Page $page of $total');
                  },
                ),
    );
  }
}

class FileExplorerScreen extends StatefulWidget {
  const FileExplorerScreen({super.key});

  @override
  _FileExplorerScreenState createState() => _FileExplorerScreenState();
}

class _FileExplorerScreenState extends State<FileExplorerScreen> {
  String? currentDirectory;
  List<FileSystemEntity>? files;

  @override
  void initState() {
    super.initState();
    _getCurrentDirectory(); // Start by getting the app's directory or any other directory
  }

  // Get the current directory to explore
  Future<void> _getCurrentDirectory() async {
    // Set the initial directory to app's document directory (or customize as needed)
    final directory = await getApplicationDocumentsDirectory();
    setState(() {
      currentDirectory = directory.path;
      _loadFiles();
    });
  }

  // Load files and directories inside the current directory
  Future<void> _loadFiles() async {
    final dir = Directory(currentDirectory!);
    final filesList = dir.listSync(); // List all files and directories
    setState(() {
      files = filesList;
    });
  }

  // Navigate to a directory and load its files
  void _navigateToDirectory(String path) {
    setState(() {
      currentDirectory = path;
      _loadFiles(); // Load files inside the directory
    });
  }

  // Open a file (can be customized to open PDFs or images)
  Future<void> _openFile(FileSystemEntity file) async {
    if (file is File) {
      final filePath = file.path;
      // Handle file opening, e.g., open PDF, image, etc.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: Duration(milliseconds: 300),
            content: Text('Opening file: $filePath')),
      );
    }
  }

  // Pick a file from the device
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final filePath = result.files.single.path;
      if (filePath != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Selected file: $filePath')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('File Explorer', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: files == null
          ? const Center(
              child: CircularProgressIndicator()) // Show loading indicator
          : Column(
              children: [
                // Show current directory
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Current Directory: $currentDirectory',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: files!.length,
                    itemBuilder: (context, index) {
                      final file = files![index];
                      final fileName = file.path.split('/').last;
                      return ListTile(
                        leading: Icon(
                            file is Directory ? Icons.folder : Icons.file_copy),
                        title: Text(fileName),
                        onTap: () {
                          if (file is Directory) {
                            // Navigate into the directory
                            _navigateToDirectory(file.path);
                          } else {
                            // Open the file
                            _openFile(file);
                          }
                        },
                      );
                    },
                  ),
                ),
                // Button to pick a file from the device
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _pickFile,
                    child: const Text('Pick a File'),
                  ),
                ),
              ],
            ),
    );
  }
}
