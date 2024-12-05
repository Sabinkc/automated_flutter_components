
import 'package:flutter/material.dart';

class TextElementScreen extends StatefulWidget {
  const TextElementScreen({super.key});

  @override
  _TextElementScreenState createState() => _TextElementScreenState();
}

class _TextElementScreenState extends State<TextElementScreen> {
  String _dynamicText = "Hello, this is dynamic text!";
  int _clickCount = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Text Elements", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: RawScrollbar(
          thumbColor: Colors.blueAccent,
          thumbVisibility: true,
          thickness: 4,
          radius: const Radius.circular(8),
          child: GridView.count(
            crossAxisCount: width > 800 ? 5 : (width > 600 ? 3 : 2),
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1,
            children: [
              _buildTextCard(
                "Header (H1)",
                Text("This is H1",
                    style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                "Header (H1) is used for the largest and most important heading.",
              ),
              _buildTextCard(
                "Header (H2)",
                Text("This is H2",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                "Header (H2) is used for subheadings, typically second in importance.",
              ),
              _buildTextCard(
                "Header (H3)",
                Text("This is H3",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                "Header (H3) is used for subheadings within an H2 section.",
              ),
              _buildTextCard(
                "Paragraph",
                Text(
                    "This is a sample paragraph. It contains longer text for descriptive purposes.",
                    textAlign: TextAlign.justify),
                "Paragraphs are used for blocks of text that contain more detailed information.",
              ),
              _buildTextCard(
                "Label",
                Text("This is a label text.",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                "Labels are used to identify form fields or provide brief descriptions.",
              ),
              _buildTextCard(
                "Tooltip",
                Tooltip(
                    message: "This is a tooltip",
                    child: Icon(Icons.info_outline, size: 32)),
                "Tooltips display additional information when a user hovers or long-presses on an element.",
              ),
              _buildTextCard(
                "Clickable Link",
                GestureDetector(
                  onTap: () {
                    _showDialog(
                        context, "Clickable Link", "You clicked the link!");
                  },
                  child: Text("Click Me!",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline)),
                ),
                "Links are clickable text elements used to navigate to other pages or perform actions.",
              ),
              _buildTextCard(
                "Dynamic Text",
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_dynamicText, style: TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clickCount++;
                          _dynamicText = "You clicked $_clickCount times!";
                        });
                      },
                      child: Text("Change Text"),
                    ),
                  ],
                ),
                "Dynamic text changes based on user interaction, such as button clicks.",
              ),
              _buildTextCard(
                "Rich Text",
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "This is ",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "bold",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: " and ", style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "italic",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black)),
                    ],
                  ),
                ),
                "Rich text allows combining multiple styles within a single text widget.",
              ),
              _buildTextCard(
                "Selectable Text",
                SelectableText("You can select this text by long pressing.",
                    style: TextStyle(fontSize: 16)),
                "Selectable text allows users to select and copy the text content.",
              ),
              _buildTextCard(
                "Marquee Text",
                _buildMarqueeText(
                    "This text scrolls horizontally as a marquee effect."),
                "Marquee text scrolls horizontally, useful for displaying announcements or long text.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMarqueeText(String text) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Text(text, style: TextStyle(fontSize: 16)),
    );
  }

  Widget _buildTextCard(String title, Widget content, String tooltip) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tooltip(
              message: tooltip,
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(child: Center(child: content)),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context, String title, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
