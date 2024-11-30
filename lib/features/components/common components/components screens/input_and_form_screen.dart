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
    double screenHeight = MediaQuery.of(context).size.width;

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
                TextField(
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
              _buildInputCard(
                "Multi-line Text Field",
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 120, // Limit the height to prevent overflow
                  ),
                  child: TextField(
                    controller: _multiLineTextController,
                    decoration: const InputDecoration(
                      labelText: 'Enter multi-line text',
                      // border: OutlineInputBorder(),
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
              _buildInputCard(
                "Email Input",
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Enter email'),
                  keyboardType: TextInputType.emailAddress,
                  onSubmitted: (value) {
                    if (_isValidEmail(value)) {
                      _showAlertDialog(context, 'Valid Email', value);
                    } else {
                      _showAlertDialog(context, 'Invalid Email',
                          'Please enter a valid email address.');
                    }
                  },
                ),
              ),
              _buildInputCard(
                "Number Input",
                TextField(
                  controller: _numberController,
                  decoration: const InputDecoration(labelText: 'Enter number'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              _buildInputCard(
                "Date Picker",
                ElevatedButton(
                  onPressed: () async {
                    DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      _showAlertDialog(
                          context, 'Selected Date', picked.toString());
                    }
                  },
                  child: const Text('Pick a Date'),
                ),
              ),
              _buildInputCard(
                "Time Picker",
                ElevatedButton(
                  onPressed: () async {
                    TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      _showAlertDialog(
                          context, 'Selected Time', picked.format(context));
                    }
                  },
                  child: const Text('Pick a Time'),
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

  void _showAlertDialog(BuildContext context, String title, String content) {
    Timer(const Duration(milliseconds: 200), () {
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
    });
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
