// import 'dart:math';
// import 'package:components_automation/core/constants.dart';
// import 'package:components_automation/features/home/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ButtonScreen extends StatefulWidget {
//   const ButtonScreen({super.key});

//   @override
//   _ButtonScreenState createState() => _ButtonScreenState();
// }

// class _ButtonScreenState extends State<ButtonScreen> {
//   bool _markedCheckboxValue = true;
//   bool _unMarkedCheckboxValue = false;
//   String? _radioValue = 'Option 1';
//   bool _ontoggleValue = true;
//   bool _offtoggleValue = false;
//   String _dropdownValue = 'Option 1';
//   bool _isFavIconPressed = false;
//   bool _isOutlinedButtonPressed = false;
//   bool _isHoveringHoverbutton = false;
//   bool _firstCheckboxValue = false;
//   bool _secondCheckboxValue = false;
//   String? _radioValueMarked = 'Option 1';
//   String? _radioValueUnmarked = null;
//   String? _selectedGender;

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     double iconSize = width > 800 ? height * 0.06 : height * 0.05;
//     double cardPadding = 5;
//     double titleFontSize = width > 800 ? 18 : 16;
//     double buttonSize = 30;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Buttons", style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: CommonColor.primaryColor,
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
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               CommonColor.primaryColorDark,
//               CommonColor.primaryColorLight,
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: RawScrollbar(
//             thumbColor: CommonColor.secondaryColor,
//             thumbVisibility: true,
//             thickness: 4,
//             radius: Radius.circular(8),
//             child: GridView.count(
//               crossAxisCount: width > 1000
//                   ? 5
//                   : width > 800
//                       ? 4
//                       : (width > 600 ? 3 : 2),
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//               childAspectRatio: 1,
//               children: [
//                 _buildButtonCard(
//                   'Elevated Button',

//                   Tooltip(
//                     message:
//                         "An elevated button adds elevation to your button.",
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         await _handleElevatedButtonPress(context);
//                       },
//                       child: Text(
//                         'Load data',
//                         style: TextStyle(
//                             // fontSize: 30,
//                             ),
//                       ),
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),

//                 _buildButtonCard(
//                   'Text Button',
//                   Tooltip(
//                     message:
//                         "A text button displays only text with no background.",
//                     child: TextButton(
//                       onPressed: () async {
//                         final Uri url = Uri.parse(
//                             'https://www.youtube.com/'); // Use Uri.parse
//                         try {
//                           // Check if the URL can be launched
//                           if (await canLaunchUrl(url)) {
//                             // Launch the URL
//                             await launchUrl(url);
//                           } else {
//                             throw 'Could not launch $url';
//                           }
//                         } catch (e) {
//                           // Show a snackbar with error message
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text('Error occurred: $e')),
//                           );
//                         }
//                       },
//                       child: Text(
//                         'Open youtube',
//                         style: TextStyle(
//                             // fontSize: 30,
//                             ),
//                       ),
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),

//                 _buildButtonCard(
//                   'Outlined Button',
//                   Tooltip(
//                     message: "An outlined button adds borders to the button.",
//                     child: OutlinedButton(
//                       onPressed: () {
//                         setState(() {
//                           _isOutlinedButtonPressed = !_isOutlinedButtonPressed;
//                         });
//                       },
//                       style: ButtonStyle(
//                         backgroundColor:
//                             WidgetStateProperty.resolveWith<Color>((states) {
//                           return _isOutlinedButtonPressed
//                               ? Colors.blue
//                               : Colors.transparent;
//                         }),
//                         side: WidgetStateProperty.resolveWith<BorderSide>(
//                             (states) {
//                           return BorderSide(
//                               color: _isOutlinedButtonPressed
//                                   ? Colors.blue
//                                   : Colors.black);
//                         }),
//                       ),
//                       child: Text(
//                         'Change my color',
//                         style: TextStyle(
//                           fontSize: 30,
//                         ),
//                       ),
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),

