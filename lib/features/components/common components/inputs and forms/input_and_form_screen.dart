// import 'package:components_automation/core/constants.dart';
// import 'package:components_automation/features/components/common%20components/inputs%20and%20forms/autocomplete_screen.dart';
// import 'package:components_automation/features/components/common%20components/inputs%20and%20forms/file_upload_screen.dart';
// import 'package:components_automation/features/components/common%20components/inputs%20and%20forms/form_screen.dart';
// import 'package:components_automation/features/components/common%20components/inputs%20and%20forms/search_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter/services.dart';

// class InputAndFormScreen extends StatefulWidget {
//   const InputAndFormScreen({super.key});

//   @override
//   _InputAndFormScreenState createState() => _InputAndFormScreenState();
// }

// class _InputAndFormScreenState extends State<InputAndFormScreen> {
//   final TextEditingController _textController = TextEditingController();
//   final TextEditingController _multiLineTextController =
//       TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _numberController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isPasswordObscured = true;
//   bool isTypingInSingleLine = false;

//   String? _singleLineError;
//   String? _multiLineError;

//   // Function to validate single-line text
//   void _validateSingleLineText(String value) {
//     setState(() {
//       if (value.length > 20) {
//         _singleLineError = "Character limit exceeded (max 20 characters)";
//       } else {
//         _singleLineError = null;
//       }
//     });
//   }

//   // Function to validate multi-line text
//   void _validateMultiLineText(String value) {
//     setState(() {
//       if (value.split('\n').length > 3) {
//         _multiLineError = "Line limit exceeded (max 3 lines)";
//       } else {
//         _multiLineError = null;
//       }
//     });
//   }

