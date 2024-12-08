// import 'package:components_automation/core/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart' as foundation;
// import 'dart:html' as html; // Import this for web-specific handling

// class FileUploadScreen extends StatefulWidget {
//   const FileUploadScreen({super.key});

//   @override
//   _FileUploadScreenState createState() => _FileUploadScreenState();
// }

// class _FileUploadScreenState extends State<FileUploadScreen> {
//   String? fileName;
//   String? fileSize;
//   List<String> selectedFiles = []; // List to store names of selected files

//   // Function to pick a single file
//   Future<void> _pickFile(BuildContext context) async {
//     if (foundation.kIsWeb) {
//       // Web-specific file picker using dart:html
//       html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
//       uploadInput.accept = '*/*'; // Allow any file type
//       uploadInput.click(); // Open file dialog

//       uploadInput.onChange.listen((e) async {
//         final files = uploadInput.files;
//         if (files!.isEmpty) return;

//         setState(() {
//           fileName = files[0].name;
//           fileSize = '${files[0].size} bytes';
//         });

//         // Show Snackbar after file selection
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('File uploaded successfully: $fileName')),
//         );
//       });
//     } else {
//       // Mobile/Desktop-specific file picker using file_picker
//       FilePickerResult? result = await FilePicker.platform.pickFiles();

//       if (result != null) {
//         PlatformFile file = result.files.first;
//         setState(() {
//           fileName = file.name;
//           fileSize =
//               file.size != null ? '${file.size} bytes' : 'Size not available';
//         });

//         // Show Snackbar after file selection
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('File uploaded successfully: $fileName')),
//         );
//       } else {
//         // Handle user cancellation or no file picked
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('No file selected')),
//         );
//       }
//     }
//   }

//   // Function to pick multiple files (max 3 files)
//   Future<void> _pickMultipleFiles(BuildContext context) async {
//     if (foundation.kIsWeb) {
//       // Web-specific file picker for multiple files using dart:html
//       html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
//       uploadInput.accept = '*/*'; // Allow any file type
//       uploadInput.multiple = true; // Allow multiple file selection
//       uploadInput.click(); // Open file dialog

//       uploadInput.onChange.listen((e) async {
//         final files = uploadInput.files;
//         if (files!.isEmpty) return;

//         if (files.length > 3) {
//           // Show error Snackbar if more than 3 files are selected
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('Error: You can upload a maximum of 3 files.')),
//           );
//           return;
//         }

//         setState(() {
//           selectedFiles.clear(); // Clear the list before adding new files
//         });

//         // Iterate through selected files and add them to the list
//         for (var file in files) {
//           setState(() {
//             selectedFiles.add(file.name);
//           });
//           // Show Snackbar for each file selected
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('File uploaded successfully: ${file.name}')),
//           );
//         }
//       });
//     } else {
//       // Mobile/Desktop-specific file picker for multiple files using file_picker
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         allowMultiple: true,
//       );

//       if (result != null) {
//         if (result.files.length > 3) {
//           // Show error Snackbar if more than 3 files are selected
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text('Error: You can upload a maximum of 3 files.')),
//           );
//           return;
//         }

//         setState(() {
//           selectedFiles.clear(); // Clear the list before adding new files
//         });

//         // Iterate through selected files and add them to the list
//         for (var file in result.files) {
//           setState(() {
//             selectedFiles.add(file.name);
//           });
//           // Show Snackbar for each file selected
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('File uploaded successfully: ${file.name}')),
//           );
//         }
//       } else {
//         // Handle user cancellation or no file picked
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('No files selected')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("File Upload", style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: CommonColor.primaryColor, // Adjust to your theme
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               ElevatedButton(
//                 onPressed: () => _pickFile(context),
//                 child: const Text("Upload Single File"),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () => _pickMultipleFiles(context),
//                 child: const Text("Upload Multiple Files"),
//               ),
//               const SizedBox(height: 16),
//               if (fileName != null) ...[
//                 Text('Selected File: $fileName'),
//                 Text('File Size: $fileSize'),
//               ],
//               if (selectedFiles.isNotEmpty) ...[
//                 const SizedBox(height: 16),
//                 Text('Selected Files:'),
//                 for (var file in selectedFiles) Text(file),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FileUploadScreen extends StatelessWidget {
  const FileUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