//                 _buildButtonCard(
//                   'Icon Button',
//                   Tooltip(
//                     message:
//                         "An icon button displays an icon as a clickable button.",
//                     child: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           // Toggle the color of the icon
//                           _isFavIconPressed = !_isFavIconPressed;
//                         });
//                       },
//                       icon: Icon(
//                         Icons.favorite,
//                         color: _isFavIconPressed
//                             ? Colors.red
//                             : null, // Change color on press
//                       ),
//                       iconSize: iconSize,
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),

// // Declare a boolean variable to track the icon state

//                 _buildButtonCard(
//                   'Floating Action Button',
//                   Tooltip(
//                     message:
//                         "A floating action button is a circular button that floats above the content.",
//                     child: FloatingActionButton(
//                       onPressed: () {
//                         // Show the alert dialog when FAB is pressed
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               content: const Text(
//                                   'You pressed the floating action button!'),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.pop(context); // Close the dialog
//                                   },
//                                   child: const Text('Ok'),
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                       child: const Icon(Icons.add),
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),

//                 // Checkbox Button (Marked)
//                 _buildButtonCard(
//                   'Checkbox Button (Marked)',
//                   Tooltip(
//                     message:
//                         "A checkbox allows users to select multiple options from a set.",
//                     child: Checkbox(
//                       value: true, // Set to true to make it marked
//                       onChanged: null, // No state change on tap (static)
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),

// // Checkbox Button (Unmarked)
//                 _buildButtonCard(
//                   'Checkbox Button (Unmarked)',
//                   Tooltip(
//                     message:
//                         "A checkbox allows users to select multiple options from a set.",
//                     child: Checkbox(
//                       value: false, // Set to false to make it unmarked
//                       onChanged: null, // No state change on tap (static)
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),

//                 _buildButtonCard(
//                   'Combined checkbox',
//                   Column(
//                     children: [
//                       // Title at the top
//                       Text(
//                         'Favourite foods:',
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),

//                       // First Row with two checkboxes side by side
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment
//                             .spaceEvenly, // Space between checkboxes
//                         children: [
//                           // Apple Checkbox
//                           Tooltip(
//                             message:
//                                 "A checkbox allows users to select multiple options from a set.",
//                             child: Row(
//                               children: [
//                                 Text(
//                                   'Apple',
//                                   style: TextStyle(fontSize: 30),
//                                 ),
//                                 Checkbox(
//                                   value:
//                                       _firstCheckboxValue, // Initially unticked
//                                   onChanged: (bool? newValue) {
//                                     setState(() {
//                                       _firstCheckboxValue = newValue!;
//                                     });
//                                     if (_firstCheckboxValue) {
//                                       _showFunFactDialog('Apple',
//                                           'Apples are a great source of fiber and vitamin C!');
//                                     }
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // Banana Checkbox
//                           Tooltip(
//                             message:
//                                 "A checkbox allows users to select multiple options from a set.",
//                             child: Row(
//                               children: [
//                                 Text('Banana', style: TextStyle(fontSize: 30)),
//                                 Checkbox(
//                                   value:
//                                       _secondCheckboxValue, // Initially unticked
//                                   onChanged: (bool? newValue) {
//                                     setState(() {
//                                       _secondCheckboxValue = newValue!;
//                                     });
//                                     if (_secondCheckboxValue) {
//                                       _showFunFactDialog('Banana',
//                                           'Bananas are rich in potassium and help maintain heart health!');
//                                     }
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   iconSize,
//                   2,
//                   titleFontSize,
//                   buttonSize * 1.4,
//                 ),

//                 _buildButtonCard(
//                   'Radio Button (Marked)',
//                   Tooltip(
//                     message:
//                         "A radio button allows selecting one option from a set.",
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Radio<String>(
//                           value: 'Option 1',
//                           groupValue:
//                               'Option 1', // The value matches the selected option, so this button is marked
//                           onChanged: null, // No state change when tapped
//                         ),
//                       ],
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),

