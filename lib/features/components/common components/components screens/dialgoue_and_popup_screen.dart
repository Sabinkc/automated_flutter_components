import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: Text('Item 2'),
            ),
          ],
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
                    message:
                        'Opens a simple alert dialog with a title and message.',
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
                    message: 'Opens a dialog to confirm or cancel an action.',
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
                  'Full-screen Modal',
                  Tooltip(
                    message: 'Opens a full-screen modal dialog.',
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
                    message: 'This is a tooltip',
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Hover/double-tap'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Snackbar',
                  Tooltip(
                    message:
                        'Shows a brief message at the bottom of the screen.',
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              duration: Duration(milliseconds: 300),
                              content: Text('This is Snackbar Message')),
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
                  'Slide-over Panel',
                  Tooltip(
                    message: 'Displays a sliding panel overlay.',
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
                  'Custom Dialog',
                  Tooltip(
                    message: 'Displays a custom-styled dialog.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showCustomDialog(context);
                      },
                      child: const Text('Show Custom Dialog'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Multi-option Dialog',
                  Tooltip(
                    message: 'Displays multiple options for selection.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showMultiOptionDialog(context);
                      },
                      child: const Text('Show Multi-option Dialog'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Error Dialog',
                  Tooltip(
                    message: 'Displays an error message.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showErrorDialog(context);
                      },
                      child: const Text('Show Error Dialog'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Loading Dialog',
                  Tooltip(
                    message: 'Shows a loading indicator.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showLoadingDialog(context);
                      },
                      child: const Text('Show Loading Dialog'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
       
                _buildControlCard(
                  'Bottom Sheet',
                  Tooltip(
                    message: 'Displays a bottom sheet.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showBottomSheet(context);
                      },
                      child: const Text('Show Bottom Sheet'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Action Sheet',
                  Tooltip(
                    message: 'Displays a list of actions at the bottom.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showActionSheet(context);
                      },
                      child: const Text('Show Action Sheet'),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Animated Dialog',
                  Tooltip(
                    message: 'Shows a dialog with animation.',
                    child: ElevatedButton(
                      onPressed: () {
                        _showAnimatedDialog(context);
                      },
                      child: const Text('Show Animated Dialog'),
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

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade100, Colors.blue.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Dialog title with styled text
                Text(
                  'Custom Dialog',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900,
                  ),
                ),
                const SizedBox(height: 10),
                // Dialog description
                Text(
                  'This is a custom-styled dialog.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey.shade700,
                  ),
                ),
                const SizedBox(height: 20),
                // Horizontal divider
                Divider(color: Colors.blue.shade800),
                const SizedBox(height: 10),
                // Action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showMultiOptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Multi-option Dialog'),
          content: const Text('Choose an option:'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Option 1'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Option 2'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Option 3'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error', style: TextStyle(color: Colors.red)),
          content: const Text('An error has occurred.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showLoadingDialog(BuildContext context) {
    bool isLoading = true; // To control the dialog content

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            // Delayed to change dialog content after 1 second
            Future.delayed(const Duration(seconds: 1), () {
              if (isLoading) {
                setState(() {
                  isLoading = false;
                });
              }

              // Automatically dismiss dialog 1 second after showing success message
              Future.delayed(const Duration(seconds: 1), () {
                if (!isLoading && context.mounted) {
                  Navigator.of(context).pop();
                }
              });
            });

            return Dialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: isLoading
                    ? const SizedBox(
                        height: 60,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                          ],
                        ),
                      )
                    : const SizedBox(
                        height: 60,
                        child: Center(
                          child: Text(
                            'Loaded Successfully!',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
              ),
            );
          },
        );
      },
    );
  }



void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Makes the bottom sheet height customizable
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        height: MediaQuery.of(context).size.height * 0.75, // Adjust the height (75% of screen height)
        child: const Center(
          child: Text(
            'This is a bottom sheet',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    },
  );
}

  void _showActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              leading: const Icon(Icons.copy),
              title: const Text('Copy'),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              leading: const Icon(Icons.delete),
              title: const Text('Delete'),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

 void _showAnimatedDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    transitionDuration: const Duration(milliseconds: 500), // Increased duration for smoothness
    pageBuilder: (context, _, __) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            'Animated Dialog',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      // Define the animation for scaling and fading in
      var curve = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
      var scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(curve);
      var opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);

      return FadeTransition(
        opacity: opacityAnimation,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: child,
        ),
      );
    },
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
