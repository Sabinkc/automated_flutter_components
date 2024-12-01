import 'dart:math';
import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  _ButtonScreenState createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  bool _markedCheckboxValue = true;
  bool _unMarkedCheckboxValue = false;
  String? _radioValue = 'Option 1';
  bool _ontoggleValue = true;
  bool _offtoggleValue = false;
  String _dropdownValue = 'Option 1';
  bool _isFavIconPressed = false;
  bool _isOutlinedButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double iconSize = width > 800 ? height * 0.06 : height * 0.05;
    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;
    double buttonSize = width > 800 ? 22 : 18;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RawScrollbar(
            thumbColor: CommonColor.secondaryColor,
            thumbVisibility: true,
            thickness: 4,
            radius: Radius.circular(8),
            child: GridView.count(
              crossAxisCount: width > 800 ? 5 : (width > 600 ? 3 : 2),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1,
              children: [
                _buildButtonCard(
                  'Elevated Button',
                  Tooltip(
                    message:
                        "An elevated button adds elevation to your button.",
                    child: ElevatedButton(
                      onPressed: () async {
                        await _handleElevatedButtonPress(context);
                      },
                      child: Text(
                        'Press me',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),

                _buildButtonCard(
                  'Text Button',
                  Tooltip(
                    message:
                        "A text button displays only text with no background.",
                    child: TextButton(
                      onPressed: () async {
                        final Uri url = Uri.parse(
                            'https://www.youtube.com/'); // Use Uri.parse
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
                      child: Text(
                        'Open youtube',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),

                _buildButtonCard(
                  'Outlined Button',
                  Tooltip(
                    message: "An outlined button adds borders to the button.",
                    child: OutlinedButton(
                      onPressed: () {
                        setState(() {
                          _isOutlinedButtonPressed = !_isOutlinedButtonPressed;
                        });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.resolveWith<Color>((states) {
                          return _isOutlinedButtonPressed
                              ? Colors.blue
                              : Colors.transparent;
                        }),
                        side: WidgetStateProperty.resolveWith<BorderSide>(
                            (states) {
                          return BorderSide(
                              color: _isOutlinedButtonPressed
                                  ? Colors.blue
                                  : Colors.black);
                        }),
                      ),
                      child: Text(
                        'Change my color',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),

                _buildButtonCard(
                  'Icon Button',
                  Tooltip(
                    message:
                        "An icon button displays an icon as a clickable button.",
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          // Toggle the color of the icon
                          _isFavIconPressed = !_isFavIconPressed;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: _isFavIconPressed
                            ? Colors.red
                            : null, // Change color on press
                      ),
                      iconSize: iconSize,
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),

// Declare a boolean variable to track the icon state

                _buildButtonCard(
                  'Floating Action Button',
                  Tooltip(
                    message:
                        "A floating action button is a circular button that floats above the content.",
                    child: FloatingActionButton(
                      onPressed: () {
                        // Show the alert dialog when FAB is pressed
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: const Text(
                                  'You pressed the floating action button!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: const Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),

                _buildButtonCard(
                  'Checkbox Button (Marked)',
                  Tooltip(
                    message:
                        "A checkbox allows users to select multiple options from a set.",
                    child: Checkbox(
                      value: _markedCheckboxValue,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _markedCheckboxValue = newValue!;
                        });
                      },
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
                _buildButtonCard(
                  'Checkbox Button (Unmarked)',
                  Tooltip(
                    message:
                        "A checkbox allows users to select multiple options from a set.",
                    child: Checkbox(
                      value: _unMarkedCheckboxValue,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _unMarkedCheckboxValue = newValue!;
                        });
                      },
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
                _buildButtonCard(
                  'Radio Button',
                  Tooltip(
                    message:
                        "A radio button allows selecting one option from a set.",
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<String>(
                          value: 'Option 1',
                          groupValue: _radioValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              _radioValue = newValue!;
                            });
                          },
                        ),
                        Radio<String>(
                          value: 'Option 2',
                          groupValue: _radioValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              _radioValue = newValue!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
                _buildButtonCard(
                  'Dropdown Button',
                  Tooltip(
                    message: "A dropdown button shows a list of options.",
                    child: DropdownButton<String>(
                      value: _dropdownValue,
                      items: <String>['Option 1', 'Option 2', 'Option 3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _dropdownValue = newValue!;
                        });
                      },
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
                _buildButtonCard(
                  'Toggle Button (On)',
                  Tooltip(
                    message:
                        "A toggle switch is used to turn options on or off.",
                    child: Switch(
                      value: _ontoggleValue,
                      onChanged: (bool newValue) {
                        setState(() {
                          _ontoggleValue = newValue;
                        });
                      },
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
                _buildButtonCard(
                  'Toggle Button (Off)',
                  Tooltip(
                    message:
                        "A toggle switch is used to turn options on or off.",
                    child: Switch(
                      value: _offtoggleValue,
                      onChanged: (bool newValue) {
                        setState(() {
                          _offtoggleValue = newValue;
                        });
                      },
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonCard(
    String title,
    Widget button,
    double iconSize,
    double cardPadding,
    double titleFontSize,
    double buttonSize,
  ) {
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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              title,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: buttonSize * 4,
              height: buttonSize * 2.5,
              child: FittedBox(
                fit: BoxFit.contain,
                child: button,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleElevatedButtonPress(BuildContext context) async {
    // Show the dialog with the circular progress indicator
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        );
      },
    );

    // Simulate a 3-second delay before showing the success message
    await Future.delayed(const Duration(seconds: 3));

    // Close the progress dialog
    Navigator.of(context).pop();

    // Show the final success message after the progress indicator
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Elevated button pressed!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}
