import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class SelectionControlScreen extends StatefulWidget {
  const SelectionControlScreen({super.key});

  @override
  _SelectionControlsScreenState createState() =>
      _SelectionControlsScreenState();
}

class _SelectionControlsScreenState extends State<SelectionControlScreen> {
  bool _checkboxValue = true;
  String? _radioValue = 'Option 1';
  bool _toggleValue = true;
  final List<String> _selectedItems = [];
  double _sliderValue = 50;
  String _segmentedControlValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double iconSize = width > 800 ? height * 0.06 : height * 0.05;
    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Selection Controls",
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
                  'Checkbox',
                  Checkbox(
                    value: _checkboxValue,
                    onChanged: (bool? newValue) {
                      setState(() {
                        _checkboxValue = newValue!;
                      });
                      _delayedDialog(context, 'Checkbox',
                          "Checkboxes are used to select one or multiple options.");
                    },
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
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
                          _delayedDialog(context, 'Radio Button',
                              "Radio buttons allow users to select only one option.");
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
                ),
                _buildControlCard(
                  'Switch',
                  Switch(
                    value: _toggleValue,
                    onChanged: (bool newValue) {
                      setState(() {
                        _toggleValue = newValue;
                      });
                      _delayedDialog(context, 'Switch',
                          "Switches are used to toggle between on and off states.");
                    },
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Multi-select Dropdown',
                  DropdownButton<String>(
                    hint: const Text('Select Items'),
                    items: ['Item 1', 'Item 2', 'Item 3']
                        .map((String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null &&
                          !_selectedItems.contains(newValue)) {
                        setState(() {
                          _selectedItems.add(newValue);
                        });
                        _delayedDialog(context, 'Multi-select Dropdown',
                            "Multi-select dropdown allows selecting multiple items.");
                      }
                    },
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Range Slider',
                  Slider(
                    value: _sliderValue,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: _sliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _sliderValue = value;
                      });
                      _delayedDialog(context, 'Range Slider',
                          "Range sliders allow users to select a value within a range.");
                    },
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                ),
                _buildControlCard(
                  'Segmented Control',
                  ToggleButtons(
                    isSelected: [
                      _segmentedControlValue == 'Option 1',
                      _segmentedControlValue == 'Option 2',
                      _segmentedControlValue == 'Option 3',
                    ],
                    onPressed: (int index) {
                      setState(() {
                        _segmentedControlValue =
                            ['Option 1', 'Option 2', 'Option 3'][index];
                      });
                      _delayedDialog(context, 'Segmented Control',
                          "Segmented controls allow switching between different options.");
                    },
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text('Option 1'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text('Option 2'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text('Option 3'),
                      ),
                    ],
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

  void _delayedDialog(
      BuildContext context, String controlName, String description) {
    Future.delayed(const Duration(seconds: 1), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(controlName),
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
    });
  }

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
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: iconSize * 2,
              child: FittedBox(
                fit: BoxFit.contain,
                child: control,
              ),
            ),
          ],
        ),
      ),
    );
  }
}