// import 'package:components_automation/core/constants.dart';
// import 'package:flutter/material.dart';

// class ButtonScreen extends StatefulWidget {
//   const ButtonScreen({super.key});

//   @override
//   _ButtonScreenState createState() => _ButtonScreenState();
// }

// class _ButtonScreenState extends State<ButtonScreen> {
//   bool _checkboxValue = true;
//   String? _radioValue = 'Option 1'; // Nullable type for Radio value
//   bool _toggleValue = true;
//   String _dropdownValue = 'Option 1';

//   @override
//   Widget build(BuildContext context) {
//     // Getting screen width for responsiveness
//     double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Buttons", style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: CommonColor
//             .primaryColor, // Replace with CommonColor.primaryColor if defined
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
//         padding: const EdgeInsets.all(8.0),
//         child: GridView.count(
//           crossAxisCount: width > 600
//               ? 3
//               : 2, // Responsive: 3 items per row for larger screens
//           crossAxisSpacing: 8.0,
//           mainAxisSpacing: 8.0,
//           children: [
//             _buildButtonSection(
//                 'Elevated Button',
//                 ElevatedButton(
//                   onPressed: () {
//                     _showAlertDialog(context, "Elevated Button Pressed");
//                   },
//                   child: const Text('Elevated'),
//                 )),
//             _buildButtonSection(
//                 'Text Button',
//                 TextButton(
//                   onPressed: () {
//                     _showAlertDialog(context, "Text Button Pressed");
//                   },
//                   child: const Text('Text'),
//                 )),
//             _buildButtonSection(
//                 'Outlined Button',
//                 OutlinedButton(
//                   onPressed: () {
//                     _showAlertDialog(context, "Outlined Button Pressed");
//                   },
//                   child: const Text('Outlined'),
//                 )),
//             _buildButtonSection(
//                 'Icon Button',
//                 IconButton(
//                   onPressed: () {
//                     _showAlertDialog(context, "Icon Button Pressed");
//                   },
//                   icon: const Icon(Icons.favorite),
//                 )),
//             _buildButtonSection(
//                 'Floating Action Button',
//                 FloatingActionButton(
//                   onPressed: () {
//                     _showAlertDialog(context, "Floating Action Button Pressed");
//                   },
//                   child: const Icon(Icons.add),
//                 )),
//             _buildButtonSection(
//                 'Checkbox Button',
//                 Checkbox(
//                   value: _checkboxValue,
//                   onChanged: (bool? newValue) {
//                     setState(() {
//                       _checkboxValue = newValue!;
//                     });
//                   },
//                 )),
//             _buildButtonSection(
//                 'Radio Button',
//                 Column(
//                   children: [
//                     Radio<String>(
//                       value: 'Option 1',
//                       groupValue: _radioValue,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           _radioValue = newValue!;
//                         });
//                       },
//                     ),
//                     Radio<String>(
//                       value: 'Option 2',
//                       groupValue: _radioValue,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           _radioValue = newValue!;
//                         });
//                       },
//                     ),
//                   ],
//                 )),
//             _buildButtonSection(
//                 'Dropdown Button',
//                 DropdownButton<String>(
//                   value: _dropdownValue,
//                   items: <String>['Option 1', 'Option 2', 'Option 3']
//                       .map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       _dropdownValue = newValue!;
//                     });
//                   },
//                 )),
//             _buildButtonSection(
//                 'Toggle Button',
//                 Switch(
//                   value: _toggleValue,
//                   onChanged: (bool newValue) {
//                     setState(() {
//                       _toggleValue = newValue;
//                     });
//                   },
//                 )),
//             _buildButtonSection(
//               'Split Button',
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Title for the section