// // Radio Button Component (Unmarked)
//                 _buildButtonCard(
//                   'Radio Button (Unmarked)',
//                   Tooltip(
//                     message:
//                         "A radio button allows selecting one option from a set.",
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Radio<String>(
//                           value: 'Option 2',
//                           groupValue: null, // Set to null, making it unmarked
//                           onChanged: null, // No state change when tapped
//                         ),
//                       ],
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),

//                 _buildButtonCard(
//                   'Combined radio button',
//                   Column(
//                     children: [
//                       // Title at the top
//                       Text(
//                         'Your gender:',
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),

//                       // First Row with two radio buttons side by side
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment
//                             .spaceEvenly, // Space between radio buttons
//                         children: [
//                           // Male Radio Button
//                           Tooltip(
//                             message:
//                                 "A radio button allows selecting one option from a set.",
//                             child: Row(
//                               children: [
//                                 Text('Male', style: TextStyle(fontSize: 25)),
//                                 Radio<String>(
//                                   value: 'Male', // Option value for Male
//                                   groupValue:
//                                       _selectedGender, // Current selected value
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       _selectedGender = newValue!;
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),

//                           // Female Radio Button
//                           Tooltip(
//                             message:
//                                 "A radio button allows selecting one option from a set.",
//                             child: Row(
//                               children: [
//                                 Text('Female', style: TextStyle(fontSize: 25)),
//                                 Radio<String>(
//                                   value: 'Female', // Option value for Female
//                                   groupValue:
//                                       _selectedGender, // Current selected value
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       _selectedGender = newValue!;
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   iconSize,
//                   2,
//                   titleFontSize,
//                   buttonSize * 1.4,
//                 ),

//                 _buildButtonCard(
//                   'Dropdown Button',
//                   Tooltip(
//                     message: "A dropdown button shows a list of options.",
//                     child: DropdownButton<String>(
//                       value: _dropdownValue,
//                       items: <String>['Option 1', 'Option 2', 'Option 3']
//                           .map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           _dropdownValue = newValue!;
//                         });
//                       },
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),
//                 _buildButtonCard(
//                   'Toggle Button (On)',
//                   Tooltip(
//                     message:
//                         "A toggle switch is used to turn options on or off.",
//                     child: Switch(
//                       value: _ontoggleValue,
//                       onChanged: (bool newValue) {
//                         setState(() {
//                           _ontoggleValue = newValue;
//                         });
//                       },
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),
//                 _buildButtonCard(
//                   'Toggle Button (Off)',
//                   Tooltip(
//                     message:
//                         "A toggle switch is used to turn options on or off.",
//                     child: Switch(
//                       value: _offtoggleValue,
//                       onChanged: (bool newValue) {
//                         setState(() {
//                           _offtoggleValue = newValue;
//                         });
//                       },
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),

//                 _buildButtonCard(
//                   'Popup Menu Button',
//                   Tooltip(
//                     message:
//                         "A button that shows a menu with a list of options.",
//                     child: PopupMenuButton<String>(
//                       onSelected: (String value) {
//                         // Handle the selected value
//                         print('Selected option: $value');

//                         // Show the dialog after a menu item is selected
//                         _showSelectionDialog(value);
//                       },
//                       itemBuilder: (BuildContext context) {
//                         return [
//                           PopupMenuItem(value: 'Menu 1', child: Text('Menu 1')),
//                           PopupMenuItem(value: 'Menu 2', child: Text('Menu 2')),
//                           PopupMenuItem(value: 'Menu 3', child: Text('Menu 3')),
//                         ];
//                       },
//                       child: Icon(Icons.menu),
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),

//                 _buildButtonCard(
//                   'Double tap button',
//                   Tooltip(
//                     message: "Performs action on double tap.",
//                     child: GestureDetector(
//                       onDoubleTap: () {
//                         // Delay the snackbar display by 2 seconds
//                         Future.delayed(Duration(seconds: 2), () {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: const Text(
//                                   'You just double-tapped the button!'),
//                               duration: Duration(seconds: 2),
//                             ),
//                           );
//                         });
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(20),
//                         color: Colors.blue,
//                         child: Text(
//                           'Show delayed snackbar',
//                           style: TextStyle(fontSize: 30, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),

