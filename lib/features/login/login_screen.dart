import 'package:components_automation/features/login/loginscreen_mobile.dart';
import 'package:components_automation/features/login/loginscreen_web.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return const LoginScreenWeb();
      } else {
        return const LoginScreenMobile();
      }
    });
  }
}
