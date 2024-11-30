import 'package:components_automation/core/constants.dart';
import 'package:components_automation/features/login/login_screen.dart';
import 'package:components_automation/widgets/common_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // backgroundColor: const Color(0xFFF4F4F9),
        appBar: AppBar(
          backgroundColor: CommonColor.primaryColorDark,
          centerTitle: true,
          title: const Text(
            'UI Automation Practice',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            indicatorColor: CommonColor.secondaryColor,
            unselectedLabelColor: Colors.white,
            labelColor: Colors.white,
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'About'),
              Tab(text: 'GitHub'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            HomeTab(),
            AboutTab(),
            GitHubTab(),
          ],
        ),
      ),
    );
  }
}

// Home Tab Content
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
            color: CommonColor.primaryColorLight,
            child: Column(
              children: [
                const Text(
                  'Welcome to UI Automation Practice',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'This website provides a platform for practicing UI automation using various tools such as Selenium, Cypress, and more. Explore a range of UI components specifically designed for automation testing.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                CommonButton(
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    buttonName: "Explore Components",
                    horizontalPadding: 50,
                    verticalPadding: 10)
              ],
            ),
          ),
          // Apps Section
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Column(
              children: [
                const Text(
                  'Web and Mobile Apps',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                  'In addition to the web-based components, we also offer dedicated mobile apps for Android and iOS. These apps provide mobile-specific components to extend your automation testing practices.',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  children: [
                    CommonButton(
                        onPressed: () {},
                        buttonName: "Android App",
                        horizontalPadding: 20,
                        verticalPadding: 10),
                    CommonButton(
                        onPressed: () {},
                        buttonName: "IOS App",
                        horizontalPadding: 20,
                        verticalPadding: 10)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppLink(String label, String url) {
    return ElevatedButton(
      onPressed: () {
        // Handle URL navigation
        print('Opening $url');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4CAF50),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      child: Text(label, style: const TextStyle(fontSize: 16)),
    );
  }
}

// About Tab Content
class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: const Text(
          'This platform aims to help users practice UI automation using modern tools and frameworks. You can explore various components and test automation features tailored for different environments.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

// GitHub Tab Content
class GitHubTab extends StatelessWidget {
  const GitHubTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          // Navigate to GitHub URL
          print('Opening GitHub...');
        },
        child: const Text(
          'Contribute on GitHub',
          style: TextStyle(color: Color(0xFF4CAF50), fontSize: 18),
        ),
      ),
    );
  }
}
