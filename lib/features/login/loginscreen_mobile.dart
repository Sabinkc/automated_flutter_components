import 'package:components_automation/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';
import 'package:components_automation/widgets/common_button.dart';
import 'package:components_automation/widgets/common_text_field.dart';

class LoginScreenMobile extends StatefulWidget {
  const LoginScreenMobile({super.key});

  @override
  State<LoginScreenMobile> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenMobile> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final List<String> acceptedUsernames = [
    'test_user',
    'inactive_user',
    'debug_user',
    'hidden_user',
    'standard_user',
  ];
  final String acceptedPassword = 'password';

  bool _isLoading = false;
  bool _isPasswordObscure = true; // Track the password visibility

  void _login(BuildContext context) {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    // Validation for empty fields
    if (username.isEmpty || password.isEmpty) {
      _showErrorDialog(context, 'Both fields are required.');
      return;
    }

    // Validation for username and password
    if (!acceptedUsernames.contains(username)) {
      _showErrorDialog(context, 'Invalid username.');
      return;
    }

    if (password != acceptedPassword) {
      _showErrorDialog(context, 'Incorrect password.');
      return;
    }

    // Simulate loading for 1 second, then navigate to Home Screen
    setState(() {
      _isLoading = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  // Function to show error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Login Failed'),
          content: Text(message),
          actions: [
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

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CommonColor.primaryColor,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight,
          ),
          child: IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    CommonColor.primaryColor,
                    CommonColor.primaryColorDark,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.08),
                  Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: screenHeight * 0.06,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.06),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(screenHeight * 0.04),
                          topRight: Radius.circular(screenHeight * 0.04),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.03,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CommonTextfield(
                              labelText: "Username",
                              hintText: "Enter username",
                              suffixIcon: Icons.person,
                              controller: _usernameController,
                              isObscure: false,
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            // Password Field with Toggle Visibility
                            CommonTextfield(
                              labelText: "Password",
                              hintText: "Enter password",
                              suffixIcon: _isPasswordObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              controller: _passwordController,
                              isObscure: _isPasswordObscure,
                              onSuffixIconPressed: () {
                                setState(() {
                                  _isPasswordObscure = !_isPasswordObscure;
                                });
                              },
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              children: [
                                Text(
                                  "Note:",
                                  style: TextStyle(
                                    color: CommonColor.secondaryColor,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    " Enter username and password from below data",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                CommonButton(
                                  onPressed:
                                      _isLoading ? null : () => _login(context),
                                  buttonName: "Log In",
                                  horizontalPadding: screenWidth * 0.3,
                                  verticalPadding: screenHeight * 0.015,
                                ),
                                if (_isLoading)
                                  Positioned(
                                    child: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            Divider(color: CommonColor.primaryColor),
                            SizedBox(height: screenHeight * 0.03),
                            Container(
                              padding: EdgeInsets.all(screenHeight * 0.02),
                              decoration: BoxDecoration(
                                color: CommonColor.tertiaryColor.withOpacity(1),
                                borderRadius:
                                    BorderRadius.circular(screenWidth * 0.03),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Accepted usernames:",
                                    style: TextStyle(
                                      color: CommonColor.secondaryColor,
                                      fontSize: screenHeight * 0.025,
                                    ),
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                  ...acceptedUsernames.map((username) {
                                    return Text(
                                      username,
                                      style: TextStyle(
                                        fontSize: screenHeight * 0.02,
                                      ),
                                    );
                                  }).toList(),
                                  SizedBox(height: screenHeight * 0.01),
                                  Text(
                                    "Password for all users:",
                                    style: TextStyle(
                                      color: CommonColor.secondaryColor,
                                      fontSize: screenHeight * 0.025,
                                    ),
                                  ),
                                  Text(
                                    acceptedPassword,
                                    style: TextStyle(
                                      fontSize: screenHeight * 0.02,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
