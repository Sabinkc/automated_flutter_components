import 'package:components_automation/core/constants.dart';
import 'package:components_automation/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  ButtonScreenState createState() => ButtonScreenState();
}

class ButtonScreenState extends State<ButtonScreen> {
  bool _ontoggleValue = true;
  bool _offtoggleValue = false;
  String _dropdownValue = 'Option 1';
  bool _isFavIconPressed = false;
  bool _isOutlinedButtonPressed = false;
  bool _isHoveringHoverbutton = false;
  bool _firstCheckboxValue = false;
  bool _secondCheckboxValue = false;
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
        title:
            const Text("Button Screen", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Semantics(
        label: 'Button Screen Body',
        button: true,
        child: Semantics(
          button: true,
          child: Container(
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
                    // Elevated Button
                    _buildButtonCard(
                      'Elevated Button',
                      Tooltip(
                        message:
                            "An elevated button adds elevation to your button.",
                        child: Semantics(
                          label: 'Elevated Button',
                          button: true,
                          child: ElevatedButton(
                            onPressed: () async {
                              await _handleElevatedButtonPress(context);
                            },
                            child: Semantics(
                              label: 'Load Data Text',
                              button: true,
                              child: TextButton(
                                  onPressed: () async {
                                    await _handleElevatedButtonPress(context);
                                  },
                                  child: const Text('Load data')),
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
          
                    // Text Button
                    _buildButtonCard(
                      'Text Button',
                      Tooltip(
                        message:
                            "A text button displays only text with no background.",
                        child: Semantics(
                          label: 'Text Button',
                          button: true,
                          child: TextButton(
                            onPressed: () async {
                              final Uri url =
                                  Uri.parse('https://www.youtube.com/');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Could not launch URL')),
                                );
                              }
                            },
                            child: Semantics(
                              label: 'Open YouTube Text',
                              child: const Text('Open youtube'),
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
          
                    // Outlined Button
                    _buildButtonCard(
                      'Outlined Button',
                      Tooltip(
                        message: "An outlined button adds borders to the button.",
                        child: Semantics(
                          label: 'Outlined Button',
                          button: true,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _isOutlinedButtonPressed =
                                    !_isOutlinedButtonPressed;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.resolveWith<Color>(
                                      (states) {
                                return _isOutlinedButtonPressed
                                    ? Colors.blue
                                    : Colors.transparent;
                              }),
                              side: WidgetStateProperty.resolveWith<BorderSide>(
                                  (states) {
                                return BorderSide(
                                  color: _isOutlinedButtonPressed
                                      ? Colors.blue
                                      : Colors.black,
                                );
                              }),
                            ),
                            child: Semantics(
                                label: 'Change My Color Text',
                                child: TextButton(
                                  child: const Text('Change my color'),
                                  onPressed: () {
                                    setState(() {
                                      _isOutlinedButtonPressed =
                                          !_isOutlinedButtonPressed;
                                    });
                                  },
                                )),
                          ),
                        ),
                      ),
                      iconSize,
                      cardPadding,
                      titleFontSize,
                      buttonSize,
                      const Key('outlined_button'),
                    ),
          
                    // Icon Button
                    _buildButtonCard(
                      'Icon Button',
                      Tooltip(
                        message:
                            "An icon button displays an icon as a clickable button.",
                        child: Semantics(
                          label: 'Icon Button',
                          button: true,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                _isFavIconPressed = !_isFavIconPressed;
                              });
                            },
                            icon: Semantics(
                              label: 'Favorite Icon',
                              child: Icon(
                                Icons.favorite,
                                color: _isFavIconPressed ? Colors.red : null,
                              ),
                            ),
                            iconSize: iconSize,
                          ),
                        ),
                      ),
                      iconSize,
                      cardPadding,
                      titleFontSize,
                      buttonSize,
                      const Key('icon_button'),
                    ),
          
                    // Floating Action Button
                    _buildButtonCard(
                      'Floating Action Button',
                      Tooltip(
                        message:
                            "A floating action button is a circular button that floats above the content.",
                        child: Semantics(
                          label: 'Floating Action Button',
                          button: true,
                          child: FloatingActionButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Semantics(
                                    label: 'Floating Action Button Dialog',
                                    child: AlertDialog(
                                      content: Semantics(
                                        label: 'Dialog Content Text',
                                        child: const Text(
                                            'You pressed the floating action button!'),
                                      ),
                                      actions: [
                                        Semantics(
                                          label: 'OK Button',
                                          child: TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Ok'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Semantics(
                              label: 'Add Icon',
                              child: const Icon(Icons.add),
                            ),
                          ),
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
                      Tooltip(
                        message:
                            "A checkbox allows users to select multiple options from a set.",
                        child: Semantics(
                            label: 'Checkbox Button (Marked)',
                            toggled: true,
                            button: true,
                            child: Semantics(
                              label: "Checkbox button",
                              button: true,
                              child: const Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                            )),
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
                      Tooltip(
                        message:
                            "A checkbox allows users to select multiple options from a set.",
                        child: Semantics(
                          label: 'Checkbox Button (Unmarked)',
                          button: true,
                          toggled: false,
                          child: Semantics(
                            button: true,
                            child: const Checkbox(
                              value: false,
                              onChanged: null,
                            ),
                          ),
                        ),
                      ),
                      iconSize,
                      cardPadding,
                      titleFontSize,
                      buttonSize,
                      const Key('unmarked_checkbox_button'),
                    ),
          
                    // Combined Checkbox
                    _buildButtonCard(
                      'Combined Checkbox',
                      Column(
                        children: [
                          // Title at the top
                          Semantics(
                            label: 'Favourite Foods Title',
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Favourite foods:',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
          
                          // First Row with two checkboxes side by side
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Apple Checkbox
                              Semantics(
                                label: 'Apple Checkbox',
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        'Apple',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    ),
                                    Semantics(
                                      button: true,
                                      label: "apple checkbox",
                                      child: Semantics(
                                        button: true,
                                        child: Checkbox(
                                          value: _firstCheckboxValue,
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
          
                              // Banana Checkbox
                              Semantics(
                                label: 'Banana Checkbox',
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text('Banana',
                                          style: TextStyle(fontSize: 30)),
                                    ),
                                    Semantics(
                                      button: true,
                                      label: "Banana checkbox",
                                      child: Semantics(
                                        button: true,
                                        child: Checkbox(
                                          value: _secondCheckboxValue,
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
                                      ),
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
          
                    // Radio Button (Marked)
                    _buildButtonCard(
                      'Radio Button (Marked)',
                      Tooltip(
                        message:
                            "A radio button allows selecting one option from a set.",
                        child: Semantics(
                          label: 'Radio Button (Marked)',
                          toggled: true,
                          button: true,
                          child: Semantics(
                            button: true,
                            child: const Radio<String>(
                              value: 'Option 1',
                              groupValue: 'Option 1',
                              onChanged: null,
                            ),
                          ),
                        ),
                      ),
                      iconSize,
                      cardPadding,
                      titleFontSize,
                      buttonSize,
                      const Key('marked_radio_button'),
                    ),
          
                    // Radio Button (Unmarked)
                    _buildButtonCard(
                      'Radio Button (Unmarked)',
                      Tooltip(
                        message:
                            "A radio button allows selecting one option from a set.",
                        child: Semantics(
                          label: 'Radio Button (Unmarked)',
                          toggled: false,
                          child: Semantics(
                            button: true,
                            child: Semantics(
                              button: true,
                              child: const Radio<String>(
                                value: 'Option 2',
                                groupValue: null,
                                onChanged: null,
                              ),
                            ),
                          ),
                        ),
                      ),
                      iconSize,
                      cardPadding,
                      titleFontSize,
                      buttonSize,
                      const Key('unmarked_radio_button'),
                    ),
          
                    // Combined Radio Button
                    _buildButtonCard(
                      'Combined Radio Button',
                      Column(
                        children: [
                          // Title at the top
                          Semantics(
                            label: 'Your Gender Title',
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Your gender:',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
          
                          // First Row with two radio buttons side by side
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Male Radio Button
                              Semantics(
                                label: 'Male Radio Button',
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text('Male',
                                          style: TextStyle(fontSize: 25)),
                                    ),
                                    Semantics(
                                      button: true,
                                      child: Semantics(
                                        button: true,
                                        child: Radio<String>(
                                          value: 'Male',
                                          groupValue: _selectedGender,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedGender = newValue!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
          
                              // Female Radio Button
                              Semantics(
                                label: 'Female Radio Button',
                                child: Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text('Female',
                                          style: TextStyle(fontSize: 25)),
                                    ),
                                    Semantics(
                                      button: true,
                                      child: Semantics(
                                        button: true,
                                        child: Radio<String>(
                                          value: 'Female',
                                          groupValue: _selectedGender,
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              _selectedGender = newValue!;
                                            });
                                          },
                                        ),
                                      ),
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
                      const Key('combined_radio_button'),
                    ),
          
                    // Dropdown Button
                    _buildButtonCard(
                      'Dropdown Button',
                      Tooltip(
                        message: "A dropdown button shows a list of options.",
                        child: Semantics(
                          label: 'Dropdown Button',
                          button: true,
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
                      ),
                      iconSize,
                      cardPadding,
                      titleFontSize,
                      buttonSize,
                      const Key('dropdown_button'),
                    ),
          
                    // Toggle Button (On)
                    _buildButtonCard(
                      'Toggle Button (On)',
                      Tooltip(
                        message:
                            "A toggle switch is used to turn options on or off.",
                        child: Semantics(
                          label: 'Toggle Button (On)',
                          toggled: true,
                          child: Switch(
                            value: _ontoggleValue,
                            onChanged: (bool newValue) {
                              setState(() {
                                _ontoggleValue = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                      iconSize,
                      cardPadding,
                      titleFontSize,
                      buttonSize,
                      const Key('toggle_on_button'),
                    ),
          
                    // Toggle Button (Off)
                    _buildButtonCard(
                      'Toggle Button (Off)',
                      Tooltip(
                        message:
                            "A toggle switch is used to turn options on or off.",
                        child: Semantics(
                          label: 'Toggle Button (Off)',
                          toggled: false,
                          child: Switch(
                            value: _offtoggleValue,
                            onChanged: (bool newValue) {
                              setState(() {
                                _offtoggleValue = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                      iconSize,
                      cardPadding,
                      titleFontSize,
                      buttonSize,
                      const Key('toggle_off_button'),
                    ),
          
                    // Popup Menu Button
            _buildButtonCard(
            'Popup Menu Button',
            Tooltip(
              message: "A button that shows a menu with a list of options.",
              child: Semantics(
                label: 'Popup Menu Button',
                child: PopupMenuButton<String>(
          onSelected: (String value) {
            _showSelectionDialog(value);
          },
          itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(value: 'Menu 1', child: Text('Menu 1')),
              const PopupMenuItem(value: 'Menu 2', child: Text('Menu 2')),
              const PopupMenuItem(value: 'Menu 3', child: Text('Menu 3')),
            ];
          },
          icon: const Icon(Icons.menu), // Directly provide an icon here
                ),
              ),
            ),
            iconSize,
            cardPadding,
            titleFontSize,
            buttonSize,
            const Key('popup_menu_button'),
          ),
          
                    _buildButtonCard(
                      'Double tap button',
                      Tooltip(
                        message: "Performs action on double tap.",
                        child: Semantics(
                          label: "Double tap button",
                          button: true,
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
                            child: Semantics(
                              button: true,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                color: Colors.blue,
                                child: GestureDetector(
                                  onDoubleTap: (){
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
                                  child: Semantics(
                                    button: true,
                                    child: const Text(
                                        'Show delayed snackbar',
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      ),
                                  ),
                                  
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
                      const Key('doubletap_button_card'),
                    ),
          
                    _buildButtonCard(
                      'Long Press Button',
                      Tooltip(
                        message: "Performs action on long press.",
                        child: Semantics(
                          button: true,
                          child: GestureDetector(
                            key: const Key('long_press_gesture_detector'),
                            onLongPress: () {
                              // Show the prompt dialog on long press
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  TextEditingController controller =
                                      TextEditingController();
                                  return AlertDialog(
                                    key: const Key('long_press_alert_dialog'),
                                    title: TextButton(
                                      key: const Key('long_press_title_button'),
                                      onPressed: () {},
                                      child: const Text('Enter Your Name:'),
                                    ),
                                    content: TextField(
                                      key: const Key('long_press_text_field'),
                                      controller: controller,
                                      decoration: const InputDecoration(
                                          hintText: 'Enter your name'),
                                    ),
                                    actions: [
                                      TextButton(
                                        key:
                                            const Key('long_press_submit_button'),
                                        onPressed: () {
                                          // Retrieve the input and display it in the SnackBar
                                          String result = controller.text;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text('Hello $result'),
                                              duration:
                                                  const Duration(seconds: 2),
                                            ),
                                          );
                                          Navigator.pop(
                                              context); // Close the dialog
                                        },
                                        child: const Text('Submit'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Semantics(
                              button: true,
                              child: Container(
                                key: const Key('long_press_container'),
                                padding: const EdgeInsets.all(20),
                                color: Colors.blue,
                                child: GestureDetector(
                                  onLongPress: (){
                                     showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  TextEditingController controller =
                                      TextEditingController();
                                  return AlertDialog(
                                    key: const Key('long_press_alert_dialog'),
                                    title: TextButton(
                                      key: const Key('long_press_title_button'),
                                      onPressed: () {},
                                      child: const Text('Enter Your Name:'),
                                    ),
                                    content: TextField(
                                      key: const Key('long_press_text_field'),
                                      controller: controller,
                                      decoration: const InputDecoration(
                                          hintText: 'Enter your name'),
                                    ),
                                    actions: [
                                      TextButton(
                                        key:
                                            const Key('long_press_submit_button'),
                                        onPressed: () {
                                          // Retrieve the input and display it in the SnackBar
                                          String result = controller.text;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text('Hello $result'),
                                              duration:
                                                  const Duration(seconds: 2),
                                            ),
                                          );
                                          Navigator.pop(
                                              context); // Close the dialog
                                        },
                                        child: const Text('Submit'),
                                      ),
                                    ],
                                  );
                                },
                              );
                                  },
                                  child:   Semantics(
                                    button: true,
                                    child: const Text(
                                        'Open prompt box',
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.white),
                                      ),
                                  ),
                                  
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
                      const Key('long_press_button_card'),
                    ),
          
                    _buildButtonCard(
                      'Disabled Button',
                      Tooltip(
                        message: "A button that is disabled and unclickable.",
                        child: Semantics(
                          button: true,
                          child: ElevatedButton(
                            key: const Key('disabled_elevated_button'),
                            onPressed: null, // Disabled button
                            child: TextButton(
                              key: const Key('disabled_text_button'),
                              onPressed: () {},
                        
                              child: const Text(
                                'Click me',
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                          ),
                        ),
                      ),
                      iconSize,
                      cardPadding,
                      titleFontSize,
                      buttonSize,
                      const Key('disabled_button_card'),
                    ),
          
                    _buildButtonCard(
                      'Hover Button',
                      Tooltip(
                        message: "Changes appearance on hover.",
                        child: MouseRegion(
                          key: const Key('hover_mouse_region'),
                          onEnter: (_) {
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
                          child: Semantics(
                            button: true,
                            child: ElevatedButton(
                              key: const Key('hover_elevated_button'),
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
                                      key: const Key('hover_alert_dialog'),
                                      title: const Text('Button Pressed'),
                                      content: const Text(
                                          'You have clicked the Hover Button!'),
                                      actions: [
                                        TextButton(
                                          key: const Key('hover_ok_button'),
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
                              },
                              child: TextButton(
                                  key: const Key('hover_text_button'),
                                  onPressed: () {},
                                  child: const Text(
                                    'Hover Me',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
                                  )),
                            ),
                          ),
                        ),
                      ),
                      iconSize,
                      cardPadding,
                      titleFontSize,
                      buttonSize,
                      const Key('hover_button_card'),
                    ),
          
                    _buildButtonCard(
                      'Customised Button',
                      Tooltip(
                        message:
                            "A button with personalised design and behaviour",
                        child: Semantics(
                          button: true,
                          child: InkWell(
                            key: const Key('custom_inkwell'),
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
                            child: Semantics(
                              button: true,
                              child: Container(
                                key: const Key('custom_container'),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.blueAccent,
                                      Colors.purpleAccent
                                    ],
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                                child: Center(
                                    child: TextButton(
                                  key: const Key('custom_text_button'),
                                  onPressed: () {
                                     Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomeScreen()), // Replace 'HomePage' with your actual home page widget
                              );
                                  },
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
                                )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      iconSize,
                      cardPadding,
                      titleFontSize,
                      buttonSize,
                      const Key('customised_button_card'),
                    ),
                  ],
                ),
              ),
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
            Semantics(
                key: key,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    title,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
            const SizedBox(height: 5),
            Semantics(
              child: SizedBox(
                width: buttonSize * 4,
                height: buttonSize * 2.5,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: button,
                ),
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