//   void _handleSubmission(BuildContext context, String value) {
//     if (value.split('\n').length > 3) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return const AlertDialog(
//             title: Text("Textfield Line should not exceed 3"),
//           );
//         },
//       );
//     } else if (value.isNotEmpty) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return const AlertDialog(
//             title: Text("Description noted"),
//           );
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Inputs and Forms",
//           style: TextStyle(color: Colors.white),
//         ),
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
//       body: Semantics(
//         label: "Inputs and forms",
//         container: true,
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 CommonColor.primaryColorDark,
//                 CommonColor.primaryColorLight
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           padding: const EdgeInsets.all(8.0),
//           child: RawScrollbar(
//             thumbColor: CommonColor.secondaryColor,
//             thumbVisibility: true,
//             thickness: 4,
//             radius: const Radius.circular(8),
//             child: GridView.count(
//               crossAxisCount: screenWidth > 900 ? 3 : (screenWidth > 600 ? 2 : 1),
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//               childAspectRatio: 2.5,
//               children: [
//                 _buildInputCard(
//                   "Single-line Text Field",
//                   Tooltip(
//                     message: 'You can only enter single-line input',
//                     child: Semantics(
//                       button: true,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TextField(
//                             controller: _textController,
//                             decoration: const InputDecoration(
//                               labelText: 'Enter your name',
//                             ),
//                             onSubmitted: (value) {
//                               if (value.length < 20) {
//                                 showDialog(
//                                     context: context,
//                                     builder: (context) {
//                                       return AlertDialog(
//                                         title: Text("Hi $value"),
//                                       );
//                                     });
//                               } else {
//                                 showDialog(
//                                     context: context,
//                                     builder: (context) {
//                                       return const AlertDialog(
//                                         title: Text(
//                                             "Name length should be less than 20"),
//                                       );
//                                     });
//                               }
//                             },
//                             onChanged: (value) {
//                               _validateSingleLineText(value);
//                               if (value.isNotEmpty) {
//                                 _multiLineTextController.clear();
//                               }
//                             },
//                           ),
//                           if (_singleLineError != null) // Show error if exists
//                             Text(
//                               _singleLineError!,
//                               style: const TextStyle(color: Colors.red),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 _buildInputCard(
//                   "Multi-line Text Field",
//                   Tooltip(
//                     message: 'You can enter multi-line input',
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Stack(
//                           alignment: Alignment
//                               .centerRight, // Align the icon to the right
//                           children: [
//                             ConstrainedBox(
//                               constraints: const BoxConstraints(
//                                 maxHeight:
//                                     120, // Limit the height to prevent overflow
//                               ),
//                               child: TextField(
//                                 controller: _multiLineTextController,
//                                 decoration: const InputDecoration(
//                                   labelText: 'Describe yourself',
//                                   contentPadding: EdgeInsets.symmetric(
//                                     vertical: 15.0,
//                                     horizontal: 10.0,
//                                   ),
//                                 ),
//                                 maxLines: null, // Allows dynamic line expansion
//                                 keyboardType: TextInputType.multiline,
//                                 onChanged: (value) {
//                                   _validateMultiLineText(value);
//                                 },
//                               ),
//                             ),
//                             IconButton(
//                               icon: const Icon(Icons.send, color: Colors.blue),
//                               onPressed: () {
//                                 String value = _multiLineTextController.text;
//                                 _handleSubmission(context, value);
//                               },
//                             ),
//                           ],
//                         ),
//                         if (_multiLineError != null) // Show error if exists
//                           Text(
//                             _multiLineError!,
//                             style: const TextStyle(color: Colors.red),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 _buildInputCard(
//                   "Email Input",
//                   Tooltip(
//                     message: 'Only valid email is accepted',
//                     child: TextField(
//                       controller: _emailController,
//                       decoration: const InputDecoration(labelText: 'Enter email'),
//                       keyboardType: TextInputType.emailAddress,
//                       onSubmitted: (value) {
//                         if (_isValidEmail(value)) {
//                           _showAlertDialog(context, 'Valid Email', value, false);
//                         } else {
//                           _showAlertDialog(context, 'Invalid Email',
//                               'Invalid email format.', false);
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//                 _buildInputCard(
//                   "Password Field",
//                   Tooltip(
//                     message: 'Only valid password is accepted',
//                     child: TextField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         labelText: 'Enter "password" as password',
//                         suffixIcon: IconButton(
//                           icon: Icon(
//                             _isPasswordObscured
//                                 ? Icons.visibility
//                                 : Icons.visibility_off,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               _isPasswordObscured = !_isPasswordObscured;
//                             });
//                           },
//                         ),
//                       ),
//                       obscureText: _isPasswordObscured,
//                       onSubmitted: (value) {
//                         if (value == "password") {
//                           showDialog(
//                             context: context,
//                             builder: (context) {
//                               return AlertDialog(
//                                 title: const Text("You got the access"),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: const Text("OK"),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         } else {
//                           showDialog(
//                             context: context,
//                             builder: (context) {
//                               return AlertDialog(
//                                 title: const Text("Incorrect password"),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () {
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: const Text("OK"),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//                 _buildInputCard(
//                   "Number Input",
//                   Tooltip(
//                     message: 'Only numeric value can be entered',
//                     child: TextField(
//                       controller: _numberController,
//                       decoration:
//                           const InputDecoration(labelText: 'Enter number'),
//                       keyboardType: TextInputType.number,
//                       inputFormatters: [
//                         FilteringTextInputFormatter.digitsOnly,
//                       ],
//                     ),
//                   ),
//                 ),
//                 _buildInputCard(
//                   "Date Picker",
//                   Tooltip(
//                     message: 'You can pick a date',
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         DateTime? picked = await showDatePicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           firstDate: DateTime(2000),
//                           lastDate: DateTime(2100),
//                         );
//                         if (picked != null) {
//                           _showAlertDialog(
//                               context, 'Selected Date', picked.toString(), true);
//                         }
//                       },
//                       child: const Text('Pick a Date'),
//                     ),
//                   ),
//                 ),
//                 _buildInputCard(
//                   "Time Picker",
//                   Tooltip(
//                     message: 'You can pick a time',
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         TimeOfDay? picked = await showTimePicker(
//                           context: context,
//                           initialTime: TimeOfDay.now(),
//                         );
//                         if (picked != null) {
//                           _showAlertDialog(context, 'Selected Time',
//                               picked.format(context), true);
//                         }
//                       },
//                       child: const Text('Pick a Time'),
//                     ),
//                   ),
//                 ),
//                 _buildInputCardWithIcon("Autocomplete input", Icons.edit_note,
//                     onPressed: () {
//                   Navigator.of(context).push(CupertinoPageRoute(
//                       builder: (context) => const AutocompleteScreen()));
//                 }),
//                 _buildInputCardWithIcon("File upload", Icons.file_download,
//                     onPressed: () {
//                   Navigator.of(context).push(CupertinoPageRoute(
//                       builder: (context) => const FileUploadScreen()));
//                 }),
//                 _buildInputCardWithIcon("Search box", Icons.search,
//                     onPressed: () {
//                   Navigator.of(context).push(CupertinoPageRoute(
//                       builder: (context) => const SearchScreen()));
//                 }),
//                 _buildInputCardWithIcon("Form", Icons.copy, onPressed: () {
//                   Navigator.of(context).push(CupertinoPageRoute(
//                       builder: (context) => const FormScreen()));
//                 }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   bool _isValidEmail(String email) {
//     final emailRegex =
//         RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
//     return emailRegex.hasMatch(email);
//   }

//   // Show Alert Dialog after a random delay and show Circular Progress Indicator during the delay
//   void _showAlertDialog(
//       BuildContext context, String title, String content, bool isValid) {
//     // Random delay between 0 to 4 seconds
//     int randomValue =
//         (0 + (4 - 0) * (DateTime.now().millisecondsSinceEpoch % 100) / 100)
//             .toInt();

//     // Show the dialog with loading
//     showDialog(
//       context: context,
//       builder: (context) {
//         return const AlertDialog(
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                   child:
//                       CircularProgressIndicator()), // Show loading indicator first
//             ],
//           ),
//           actions: [],
//         );
//       },
//     );

//     // Simulate loading for random time between 0 to 4 seconds
//     Future.delayed(Duration(seconds: randomValue), () {
//       // Close the progress dialog and show the actual message after delay
//       Navigator.of(context).pop();

//       // If random value is 4, show error message
//       if (randomValue == 4) {
//         _showErrorDialog(
//             context, 'Error occurred', 'Unable to pick date or time.');
//       } else {
//         // Otherwise, show the valid message
//         _showSuccessDialog(context, title, content);
//       }
//     });
//   }

//   void _showSuccessDialog(BuildContext context, String title, String content) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title),
//         content: Text(content),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showErrorDialog(BuildContext context, String title, String content) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title),
//         content: Text(content),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.of(context).pop(),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInputCardWithIcon(String title, IconData icon,
//       {required VoidCallback onPressed}) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Card(
//         elevation: 4.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 icon,
//                 size: 40,
//                 color: CommonColor.primaryColorDark,
//               ),
//               const SizedBox(height: 8.0),
//               Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: CommonColor.primaryColorDark,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInputCard(String title, Widget inputWidget) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 10),
//               inputWidget,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:components_automation/core/constants.dart';
import 'package:components_automation/features/components/common%20components/inputs%20and%20forms/autocomplete_screen.dart';
import 'package:components_automation/features/components/common%20components/inputs%20and%20forms/file_upload_screen.dart';
import 'package:components_automation/features/components/common%20components/inputs%20and%20forms/form_screen.dart';
import 'package:components_automation/features/components/common%20components/inputs%20and%20forms/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class InputAndFormScreen extends StatefulWidget {
  const InputAndFormScreen({super.key});

  @override
  _InputAndFormScreenState createState() => _InputAndFormScreenState();
}

class _InputAndFormScreenState extends State<InputAndFormScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _multiLineTextController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordObscured = true;
  bool isTypingInSingleLine = false;

  String? _singleLineError;
  String? _multiLineError;

  // Function to validate single-line text
  void _validateSingleLineText(String value) {
    setState(() {
      if (value.length > 20) {
        _singleLineError = "Character limit exceeded (max 20 characters)";
      } else {
        _singleLineError = null;
      }
    });
  }

  // Function to validate multi-line text
  void _validateMultiLineText(String value) {
    setState(() {
      if (value.split('\n').length > 3) {
        _multiLineError = "Line limit exceeded (max 3 lines)";
      } else {
        _multiLineError = null;
      }
    });
  }

  void _handleSubmission(BuildContext context, String value) {
    if (value.split('\n').length > 3) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Textfield Line should not exceed 3"),
          );
        },
      );
    } else if (value.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Description noted"),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
      body: Semantics(
        label: "Inputs and forms",
        container: true,
        child: Container(
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
            radius: const Radius.circular(8),
            child: GridView.count(
              crossAxisCount:
                  screenWidth > 900 ? 3 : (screenWidth > 600 ? 2 : 1),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 2.5,
              children: [
                Semantics(
                  button: true,
                  child: _buildInputCard(
                    "Single-line Text Field",
                    Tooltip(
                      message: 'You can only enter single-line input',
                      child: Semantics(
                        button: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: _textController,
                              decoration: const InputDecoration(
                                labelText: 'Enter your name',
                              ),
                              onSubmitted: (value) {
                                if (value.length < 20) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Hi $value"),
                                        );
                                      });
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AlertDialog(
                                          title: Text(
                                              "Name length should be less than 20"),
                                        );
                                      });
                                }
                              },
                              onChanged: (value) {
                                _validateSingleLineText(value);
                                if (value.isNotEmpty) {
                                  _multiLineTextController.clear();
                                }
                              },
                            ),
                            if (_singleLineError !=
                                null) // Show error if exists
                              Text(
                                _singleLineError!,
                                style: const TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Semantics(
                  button: true,
                  child: _buildInputCard(
                    "Multi-line Text Field",
                    Tooltip(
                      message: 'You can enter multi-line input',
                      child: Semantics(
                        button: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment
                                  .centerRight, // Align the icon to the right
                              children: [
                                ConstrainedBox(
                                  constraints: const BoxConstraints(
                                    maxHeight:
                                        120, // Limit the height to prevent overflow
                                  ),
                                  child: TextField(
                                    controller: _multiLineTextController,
                                    decoration: const InputDecoration(
                                      labelText: 'Describe yourself',
                                      contentPadding: EdgeInsets.symmetric(
                                        vertical: 15.0,
                                        horizontal: 10.0,
                                      ),
                                    ),
                                    maxLines:
                                        null, // Allows dynamic line expansion
                                    keyboardType: TextInputType.multiline,
                                    onChanged: (value) {
                                      _validateMultiLineText(value);
                                    },
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.send,
                                      color: Colors.blue),
                                  onPressed: () {
                                    String value =
                                        _multiLineTextController.text;
                                    _handleSubmission(context, value);
                                  },
                                ),
                              ],
                            ),
                            if (_multiLineError != null) // Show error if exists
                              Text(
                                _multiLineError!,
                                style: const TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Semantics(
                  button: true,
                  child: _buildInputCard(
                    "Email Input",
                    Tooltip(
                      message: 'Only valid email is accepted',
                      child: TextField(
                        controller: _emailController,
                        decoration:
                            const InputDecoration(labelText: 'Enter email'),
                        keyboardType: TextInputType.emailAddress,
                        onSubmitted: (value) {
                          if (_isValidEmail(value)) {
                            _showAlertDialog(
                                context, 'Valid Email', value, false);
                          } else {
                            _showAlertDialog(context, 'Invalid Email',
                                'Invalid email format.', false);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                _buildInputCard(
                  "Password Field",
                  Tooltip(
                    message: 'Only valid password is accepted',
                    child: TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Enter "password" as password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordObscured = !_isPasswordObscured;
                            });
                          },
                        ),
                      ),
                      obscureText: _isPasswordObscured,
                      onSubmitted: (value) {
                        if (value == "password") {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("You got the access"),
                                actions: [
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
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Incorrect password"),
                                actions: [
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
                      },
                    ),
                  ),
                ),
                _buildInputCard(
                  "Number Input",
                  Tooltip(
                    message: 'Only numeric value can be entered',
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
                    message: 'You can pick a date',
                    child: ElevatedButton(
                      onPressed: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          _showAlertDialog(context, 'Selected Date',
                              picked.toString(), true);
                        }
                      },
                      child: Semantics(
                          button: true,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Pick a Date'),
                          )),
                    ),
                  ),
                ),
                _buildInputCard(
                  "Time Picker",
                  Tooltip(
                    message: 'You can pick a time',
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
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Pick a Time'),
                      ),
                    ),
                  ),
                ),
                _buildInputCardWithIcon("Autocomplete input", Icons.edit_note,
                    onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const AutocompleteScreen()));
                }),
                _buildInputCardWithIcon("File upload", Icons.file_download,
                    onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const FileUploadScreen()));
                }),
                _buildInputCardWithIcon("Search box", Icons.search,
                    onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const SearchScreen()));
                }),
                _buildInputCardWithIcon("Form", Icons.copy, onPressed: () {
                  Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) => const FormScreen()));
                }),
              ],
            ),
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
        (0 + (4 - 0) * (DateTime.now().millisecondsSinceEpoch % 100) / 100)
            .toInt();

    // Show the dialog with loading
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
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

  Widget _buildInputCardWithIcon(String title, IconData icon,
      {required VoidCallback onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Semantics(
        button: true,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Semantics(
                  button: true,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      icon,
                      size: 40,
                      color: CommonColor.primaryColorDark,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: CommonColor.primaryColorDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputCard(String title, Widget inputWidget) {
    return Semantics(
      button: true,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(10),
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
      ),
    );
  }
}
