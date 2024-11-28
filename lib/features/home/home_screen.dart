import 'package:components_automation/features/components/common%20components/common_components_screen.dart';
import 'package:components_automation/features/components/mobile%20specific%20behaviours/mobile_specific_behavior_screen.dart';
import 'package:components_automation/features/components/mobile%20specific%20components/mobile_specific_components_screen.dart';
import 'package:components_automation/features/components/web%20behaviours/web_behavior_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    // Define padding and spacing
    final double padding = screenWidth * 0.04; // 4% of screen width for padding
    final double crossAxisSpacing =
        screenWidth * 0.04; // Spacing between columns
    final double mainAxisSpacing = screenHeight * 0.02; // Spacing between rows

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white),
          ),
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: CommonColor.primaryColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(padding),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
              crossAxisSpacing: crossAxisSpacing,
              mainAxisSpacing: mainAxisSpacing,
              childAspectRatio: (screenWidth / 2 - crossAxisSpacing) /
                  ((screenHeight - kToolbarHeight - padding * 2) / 2),
            ),
            itemCount: 4, // Number of grid items
            itemBuilder: (context, index) {
              // Define icons and labels for the grid items
              final List<IconData> icons = [
                Icons.device_hub,
                Icons.mobile_friendly,
                Icons.web_rounded,
                Icons.mobile_screen_share,
              ];
              final List<String> labels = [
                'Common components \n(Web and mobile)',
                'Mobile specific \ncomponents',
                'Web behaviours',
                'Mobile specific \nbehaviours',
              ];
              final List<Widget> destinations = [
                CommonComponentsScreen(),
                MobileSpecificComponentScreen(),
                WebBehaviorScreen(),
                MobileSpecificBehaviorScreen(),
              ];

              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => destinations[index],
                        ));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icons[index],
                        size: screenHeight * 0.13,
                        color: CommonColor.secondaryColor,
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        labels[index],
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontWeight: FontWeight.bold,
                          color: CommonColor.primaryColorDark,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
