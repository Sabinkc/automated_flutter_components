import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>(); // Global key to manage form state
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String? _name, _email, _password, _gender, _description, _phone;
  DateTime? _dob; // For date of birth

  // Function to validate and submit form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Show confirmation dialog
      _showConfirmationDialog();
    } else {
      // If form is invalid, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all the fields correctly')),
      );
    }
  }

  // Function to show confirmation dialog
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to submit the form?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Proceed with form submission and clear fields
              _clearFormFields();
              Navigator.of(context).pop(); // Close the dialog
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Form Submitted Successfully!')),
              );
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  // Function to clear all the form fields
  void _clearFormFields() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _descriptionController.clear();
    _phoneController.clear();
    setState(() {
      _gender = null;
      _dob = null;
    });
  }

  // Function to select date of birth
  Future<void> _selectDateOfBirth(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
          context: context,
          initialDate: _dob ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        )) ??
        DateTime.now();

    setState(() {
      _dob = picked;
    });
  }

  // Function to reset the form
  void _resetForm() {
    _clearFormFields();
    _formKey.currentState?.reset(); // Reset the form validation state
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Form", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Using a simple blue color
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
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth > 600 ? 100 : 10, vertical: 10),
        child: Form(
          key: _formKey, // Assigning the form key
          child: ListView(
            children: <Widget>[
              // Name field
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Email field
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Simple email validation
                  if (!RegExp(
                          r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                      .hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Password field
              TextFormField(
                controller: _passwordController,
                obscureText: true, // To hide the password text
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Gender selection with radio buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: const Text('Gender: '),
                  ),
                  Semantics(
                    button: true,
                    child: Radio<String>(
                      value: 'Male',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Male'),
                  ),
                  Semantics(
                    button: true,
                    child: Radio<String>(
                      value: 'Female',
                      groupValue: _gender,
                      onChanged: (value) {
                        setState(() {
                          _gender = value;
                        });
                      },
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Female'),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Description field (multiline text field)
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Description About Yourself',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe yourself';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Date of Birth field (using DatePicker)
              TextFormField(
                controller: TextEditingController(
                    text: _dob != null
                        ? _dob!.toLocal().toString().split(' ')[0]
                        : ''),
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () {
                  _selectDateOfBirth(context);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your date of birth';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Phone number field
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Submit and Reset buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Set button color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    child: TextButton(
                      onPressed: () {
                        _submitForm();
                        debugPrint("submit pressed");
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: _resetForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey, // Set button color
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      child: TextButton(
                        child: const Text('Reset'),
                        onPressed: () {
                          _resetForm();
                        },
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