//                 _buildButtonCard(
//                   'Long Press Button',
//                   Tooltip(
//                     message: "Performs action on long press.",
//                     child: GestureDetector(
//                       onLongPress: () {
//                         // Show the prompt dialog on long press
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             TextEditingController _controller =
//                                 TextEditingController();
//                             return AlertDialog(
//                               title: Text('Enter Your Name:'),
//                               content: TextField(
//                                 controller: _controller,
//                                 decoration: InputDecoration(
//                                     hintText: 'Enter your name'),
//                               ),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () {
//                                     // Retrieve the input and display it in the SnackBar
//                                     String result = _controller.text;
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                         content: Text('Hello $result'),
//                                         duration: Duration(seconds: 2),
//                                       ),
//                                     );
//                                     Navigator.pop(context); // Close the dialog
//                                   },
//                                   child: Text('Submit'),
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(20),
//                         color: Colors.blue,
//                         child: Text(
//                           'Open prompt box',
//                           style: TextStyle(fontSize: 30, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),

//                 _buildButtonCard(
//                   'Disabled Button',
//                   Tooltip(
//                     message: "A button that is disabled and unclickable.",
//                     child: ElevatedButton(
//                       onPressed: null, // Disabled button
//                       child: Text(
//                         'Click me',
//                         style: TextStyle(fontSize: 30),
//                       ),
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),
//                 _buildButtonCard(
//                   'Hover Button',
//                   Tooltip(
//                     message: "Changes appearance on hover.",
//                     child: MouseRegion(
//                       onEnter: (_) {
//                         // Handle hover enter
//                         print('Mouse entered');
//                         // Update the button color on hover
//                         _isHoveringHoverbutton = true;
//                         setState(() {});
//                       },
//                       onExit: (_) {
//                         // Handle hover exit
//                         print('Mouse exited');
//                         // Revert the button color when not hovering
//                         _isHoveringHoverbutton = false;
//                         setState(() {});
//                       },
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: _isHoveringHoverbutton
//                               ? Colors.purple
//                               : Colors.blue,
//                         ),
//                         onPressed: () {
//                           // Show Alert Dialog when button is pressed
//                           showDialog(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return AlertDialog(
//                                 title: Text('Button Pressed'),
//                                 content:
//                                     Text('You have clicked the Hover Button!'),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.pop(
//                                           context); // Close the dialog
//                                     },
//                                     child: Text('OK'),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                           print('Hovered Button Pressed');
//                         },
//                         child: Text(
//                           'Hover Me',
//                           style: TextStyle(fontSize: 30, color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),
//                 _buildButtonCard(
//                   'Customised Button',
//                   Tooltip(
//                     message: "A button with personalised design and behaviour",
//                     child: InkWell(
//                       onTap: () {
//                         // Navigate to the home page on button press
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   HomeScreen()), // Replace 'HomePage' with your actual home page widget
//                         );
//                       },
//                       splashColor: Colors.pinkAccent.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(15),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [Colors.blueAccent, Colors.purpleAccent],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.2),
//                               offset: Offset(4, 4),
//                               blurRadius: 10,
//                               spreadRadius: 1,
//                             ),
//                             BoxShadow(
//                               color: Colors.white.withOpacity(0.1),
//                               offset: Offset(-4, -4),
//                               blurRadius: 10,
//                               spreadRadius: 1,
//                             ),
//                           ],
//                         ),
//                         padding:
//                             EdgeInsets.symmetric(vertical: 20, horizontal: 40),
//                         child: Center(
//                           child: Text(
//                             'Go to HomeScreen',
//                             style: TextStyle(
//                               fontSize: 24,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               shadows: [
//                                 Shadow(
//                                   color: Colors.black.withOpacity(0.3),
//                                   offset: Offset(2, 2),
//                                   blurRadius: 5,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                   buttonSize,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildButtonCard(
//     String title,
//     Widget button,
//     double iconSize,
//     double cardPadding,
//     double titleFontSize,
//     double buttonSize,

