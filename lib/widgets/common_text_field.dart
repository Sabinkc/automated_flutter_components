import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class CommonTextfield extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData suffixIcon;

  bool isObscure;
  TextEditingController? controller;
  Function(String)? onChanged;
  Function()? onSuffixIconPressed;
  CommonTextfield(
      {super.key,
      required this.labelText,
      required this.hintText,
      required this.suffixIcon,
      required this.isObscure,
      this.controller,
      this.onChanged,
      this.onSuffixIconPressed});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return TextField(
      onChanged: onChanged,
      controller: controller,
      obscureText: isObscure,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CommonColor.primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CommonColor.primaryColor)),
        border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        labelStyle: TextStyle(
            fontSize: screenHeight * 0.03, color: CommonColor.primaryColor),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontSize: screenHeight * 0.03),
        suffixIcon: IconButton(
            onPressed: onSuffixIconPressed,
            icon: Icon(suffixIcon,
                size: screenHeight * 0.03, color: CommonColor.primaryColor)),
      ),
    );
  }
}
