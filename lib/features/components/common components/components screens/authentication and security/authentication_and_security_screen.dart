import 'package:components_automation/features/components/common%20components/components%20screens/authentication%20and%20security/authentication_and_security_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

class AuthenticationAndSecurityScreen extends StatefulWidget {
  const AuthenticationAndSecurityScreen({super.key});

  @override
  _AuthenticationAndSecurityScreenState createState() =>
      _AuthenticationAndSecurityScreenState();
}

class _AuthenticationAndSecurityScreenState
    extends State<AuthenticationAndSecurityScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    final ScrollController scrollController = ScrollController();

    @override
    void dispose() {
      scrollController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Authentication and Security Screen",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
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
              shrinkWrap: true,
              crossAxisCount: width > 1000 ? 5 : (width > 600 ? 3 : 2),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1,
              children: [
                buildAuthenticationAndSecurityComponent(
                  'Login form',
                  Icons.login,
                  cardPadding,
                  titleFontSize,
                  context,
                  'Allows users to log in securely.',
                  const LoginScreen(),
                ),
                buildAuthenticationAndSecurityComponent(
                  'Registration form',
                  Icons.app_registration,
                  cardPadding,
                  titleFontSize,
                  context,
                  'Enables new users to register.',
                  const RegistrationScreen(),
                ),
                buildAuthenticationAndSecurityComponent(
                  'Forgot password form',
                  Icons.lock_reset,
                  cardPadding,
                  titleFontSize,
                  context,
                  'Helps users reset their password.',
                  const ForgotPasswordScreen(),
                ),
                buildAuthenticationAndSecurityComponent(
                  'Captcha',
                  Icons.security,
                  cardPadding,
                  titleFontSize,
                  context,
                  'Prevents automated bots from accessing the system.',
                  const CaptchaScreen(),
                ),
                buildAuthenticationAndSecurityComponent(
                  'Two factor authentication',
                  Icons.verified,
                  cardPadding,
                  titleFontSize,
                  context,
                  'Adds an extra layer of security.',
                  const TwoFactorAuthScreen(),
                ),
                buildAuthenticationAndSecurityComponent(
                  'Social logins',
                  Icons.person_add_alt,
                  cardPadding,
                  titleFontSize,
                  context,
                  'Allows users to log in using social media accounts.',
                  const SocialLoginScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAuthenticationAndSecurityComponent(
    String title,
    IconData icon,
    double cardPadding,
    double titleFontSize,
    BuildContext context,
    String tooltipMessage,
    Widget navigationScreen,
  ) {
    return Tooltip(
      message: tooltipMessage,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => navigationScreen,
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(cardPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: Colors.blueAccent),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tap to view',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
