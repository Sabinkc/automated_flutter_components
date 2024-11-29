import 'package:components_automation/core/constants.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/accessibility_feature_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/advanced_component_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/authentication_and_security_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/button_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/card_and_container_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/chart_and_graph_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/dialgoue_and_popup_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/file_handling_and_download_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/grid_and_layout_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/images_and_media_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/input_and_form_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/interactive_widgets_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/list_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/menus_and_navigation_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/miscellaneous_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/navigational_components_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/real_time_feature_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/selection_control_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/slider_and_progress_indicator_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/specialized_ui_component_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/table_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/text_element_screen.dart';
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
                List<Widget> destinations = [
                  ButtonScreen(),
                  InputAndFormScreen(),
                  SelectionControlScreen(),
                  NavigationalComponentsScreen(),
                  ListScreen(),
                  TableScreen(),
                  SliderAndProgressIndicatorScreen(),
                  DialgoueAndPopupScreen(),
                  ImagesAndMediaScreen(),
                  CardAndContainerScreen(),
                  ChartAndGraphScreen(),
                  InteractiveWidgetsScreen(),
                  TextElementScreen(),
                  MenusAndNavigationScreen(),
                  FileHandlingAndDownloadScreen(),
                  GridAndLayoutScreen(),
                  RealTimeFeatureScreen(),
                  AuthenticationAndSecurityScreen(),
                  AdvancedComponentScreen(),
                  AccessibilityFeatureScreen(),
                  SpecializedUiComponentScreen(),
                  MiscellaneousScreen(),
                ];
                Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => destinations[index],
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
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
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
