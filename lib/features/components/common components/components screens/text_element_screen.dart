import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TextElementScreen extends StatefulWidget {
  const TextElementScreen({super.key});

  @override
  _TextElementScreenState createState() => _TextElementScreenState();
}

class _TextElementScreenState extends State<TextElementScreen> {
  final String _dynamicText = "Hello, this is dynamic text!";
  final int _clickCount = 0;
  String dynamicText = "Dynamic content";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Text Elements", style: TextStyle(color: Colors.white)),
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
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CommonColor.primaryColorDark,
              CommonColor.primaryColorLight,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: RawScrollbar(
          thumbColor: CommonColor.secondaryColor,
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
                  const Text("This is H1",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                  "Header (H1) is used for the largest and most important heading."),
              _buildTextCard(
                "Header (H2)",
                const Text("This is H2",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                "Header (H2) is used for second-level headings, slightly smaller than H1.",
              ),
              _buildTextCard(
                "Header (H3)",
                const Text("This is H3",
                    style:
                        TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                "Header (H3) is used for third-level headings, smaller than H2.",
              ),
              _buildTextCard(
                "Header (H4)",
                const Text("This is H4",
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                "Header (H4) is used for fourth-level headings, smaller than H3.",
              ),
              _buildTextCard(
                "Header (H5)",
                const Text("This is H5",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                "Header (H5) is used for fifth-level headings, smaller than H4.",
              ),
              _buildTextCard(
                "Header (H6)",
                const Text("This is H6",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                "Header (H6) is used for the smallest heading, often for minor labels.",
              ),
              _buildTextCard(
                "Labels",
                const Text(
                  "This is a Label",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                "Labels are used to display static text or titles in the UI.",
              ),
              _buildTextCard(
                "Tooltips",
                const Tooltip(
                  message: "This is a Tooltip",
                  child: Icon(Icons.info, size: 28, color: Colors.blue),
                ),
                "Tooltips provide additional information when the user hovers or long-presses on a widget.",
              ),

              _buildTextCard(
                "Links (Clickable)",
                GestureDetector(
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://www.youtube.com/'); // Use Uri.parse
                    try {
                      // Check if the URL can be launched
                      if (await canLaunchUrl(url)) {
                        // Launch the URL
                        await launchUrl(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    } catch (e) {
                      // Show a snackbar with error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error occurred: $e')),
                      );
                    }
                  },
                  child: const Text(
                    "Click Me",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                "Links are clickable text elements that navigate the user to another screen or perform an action.",
              ),

              _buildTextCard(
                "Dynamic Text Content",
                StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dynamicText,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black87),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Toggle the text dynamically
                            setState(() {
                              dynamicText = dynamicText == "Dynamic content"
                                  ? "Content changed!"
                                  : "Dynamic content";
                            });
                          },
                          child: const Text("Change Text"),
                        ),
                      ],
                    );
                  },
                ),
                "Dynamic text content is text that updates dynamically, often used for displaying variable data.",
              ),
              _buildTextCard(
                  "Paragraph",
                  const Text(
                      "This is a sample paragraph. It contains longer text for descriptive purposes.",
                      textAlign: TextAlign.justify),
                  "Paragraphs are used for blocks of text that contain more detailed information."),
              _buildTextCard(
                  "Blockquote",
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                          border: Border(
                              left:
                                  BorderSide(color: Colors.blue, width: 4.0))),
                      child: const Text(
                          "This is a blockquote used for quoting text.")),
                  "Blockquotes highlight quoted text."),
              _buildTextCard(
                  "Subtitle",
                  const Text("This is a subtitle.",
                      style: TextStyle(fontSize: 18, color: Colors.grey)),
                  "Subtitles provide additional context for headers."),
              _buildTextCard(
                  "Caption",
                  const Text("This is a caption.",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                  "Captions describe images or tables."),

              // Badge with message count on icon
              _buildTextCard(
                "Badge",
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const Icon(
                      Icons.message,
                      size: 40,
                      color: Colors.blue,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: const Text(
                          "Badge", // Number of messages
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                  ],
                ),
                "Badges display small pieces of information, like new messages or updates.",
              ),

// Hint Text inside TextField
              _buildTextCard(
                "Hint Text",
                TextField(
                  decoration: InputDecoration(
                    hintText:
                        "hint text", // Showing hint text inside the TextField
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                "Hint text gives users a clue on what to input in a field.",
              ),

              _buildTextCard(
                  "Highlighted Text",
                  const Text("This is highlighted text.",
                      style: TextStyle(backgroundColor: Colors.yellow)),
                  "Highlighted text draws attention to specific content."),
              _buildTextCard(
                  "Breadcrumbs",
                  const Text("Home > Category > Item",
                      style: TextStyle(fontSize: 14, color: Colors.blue)),
                  "Breadcrumbs show the user's navigation path."),
              _buildTextCard(
                  "Accordion Text",
                  const ExpansionTile(
                      title: Text("Accordion Title"),
                      children: [Text("This is the expanded accordion text.")]),
                  "Accordion text expands/collapses to show more content."),
              _buildTextCard(
                  "Strike-through Text",
                  const Text("This is strike-through text.",
                      style: TextStyle(decoration: TextDecoration.lineThrough)),
                  "Strike-through text indicates deleted or irrelevant text."),
              _buildTextCard(
                  "Superscript",
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "X", style: TextStyle(color: Colors.black)),
                    WidgetSpan(
                        child: Transform.translate(
                            offset: const Offset(0, -8),
                            child: const Text("2",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black))))
                  ])),
                  "Superscript is used for mathematical exponents."),
              _buildTextCard(
                  "Subscript",
                  RichText(
                      text: TextSpan(children: [
                    const TextSpan(
                        text: "H", style: TextStyle(color: Colors.black)),
                    WidgetSpan(
                        child: Transform.translate(
                            offset: const Offset(0, 6),
                            child: const Text("2",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black))))
                  ])),
                  "Subscript is used for chemical formulas."),
              _buildTextCard(
                  "Scrollable Text",
                  const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                          "This is a long text that scrolls horizontally.")),
                  "Scrollable text allows viewing long content."),
              _buildTextCard(
                "Custom Font Text",
                Text(
                  "Custom Font",
                  style: GoogleFonts.lobster(
                    // Example using the Lobster font from Google Fonts
                    fontSize: 18,
                  ),
                ),
                "Custom font text uses a different font family from Google Fonts.",
              ),
              _buildTextCard(
                  "Gradient Text",
                  ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                              colors: [Colors.blue, Colors.green])
                          .createShader(bounds),
                      child: const Text("Gradient Text",
                          style: TextStyle(color: Colors.white, fontSize: 18))),
                  "Gradient text displays text with a color gradient."),
              _buildTextCard(
                  "Outlined Text",
                  const Text("Outlined Text",
                      style: TextStyle(shadows: [
                        Shadow(offset: Offset(-1.5, -1.5), color: Colors.black),
                        Shadow(offset: Offset(1.5, -1.5), color: Colors.black),
                        Shadow(offset: Offset(1.5, 1.5), color: Colors.black),
                        Shadow(offset: Offset(-1.5, 1.5), color: Colors.black)
                      ])),
                  "Outlined text has a stroke around it."),
              _buildTextCard(
                  "Shadowed Text",
                  const Text("Shadowed Text",
                      style: TextStyle(fontSize: 18, shadows: [
                        Shadow(
                            blurRadius: 3.0,
                            color: Colors.grey,
                            offset: Offset(2.0, 2.0))
                      ])),
                  "Shadowed text adds a shadow effect."),
              _buildTextCard(
                  "Selectable Text",
                  const SelectableText("This text can be selected.",
                      style: TextStyle(fontSize: 16)),
                  "Selectable text allows copying by user."),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextCard(String title, Widget content, String tooltip) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Tooltip(
              message: tooltip,
              child: Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center)),
          const SizedBox(height: 10),
          Expanded(child: Center(child: content))
        ]),
      ),
    );
  }
}
