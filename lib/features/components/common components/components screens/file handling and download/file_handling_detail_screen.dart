import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

import 'package:file_picker/file_picker.dart';

import 'dart:typed_data';

import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;



import 'package:desktop_drop/desktop_drop.dart'; 


class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({super.key});

  @override
  _FilePickerScreenState createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  String? singleFileName; // To store the selected single file name
  String? singleFileSize; // To store the selected single file size
  List<String> multipleFileNames = []; // List to store names of multiple selected files

  // Method to pick a single file
  Future<void> _pickSingleFile(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles();

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        setState(() {
          singleFileName = file.name;
          singleFileSize = file.size != null ? '${file.size} bytes' : 'Unknown size';
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
          SnackBar(content: Text('${multipleFileNames.length} files picked successfully')),
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
                ...multipleFileNames.map((file) => Text(file)).toList(),
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
                ...selectedFiles.map((file) => Text(file)).toList(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}




class DragAndDropUploadScreen extends StatefulWidget {
  const DragAndDropUploadScreen({super.key});

  @override
  _DragAndDropUploadScreenState createState() =>
      _DragAndDropUploadScreenState();
}

class _DragAndDropUploadScreenState extends State<DragAndDropUploadScreen> {
  // Common Variables
  List<String> droppedFiles = [];
  bool isDragging = false;

  // Dropzone Variables (for web)
  late DropzoneViewController dropzoneController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag & Drop Upload'),
      ),
      body: kIsWeb
          ? _buildWebDragAndDrop(context)
          : (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
              ? _buildDesktopDragAndDrop(context)
              : _buildUnsupportedPlatform(),
    );
  }

  /// Web Implementation (Using `flutter_dropzone`)
  Widget _buildWebDragAndDrop(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          DropzoneView(
            onCreated: (controller) => dropzoneController = controller,
            onDrop: (event) async {
              final fileName = await dropzoneController.getFilename(event);
              setState(() {
                droppedFiles.add(fileName);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('File uploaded: $fileName')),
              );
            },
            onHover: () {
              setState(() => isDragging = true);
            },
            onLeave: () {
              setState(() => isDragging = false);
            },
          ),
          Container(
            height: 200,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(
                color: isDragging ? Colors.blue : Colors.grey,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
              color: isDragging ? Colors.blue.withOpacity(0.2) : Colors.grey[200],
            ),
            child: Center(
              child: Text(
                isDragging ? 'Release to upload' : 'Drag and drop files here (Web)',
                style: TextStyle(
                  fontSize: 16,
                  color: isDragging ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Desktop Implementation (Using `desktop_drop`)
  Widget _buildDesktopDragAndDrop(BuildContext context) {
    return Center(
      child: DropTarget(
        onDragEntered: (details) {
          setState(() => isDragging = true);
        },
        onDragExited: (details) {
          setState(() => isDragging = false);
        },
        onDragDone: (details) {
          setState(() {
            droppedFiles.addAll(details.files.map((file) => file.name).toList());
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Files uploaded: ${details.files.map((f) => f.name).join(", ")}'),
            ),
          );
        },
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            border: Border.all(
              color: isDragging ? Colors.blue : Colors.grey,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10),
            color: isDragging ? Colors.blue.withOpacity(0.2) : Colors.grey[200],
          ),
          child: Center(
            child: Text(
              isDragging
                  ? 'Release to upload'
                  : 'Drag and drop files here (Desktop)',
              style: TextStyle(
                fontSize: 16,
                color: isDragging ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Unsupported Platform Fallback
  Widget _buildUnsupportedPlatform() {
    return const Center(
      child: Text('Drag and drop not supported on this platform.'),
    );
  }
}


class DownloadFileScreen extends StatelessWidget {
  const DownloadFileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Download File')),
      body: const Center(child: Text('Download File Screen')),
    );
  }
}

class FileViewerScreen extends StatelessWidget {
  const FileViewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File Viewer')),
      body: const Center(child: Text('File Viewer Screen')),
    );
  }
}

class FileExplorerScreen extends StatelessWidget {
  const FileExplorerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File Explorer')),
      body: const Center(child: Text('File Explorer Screen')),
    );
  }
}