//                   const SizedBox(height: 10),
//                   // Row containing the PopupMenuButton and ElevatedButton
//                   Center(
//                     child: Row(
//                       mainAxisSize: MainAxisSize
//                           .min, // Makes the Row take up only as much space as needed
//                       children: [
//                         PopupMenuButton<String>(
//                           onSelected: (String value) {
//                             _showAlertDialog(context, 'Selected: $value');
//                           },
//                           itemBuilder: (BuildContext context) {
//                             return [
//                               'Save As PDF',
//                               'Save As DOCX',
//                               'Save As TXT'
//                             ].map((String choice) {
//                               return PopupMenuItem<String>(
//                                 value: choice,
//                                 child: Text(choice),
//                               );
//                             }).toList();
//                           },
//                         ),
//                         const SizedBox(width: 8),
//                         ElevatedButton(
//                           onPressed: () {
//                             _showAlertDialog(context, "Save Button Pressed");
//                           },
//                           child: const Text('Save'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // This function is used to show the alert dialog
//   void _showAlertDialog(BuildContext context, String buttonName) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(buttonName),
//           content: const Text("You pressed a button."),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: const Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildButtonSection(String title, Widget button) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(title,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         const SizedBox(height: 10),
//         button,
//       ],
//     );
//   }
// }

import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  _ButtonScreenState createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  bool _checkboxValue = true;
  String? _radioValue = 'Option 1'; // Nullable type for Radio value
  bool _toggleValue = true;
  String _dropdownValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    // Getting screen width for responsiveness
    double width = MediaQuery.of(context).size.width;

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: width > 600 ? 3 : 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: [
            _buildButtonCard(
              'Elevated Button',
              ElevatedButton(
                onPressed: () {
                  _showAlertDialog(context, "Elevated Button Pressed");
                },
                child: const Text('Elevated'),
              ),
            ),
            _buildButtonCard(
              'Text Button',
              TextButton(
                onPressed: () {
                  _showAlertDialog(context, "Text Button Pressed");
                },
                child: const Text('Text'),
              ),
            ),
            _buildButtonCard(
              'Outlined Button',
              OutlinedButton(
                onPressed: () {
                  _showAlertDialog(context, "Outlined Button Pressed");
                },
                child: const Text('Outlined'),
              ),
            ),
            _buildButtonCard(
              'Icon Button',
              IconButton(
                onPressed: () {
                  _showAlertDialog(context, "Icon Button Pressed");
                },
                icon: const Icon(Icons.favorite),
              ),
            ),
            _buildButtonCard(
              'Floating Action Button',
              FloatingActionButton(
                onPressed: () {
                  _showAlertDialog(context, "Floating Action Button Pressed");
                },
                child: const Icon(Icons.add),
              ),
            ),
            _buildButtonCard(
              'Checkbox Button',
              Checkbox(
                value: _checkboxValue,
                onChanged: (bool? newValue) {
                  setState(() {
                    _checkboxValue = newValue!;
                  });
                },
              ),
            ),
            _buildButtonCard(
              'Radio Button',
              Column(
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
                },
              ),
            ),
            _buildButtonCard(
              'Toggle Button',
              Switch(
                value: _toggleValue,
                onChanged: (bool newValue) {
                  setState(() {
                    _toggleValue = newValue;
                  });
                },
              ),
            ),
            _buildButtonCard(
              'Split Button',
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        PopupMenuButton<String>(
                          onSelected: (String value) {
                            _showAlertDialog(context, 'Selected: $value');
                          },
                          itemBuilder: (BuildContext context) {
                            return [
                              'Save As PDF',
                              'Save As DOCX',
                              'Save As TXT'
                            ].map((String choice) {
                              return PopupMenuItem<String>(
                                value: choice,
                                child: Text(choice),
                              );
                            }).toList();
                          },
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            _showAlertDialog(context, "Save Button Pressed");
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the alert dialog
  void _showAlertDialog(BuildContext context, String buttonName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(buttonName),
          content: const Text("You pressed a button."),
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

  // Function to wrap each button in a Card widget
  Widget _buildButtonCard(String title, Widget button) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            button,
          ],
        ),
      ),
    );
  }
}