//   ) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(cardPadding),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               title,
//               style: TextStyle(
//                 fontSize: titleFontSize,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 5),
//             SizedBox(
//               width: buttonSize * 4,
//               height: buttonSize * 2.5,
//               child: FittedBox(
//                 fit: BoxFit.contain,
//                 child: button,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to display the fun fact dialog
//   void _showFunFactDialog(String food, String fact) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('$food Fun Fact'),
//           content: Text(fact),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Function to show the dialog
//   void _showSelectionDialog(String selectedMenu) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Selected Menu'),
//           content: Text('You selected: $selectedMenu'),
//         );
//       },
//     );

//     // Automatically close the dialog after 1 second
//     Future.delayed(Duration(seconds: 1), () {
//       Navigator.of(context).pop(); // Close the dialog
//     });
//   }

//   Future<void> _handleElevatedButtonPress(BuildContext context) async {
//     // Show the dialog with the circular progress indicator
//     showDialog(
//       context: context,
//       barrierDismissible: false, // Prevent dismissing by tapping outside
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               CircularProgressIndicator(),
//             ],
//           ),
//         );
//       },
//     );

//     // Simulate a 3-second delay before showing the success message
//     await Future.delayed(const Duration(seconds: 3));

//     // Close the progress dialog
//     Navigator.of(context).pop();

