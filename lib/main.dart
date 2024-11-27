import 'package:components_automation/features/home/home_screen.dart';
import 'package:components_automation/features/login/login_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
