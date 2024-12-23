

import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

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
