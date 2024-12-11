import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class DialgoueAndPopupScreen extends StatefulWidget {
  const DialgoueAndPopupScreen({super.key});

  @override
  _DialogComponentsScreenState createState() => _DialogComponentsScreenState();
}

class _DialogComponentsScreenState extends State<DialgoueAndPopupScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double iconSize = width > 800 ? height * 0.06 : height * 0.05;
    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog Components",
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
                _buildControlCard(
                  'Alert Dialog',
                  Tooltip(
                    message: 'Shows an alert dialog with a simple message.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showAlertDialog(context);
                      },
                      child: const Text('Show Alert Dialog'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Confirmation Dialog',
                  Tooltip(
                    message: 'Displays a dialog asking for confirmation.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showConfirmationDialog(context);
                      },
                      child: const Text('Show Confirmation Dialog'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Modal Dialog',
                  Tooltip(
                    message: 'Shows a modal dialog with simple content.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showModalDialog(context);
                      },
                      child: const Text('Show Modal Dialog'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Full-screen Modal',
                  Tooltip(
                    message: 'Displays a full-screen modal bottom sheet.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showFullScreenModal(context);
                      },
                      child: const Text('Show Full-screen Modal'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Tooltip',
                  Tooltip(
                    message: 'Shows a message when the button is tapped.',
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Tooltip Shown!')),
                        );
                      },
                      child: const Text('Show Tooltip'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Snackbar',
                  Tooltip(
                    message: 'Displays a Snackbar message at the bottom.',
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Snackbar Message')),
                        );
                      },
                      child: const Text('Show Snackbar'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Toast',
                  Tooltip(
                    message:
                        'Displays a toast message (using third-party packages).',
                    child: ElevatedButton(
                      onPressed: () {
                        // Toast functionality can be implemented using third-party packages like fluttertoast
                      },
                      child: const Text('Show Toast'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Slide-over Panel',
                  Tooltip(
                    message: 'Shows a slide-over panel dialog.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showSlideOverPanel(context);
                      },
                      child: const Text('Show Slide-over Panel'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Drawer Overlay',
                  Tooltip(
                    message: 'Opens a drawer overlay.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showDrawerOverlay(context);
                      },
                      child: const Text('Show Drawer Overlay'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Pop-up Menu',
                  Tooltip(
                    message: 'Displays a pop-up menu with options.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showPopUpMenu(context);
                      },
                      child: const Text('Show Pop-up Menu'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Alert Dialog
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert Dialog'),
          content: const Text('This is an alert dialog.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Confirmation Dialog
  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text('Do you want to continue?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Modal Dialog
  void _showModalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Modal Dialog'),
          children: <Widget>[
            const Text('This is a simple modal dialog'),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Full-screen Modal
  void _showFullScreenModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.blue[100],
          child: const Center(child: Text('Full-screen Modal')),
        );
      },
    );
  }

  // Slide-over Panel
  void _showSlideOverPanel(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            color: Colors.green[200],
            height: 200,
            width: double.infinity,
            child: const Center(child: Text('Slide-over Panel')),
          ),
        );
      },
    );
  }

  // Drawer Overlay
  void _showDrawerOverlay(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  // Pop-up Menu
  void _showPopUpMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        const PopupMenuItem<String>(
          value: 'Option 1',
          child: Text('Option 1'),
        ),
        const PopupMenuItem<String>(
          value: 'Option 2',
          child: Text('Option 2'),
        ),
      ],
      elevation: 8.0,
    );
  }

  // Generic function to build control cards
  Widget _buildControlCard(String title, Widget control, double iconSize,
      double cardPadding, double titleFontSize) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: titleFontSize, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            control,
          ],
        ),
      ),
    );
  }
}
