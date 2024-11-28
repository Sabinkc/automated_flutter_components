import 'package:components_automation/core/constants.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/button_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonComponentsScreen extends StatelessWidget {
  CommonComponentsScreen({super.key});

  // List of 22 titles and corresponding icons
  final List<Map<String, dynamic>> components = [
    {'title': 'Buttons', 'icon': Icons.radio_button_checked},
    {'title': 'Inputs & Forms', 'icon': Icons.input},
    {'title': 'Selection Controls', 'icon': Icons.check_box},
    {'title': 'Navigational Components', 'icon': Icons.navigation},
    {'title': 'Lists', 'icon': Icons.list},
    {'title': 'Tables', 'icon': Icons.table_chart},
    {'title': 'Sliders & Progress Indicators', 'icon': Icons.linear_scale},
    {'title': 'Dialogs & Pop-ups', 'icon': Icons.message},
    {'title': 'Images & Media', 'icon': Icons.image},
    {'title': 'Cards & Containers', 'icon': Icons.credit_card},
    {'title': 'Charts & Graphs', 'icon': Icons.insert_chart},
    {'title': 'Interactive Widgets', 'icon': Icons.widgets},
    {'title': 'Text Elements', 'icon': Icons.text_fields},
    {'title': 'Menus & Navigation', 'icon': Icons.menu},
    {'title': 'File Handling & Downloads', 'icon': Icons.file_download},
    {'title': 'Grid & Layouts', 'icon': Icons.grid_on},
    {'title': 'Real-time Features', 'icon': Icons.update},
    {'title': 'Authentication & Security', 'icon': Icons.lock},
    {'title': 'Advanced Components', 'icon': Icons.extension},
    {'title': 'Accessibility Features', 'icon': Icons.accessibility},
    {'title': 'Specialized UI Components', 'icon': Icons.star},
    {'title': 'Miscellaneous', 'icon': Icons.more_horiz},
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate crossAxisCount based on screen width using MediaQuery
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final int crossAxisCount = (screenWidth ~/ 150).clamp(2, 3); // Min 2, Max 3

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Common Components",
          style: const TextStyle(color: Colors.white),
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
      body: Padding(
        padding: EdgeInsets.all(screenHeight * 0.02),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount, // Responsive based on screen width
            crossAxisSpacing: screenWidth * 0.02,
            mainAxisSpacing: screenHeight * 0.01,
            childAspectRatio: 1, // Square cells
          ),
          itemCount: components.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle item tap
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => ButtonScreen(),
                ));
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenHeight * 0.02),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      components[index]['icon'],
                      size: screenHeight * 0.06,
                      color: CommonColor.secondaryColor,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      components[index]['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w500,
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
    );
  }
}
