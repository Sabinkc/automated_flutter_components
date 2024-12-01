import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class InputAndFormScreen extends StatefulWidget {
  const InputAndFormScreen({super.key});

  @override
  _InputAndFormScreenState createState() => _InputAndFormScreenState();
}

class _InputAndFormScreenState extends State<InputAndFormScreen> {
  TextEditingController _textController = TextEditingController();
  TextEditingController _multiLineTextController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  bool isTypingInSingleLine = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Inputs and Forms",
          style: TextStyle(color: Colors.white),
        ),
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
        padding: const EdgeInsets.all(8.0),
        child: RawScrollbar(
          thumbColor: CommonColor.secondaryColor,
          thumbVisibility: true,
          thickness: 4,
          radius: Radius.circular(8),
          child: GridView.count(
            crossAxisCount: screenWidth > 900 ? 3 : (screenWidth > 600 ? 2 : 1),
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 2.5,
            children: [
              _buildInputCard(
                "Single-line Text Field",
                Tooltip(
                  message: 'Enter a single line of text.',
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(labelText: 'Enter text'),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        isTypingInSingleLine = true;
                        _multiLineTextController.clear();
                      }
                    },
                  ),
                ),
              ),
              _buildInputCard(
                "Multi-line Text Field",
                Tooltip(
                  message: 'Enter multiple lines of text.',
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxHeight: 120, // Limit the height to prevent overflow
                    ),
                    child: TextField(
                      controller: _multiLineTextController,
                      decoration: const InputDecoration(
                        labelText: 'Enter multi-line text',
                      ),
                      maxLines: null, // Allows dynamic line expansion
                      keyboardType: TextInputType.multiline,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          isTypingInSingleLine = false;
                          _textController.clear();
                        }
                      },
                    ),
                  ),
                ),
              ),
              _buildInputCard(
                "Email Input",
                Tooltip(
                  message: 'Enter a valid email address.',
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Enter email'),
                    keyboardType: TextInputType.emailAddress,
                    onSubmitted: (value) {
                      if (_isValidEmail(value)) {
                        _showAlertDialog(context, 'Valid Email', value, false);
                      } else {
                        _showAlertDialog(context, 'Invalid Email',
                            'Invalid email format.', false);
                      }
                    },
                  ),
                ),
              ),
              _buildInputCard(
                "Number Input",
                Tooltip(
                  message: 'Enter a numeric value.',
                  child: TextField(
                    controller: _numberController,
                    decoration:
                        const InputDecoration(labelText: 'Enter number'),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                ),
              ),
              _buildInputCard(
                "Date Picker",
                Tooltip(
                  message: 'Pick a date.',
                  child: ElevatedButton(
                    onPressed: () async {
                      DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) {
                        _showAlertDialog(
                            context, 'Selected Date', picked.toString(), true);
                      }
                    },
                    child: const Text('Pick a Date'),
                  ),
                ),
              ),
              _buildInputCard(
                "Time Picker",
                Tooltip(
                  message: 'Pick a time.',
                  child: ElevatedButton(
                    onPressed: () async {
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null) {
                        _showAlertDialog(context, 'Selected Time',
                            picked.format(context), true);
                      }
                    },
                    child: const Text('Pick a Time'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex =
        RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
    return emailRegex.hasMatch(email);
  }

  // Show Alert Dialog after a random delay and show Circular Progress Indicator during the delay
  void _showAlertDialog(
      BuildContext context, String title, String content, bool isValid) {
    // Random delay between 0 to 4 seconds
    int randomValue =
        (0 + (4 - 0) * (new DateTime.now().millisecondsSinceEpoch % 100) / 100)
            .toInt();

    // Show the dialog with loading
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child:
                      CircularProgressIndicator()), // Show loading indicator first
            ],
          ),
          actions: [],
        );
      },
    );

    // Simulate loading for random time between 0 to 4 seconds
    Future.delayed(Duration(seconds: randomValue), () {
      // Close the progress dialog and show the actual message after delay
      Navigator.of(context).pop();

      // If random value is 4, show error message
      if (randomValue == 4) {
        _showErrorDialog(
            context, 'Error occurred', 'Unable to pick date or time.');
      } else {
        // Otherwise, show the valid message
        _showSuccessDialog(context, title, content);
      }
    });
  }

  void _showSuccessDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildInputCard(String title, Widget inputWidget) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              inputWidget,
            ],
          ),
        ),
      ),
    );
  }
}