//     // Show the final success message after the progress indicator
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: const Text('Data loaded successfully!'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text("Ok"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'dart:math';
import 'package:components_automation/core/constants.dart';
import 'package:components_automation/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  _ButtonScreenState createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  final bool _markedCheckboxValue = true;
  final bool _unMarkedCheckboxValue = false;
  final String _radioValue = 'Option 1';
  bool _ontoggleValue = true;
  bool _offtoggleValue = false;
  String _dropdownValue = 'Option 1';
  bool _isFavIconPressed = false;
  bool _isOutlinedButtonPressed = false;
  bool _isHoveringHoverbutton = false;
  bool _firstCheckboxValue = false;
  bool _secondCheckboxValue = false;
  final String _radioValueMarked = 'Option 1';
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double iconSize = width > 800 ? height * 0.06 : height * 0.05;
    double cardPadding = 5;
    double titleFontSize = width > 800 ? 18 : 16;
    double buttonSize = 30;

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
            radius: const Radius.circular(8),
            child: GridView.count(
              crossAxisCount: width > 1000
                  ? 5
                  : width > 800
                      ? 4
                      : (width > 600 ? 3 : 2),
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
                      child: const Text(
                        'Load data',
                        style: TextStyle(
                            // fontSize: 30,
                            ),
                      ),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                  const Key('elevated_button'),
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
                      child: const Text(
                        'Open youtube',
                        style: TextStyle(
                            // fontSize: 30,
                            ),
                      ),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                  const Key('text_button'),
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
                      child: const Text(
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
                  const Key('outlined_button'),
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
                  const Key('icon_button'),
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
                  const Key('floating_action_button'),
                ),

                // Checkbox Button (Marked)
                _buildButtonCard(
                  'Checkbox Button (Marked)',
                  const Tooltip(
                    message:
                        "A checkbox allows users to select multiple options from a set.",
                    child: Checkbox(
                      value: true, // Set to true to make it marked
                      onChanged: null, // No state change on tap (static)
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                  const Key('marked_checkbox_button'),
                ),

// Checkbox Button (Unmarked)
                _buildButtonCard(
                  'Checkbox Button (Unmarked)',
                  const Tooltip(
                    message:
                        "A checkbox allows users to select multiple options from a set.",
                    child: Checkbox(
                      value: false, // Set to false to make it unmarked
                      onChanged: null, // No state change on tap (static)
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                  const Key('unmarked_checkbox_button'),
                ),

                _buildButtonCard(
                  'Combined checkbox',
                  Column(
                    children: [
                      // Title at the top
                      const Text(
                        'Favourite foods:',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // First Row with two checkboxes side by side
                      Column(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceEvenly, // Space between checkboxes
                        children: [
                          // Apple Checkbox
                          Tooltip(
                            message:
                                "A checkbox allows users to select multiple options from a set.",
                            child: Row(
                              children: [
                                const Text(
                                  'Apple',
                                  style: TextStyle(fontSize: 30),
                                ),
                                Checkbox(
                                  value:
                                      _firstCheckboxValue, // Initially unticked
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      _firstCheckboxValue = newValue!;
                                    });
                                    if (_firstCheckboxValue) {
                                      _showFunFactDialog('Apple',
                                          'Apples are a great source of fiber and vitamin C!');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),

                          // Banana Checkbox
                          Tooltip(
                            message:
                                "A checkbox allows users to select multiple options from a set.",
                            child: Row(
                              children: [
                                const Text('Banana', style: TextStyle(fontSize: 30)),
                                Checkbox(
                                  value:
                                      _secondCheckboxValue, // Initially unticked
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      _secondCheckboxValue = newValue!;
                                    });
                                    if (_secondCheckboxValue) {
                                      _showFunFactDialog('Banana',
                                          'Bananas are rich in potassium and help maintain heart health!');
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  iconSize,
                  2,
                  titleFontSize,
                  buttonSize * 1.4,
                  const Key('combined_checkbox_button'),
                ),

                _buildButtonCard(
                  'Radio Button (Marked)',
                  const Tooltip(
                    message:
                        "A radio button allows selecting one option from a set.",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<String>(
                          value: 'Option 1',
                          groupValue:
                              'Option 1', // The value matches the selected option, so this button is marked
                          onChanged: null, // No state change when tapped
                        ),
                      ],
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                  const Key('marked_radio_button'),
                ),

// Radio Button Component (Unmarked)
                _buildButtonCard(
                  'Radio Button (Unmarked)',
                  const Tooltip(
                    message:
                        "A radio button allows selecting one option from a set.",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<String>(
                          value: 'Option 2',
                          groupValue: null, // Set to null, making it unmarked
                          onChanged: null, // No state change when tapped
                        ),
                      ],
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                  const Key('unmarkedradio_button'),
                ),

                _buildButtonCard(
                  'Combined radio button',
                  Column(
                    children: [
                      // Title at the top
                      const Text(
                        'Your gender:',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // First Row with two radio buttons side by side
                      Column(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceEvenly, // Space between radio buttons
                        children: [
                          // Male Radio Button
                          Tooltip(
                            message:
                                "A radio button allows selecting one option from a set.",
                            child: Row(
                              children: [
                                const Text('Male', style: TextStyle(fontSize: 25)),
                                Radio<String>(
                                  value: 'Male', // Option value for Male
                                  groupValue:
                                      _selectedGender, // Current selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedGender = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),

                          // Female Radio Button
                          Tooltip(
                            message:
                                "A radio button allows selecting one option from a set.",
                            child: Row(
                              children: [
                                const Text('Female', style: TextStyle(fontSize: 25)),
                                Radio<String>(
                                  value: 'Female', // Option value for Female
                                  groupValue:
                                      _selectedGender, // Current selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      _selectedGender = newValue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  iconSize,
                  2,
                  titleFontSize,
                  buttonSize * 1.4,
                  const Key('combinedradio_button'),
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
                  const Key('dropdown_button'),
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
                  const Key('toogleon_button'),
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
                  const Key('toogleoff_button'),
                ),

                _buildButtonCard(
                  'Popup Menu Button',
                  Tooltip(
                    message:
                        "A button that shows a menu with a list of options.",
                    child: PopupMenuButton<String>(
                      onSelected: (String value) {
                        // Handle the selected value
                        print('Selected option: $value');

                        // Show the dialog after a menu item is selected
                        _showSelectionDialog(value);
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          const PopupMenuItem(value: 'Menu 1', child: Text('Menu 1')),
                          const PopupMenuItem(value: 'Menu 2', child: Text('Menu 2')),
                          const PopupMenuItem(value: 'Menu 3', child: Text('Menu 3')),
                        ];
                      },
                      child: const Icon(Icons.menu),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                  const Key('popup_button'),
                ),

                _buildButtonCard(
                  'Double tap button',
                  Tooltip(
                    message: "Performs action on double tap.",
                    child: GestureDetector(
                      onDoubleTap: () {
                        // Delay the snackbar display by 2 seconds
                        Future.delayed(const Duration(seconds: 2), () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'You just double-tapped the button!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.blue,
                        child: const Text(
                          'Show delayed snackbar',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                  const Key('doubletap_button'),
                ),

                _buildButtonCard(
                  'Long Press Button',
                  Tooltip(
                    message: "Performs action on long press.",
                    child: GestureDetector(
                      onLongPress: () {
                        // Show the prompt dialog on long press
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            TextEditingController controller =
                                TextEditingController();
                            return AlertDialog(
                              title: const Text('Enter Your Name:'),
                              content: TextField(
                                controller: controller,
                                decoration: const InputDecoration(
                                    hintText: 'Enter your name'),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Retrieve the input and display it in the SnackBar
                                    String result = controller.text;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Hello $result'),
                                        duration: const Duration(seconds: 2),
                                      ),
                                    );
                                    Navigator.pop(context); // Close the dialog
                                  },
                                  child: const Text('Submit'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.blue,
                        child: const Text(
                          'Open prompt box',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                  const Key('long_press_button'),
                ),

                _buildButtonCard(
                  'Disabled Button',
                  const Tooltip(
                    message: "A button that is disabled and unclickable.",
                    child: ElevatedButton(
                      onPressed: null, // Disabled button
                      child: Text(
                        'Click me',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                  const Key('disabled_button'),
                ),
                _buildButtonCard(
                  'Hover Button',
                  Tooltip(
                    message: "Changes appearance on hover.",
                    child: MouseRegion(
                      onEnter: (_) {
                        // Handle hover enter
                        print('Mouse entered');
                        // Update the button color on hover
                        _isHoveringHoverbutton = true;
                        setState(() {});
                      },
                      onExit: (_) {
                        // Handle hover exit
                        print('Mouse exited');
                        // Revert the button color when not hovering
                        _isHoveringHoverbutton = false;
                        setState(() {});
                      },
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _isHoveringHoverbutton
                              ? Colors.purple
                              : Colors.blue,
                        ),
                        onPressed: () {
                          // Show Alert Dialog when button is pressed
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Button Pressed'),
                                content:
                                    const Text('You have clicked the Hover Button!'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Close the dialog
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                          print('Hovered Button Pressed');
                        },
                        child: const Text(
                          'Hover Me',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                  const Key('hover_button'),
                ),
                _buildButtonCard(
                  'Customised Button',
                  Tooltip(
                    message: "A button with personalised design and behaviour",
                    child: InkWell(
                      onTap: () {
                        // Navigate to the home page on button press
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HomeScreen()), // Replace 'HomePage' with your actual home page widget
                        );
                      },
                      splashColor: Colors.pinkAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.blueAccent, Colors.purpleAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(4, 4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Colors.white.withOpacity(0.1),
                              offset: const Offset(-4, -4),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        padding:
                            const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        child: Center(
                          child: Text(
                            'Go to HomeScreen',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: const Offset(2, 2),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  iconSize,
                  cardPadding,
                  titleFontSize,
                  buttonSize,
                  const Key('customised_button'),
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
    Key key,
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
            const SizedBox(height: 5),
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

  // Function to display the fun fact dialog
  void _showFunFactDialog(String food, String fact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$food Fun Fact'),
          content: Text(fact),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Function to show the dialog
  void _showSelectionDialog(String selectedMenu) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selected Menu'),
          content: Text('You selected: $selectedMenu'),
        );
      },
    );

    // Automatically close the dialog after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.of(context).pop(); // Close the dialog
    });
  }

  Future<void> _handleElevatedButtonPress(BuildContext context) async {
    // Show the dialog with the circular progress indicator
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
          content: const Text('Data loaded successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}
