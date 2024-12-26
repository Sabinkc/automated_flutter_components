import 'package:components_automation/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';
import 'package:components_automation/widgets/common_button.dart';
import 'package:components_automation/widgets/common_text_field.dart';

class LoginScreenWeb extends StatefulWidget {
  const LoginScreenWeb({super.key});

  @override
  State<LoginScreenWeb> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenWeb> {
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
        MaterialPageRoute(builder: (context) => const HomeScreen()),
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
        body: Stack(
      children: [
        SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: screenHeight,
            ),
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left section with welcome messages
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Are you ready to practice UI automation?",
                            style: TextStyle(
                              fontSize: screenHeight * 0.06,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            "Please login to continue!",
                            style: TextStyle(
                              fontSize: screenHeight * 0.06,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Right section with the login form
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(4, 4),
                            ),
                          ],
                          borderRadius:
                              BorderRadius.circular(screenHeight * 0.04),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                            vertical: screenHeight * 0.05,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Note:",
                                    style: TextStyle(
                                      color: CommonColor.secondaryColor,
                                    ),
                                  ),
                                  const Expanded(
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
                                    onPressed: _isLoading
                                        ? null
                                        : () => _login(context),
                                    buttonName: "Log In",
                                    horizontalPadding: screenWidth * 0.1,
                                    verticalPadding: screenHeight * 0.015,
                                  ),
                                  if (_isLoading)
                                    const Positioned(
                                      child: SizedBox(
                                        height: 24,
                                        width: 24,
                                        child: CircularProgressIndicator(
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
                                  color:
                                      CommonColor.tertiaryColor.withOpacity(1),
                                  borderRadius:
                                      BorderRadius.circular(screenWidth * 0.03),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
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
                                        }),
                                      ],
                                    ),
                                    Column(
                                      children: [
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
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: screenHeight * 0.02,
          left: screenWidth * 0.02,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
            onPressed: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
          ),
        ),
      ],
    ));
  }
}
