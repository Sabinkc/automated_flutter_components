
import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  _ButtonScreenState createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  bool _checkboxValue = true;
  String? _radioValue = 'Option 1';
  bool _toggleValue = true;
  String _dropdownValue = 'Option 1';

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
              CommonColor.primaryColorLight
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: RawScrollbar(
          thumbColor: CommonColor.secondaryColor,
          thumbVisibility: true,
          thickness: 8,
          radius: Radius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              crossAxisCount: width > 800 ? 4 : (width > 600 ? 3 : 2),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1,
              children: [
                _buildButtonCard(
                  'Elevated Button',
                  ElevatedButton(
                    onPressed: () {
                      _showAlertDialog(context, 'Elevated Button',
                          "An elevated button has a shadow and is used for primary actions.");
                    },
                    child: const Text('Elevated'),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
                _buildButtonCard(
                  'Text Button',
                  TextButton(
                    onPressed: () {
                      _showAlertDialog(context, 'Text Button',
                          "A text button is a flat button, often used for less emphasized actions.");
                    },
                    child: const Text('Text'),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
                _buildButtonCard(
                  'Outlined Button',
                  OutlinedButton(
                    onPressed: () {
                      _showAlertDialog(context, 'Outlined Button',
                          "An outlined button has a border and is used for medium emphasis actions.");
                    },
                    child: const Text('Outlined'),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
                _buildButtonCard(
                  'Icon Button',
                  IconButton(
                    onPressed: () {
                      _showAlertDialog(context, 'Icon Button',
                          "An icon button contains only an icon and is used for quick actions.");
                    },
                    icon: const Icon(Icons.favorite),
                    iconSize: iconSize,
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
                _buildButtonCard(
                  'Floating Action Button',
                  FloatingActionButton(
                    onPressed: () {
                      _showAlertDialog(context, 'Floating Action Button',
                          "A floating action button is circular and is used for primary floating actions.");
                    },
                    child: const Icon(Icons.add),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
                _buildButtonCard(
                  'Checkbox Button',
                  Checkbox(
                    value: _checkboxValue,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _checkboxValue = newValue!;
                      });
                      Future.delayed(const Duration(seconds: 1), () {
                        _showAlertDialog(context, 'Checkbox Button',
                            "A checkbox allows users to select multiple options from a set.");
                      });
                    },
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
                _buildButtonCard(
                  'Radio Button',
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio<String>(
                        value: 'Option 1',
                        groupValue: _radioValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            _radioValue = newValue!;
                          });
                          Future.delayed(const Duration(seconds: 1), () {
                            _showAlertDialog(context, 'Radio Button',
                                "A radio button allows selecting one option from a set.");
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
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
                _buildButtonCard(
                  'Dropdown Button',
                  DropdownButton<String>(
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
                      Future.delayed(const Duration(seconds: 1), () {
                        _showAlertDialog(context, 'Dropdown Button',
                            "A dropdown button shows a list of options.");
                      });
                    },
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                ),
                _buildButtonCard(
                  'Toggle Button',
                  Switch(
                    value: _toggleValue,
                    onChanged: (bool newValue) {
                      setState(() {
                        _toggleValue = newValue;
                      });
                      Future.delayed(const Duration(seconds: 1), () {
                        _showAlertDialog(context, 'Toggle Button',
                            "A toggle switch is used to turn options on or off.");
                      });
                    },
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

  void _showAlertDialog(
      BuildContext context, String buttonName, String description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(buttonName),
          content: Text(description),
          actions: <Widget>[
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

  Widget _buildButtonCard(String title, Widget button, double iconSize,
      double cardPadding, double titleFontSize, double buttonSize) {
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
}
