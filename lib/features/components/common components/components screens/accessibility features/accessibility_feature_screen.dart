import 'package:components_automation/features/components/common%20components/components%20screens/accessibility%20features/accessibility_feature_detail_screen.dart';

import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

class AccessibilityFeatureScreen extends StatefulWidget {
  const AccessibilityFeatureScreen({super.key});

  @override
  AccessibilityFeatureScreenState createState() =>
      AccessibilityFeatureScreenState();
}

class AccessibilityFeatureScreenState
    extends State<AccessibilityFeatureScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

  

  

    return Scaffold(
      appBar: AppBar(
        title: const Text("Accessibility feature screen",
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
                buildAccessibilityFeatureComponent(
                  'Screen reader hints',
                  Icons.display_settings, // Change to a more relevant icon
                  cardPadding,
                  titleFontSize,
                  context,
                  'Enable screen reader hints for better accessibility', // Descriptive tooltip
                  const ScreenReaderHintsScreen(), // Updated screen name
                ),
                buildAccessibilityFeatureComponent(
                  'Keyboard navigation',
                  Icons.keyboard, // Change to a more relevant icon
                  cardPadding,
                  titleFontSize,
                  context,
                  'Enable keyboard navigation for improved control', // Descriptive tooltip
                  KeyboardNavigationScreen(), // Updated screen name
                ),
                buildAccessibilityFeatureComponent(
                  'Focus indicators',
                  Icons.accessibility, // Change to a more relevant icon
                  cardPadding,
                  titleFontSize,
                  context,
                  'Highlight focusable elements on the screen for better navigation', // Descriptive tooltip
                  FocusIndicatorScreen(), // Updated screen name
                ),
                buildAccessibilityFeatureComponent(
                  'High contrast mode toggle',
                  Icons.invert_colors, // Change to a more relevant icon
                  cardPadding,
                  titleFontSize,
                  context,
                  'Toggle high contrast mode for better visibility', // Descriptive tooltip
                  HighContrastModeScreen(), // Updated screen name
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAccessibilityFeatureComponent(
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
