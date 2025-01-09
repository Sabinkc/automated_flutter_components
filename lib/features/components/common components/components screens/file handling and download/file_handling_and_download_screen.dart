import 'package:components_automation/features/components/common%20components/components%20screens/file%20handling%20and%20download/file_handling_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

class FileHandlingAndDownloadScreen extends StatefulWidget {
  const FileHandlingAndDownloadScreen({super.key});

  @override
  _FileHandlingAndDownloadScreenState createState() =>
      _FileHandlingAndDownloadScreenState();
}

class _FileHandlingAndDownloadScreenState
    extends State<FileHandlingAndDownloadScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    final ScrollController scrollController = ScrollController();

    @override
    void dispose() {
      scrollController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("File Handling and Downloads",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CommonColor.primaryColorDark,
              CommonColor.primaryColorLight
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RawScrollbar(
            controller: scrollController,
            thumbColor: CommonColor.secondaryColor,
            thumbVisibility: true,
            thickness: 4,
            radius: const Radius.circular(8),
            child: SingleChildScrollView(
              controller: scrollController,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: width > 1000 ? 5 : (width > 600 ? 3 : 2),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1,
                children: [
                  buildFileHandlingWidget(
                      'File Picker',
                      Icons.insert_drive_file,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Pick files from your device'),
                  buildFileHandlingWidget(
                      'File Upload',
                      Icons.upload_file,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Upload files to the server'),
                  // buildFileHandlingWidget(
                  //     'Drag and Drop Upload',
                  //     Icons.cloud_upload,
                  //     cardPadding,
                  //     titleFontSize,
                  //     context,
                  //     'Drag and drop files to upload'),
                  buildFileHandlingWidget(
                      'Download File',
                      Icons.download,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Download files from the server'),
                  buildFileHandlingWidget(
                      'File Viewer',
                      Icons.pageview,
                      cardPadding,
                      titleFontSize,
                      context,
                      'View files in the app'),
                  buildFileHandlingWidget(
                      'File Explorer',
                      Icons.folder,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Explore files and directories'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFileHandlingWidget(
      String title,
      IconData icon,
      double cardPadding,
      double titleFontSize,
      BuildContext context,
      String tooltipMessage) {
    return Tooltip(
      message: tooltipMessage,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: () {
            // Update navigation based on the widget type
            switch (title) {
              case 'File Picker':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FilePickerScreen(),
                  ),
                );
                break;
              case 'File Upload':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FileUploadScreen(),
                  ),
                );
                break;
              // case 'Drag and Drop Upload':
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) =>  DragAndDropScreen(),
              //     ),
              //   );
              //   break;
              case 'Download File':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DownloadFileScreen(),
                  ),
                );
                break;
              case 'File Viewer':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FileViewerScreen(),
                  ),
                );
                break;
              case 'File Explorer':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FileExplorerScreen(),
                  ),
                );
                break;
            }
          },
          child: Padding(
            padding: EdgeInsets.all(cardPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: Colors.blueAccent),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tap to view',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Placeholder screens for navigation
