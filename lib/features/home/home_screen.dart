import 'package:components_automation/core/constants.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/accessibility%20features/accessibility_feature_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/advanced%20components/advanced_component_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/authentication%20and%20security/authentication_and_security_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/button_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/card%20and%20container/card_and_container_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/chart%20and%20graph/chart_and_graph_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/dialgoue_and_popup_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/file%20handling%20and%20download/file_handling_and_download_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/grid%20and%20layout/grid_and_layout_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/image%20and%20media/images_and_media_screen.dart';
import 'package:components_automation/features/components/common%20components/inputs%20and%20forms/input_and_form_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/interactive%20widget/interactive_widgets_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/lists/list_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/miscellaneous/miscellaneous_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/navigation%20components/navigational_components_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/real%20time%20features/real_time_feature_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/selection%20control/selection_control_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/slider_and_progress_indicator_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/specialized%20ui%20component/specialized_ui_component_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/tables%20and%20screen/table_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/text_element_screen.dart';
import 'package:components_automation/features/components/common%20components/pagination_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  // List of 22 titles and corresponding icons
  final List<Map<String, dynamic>> components = [
    {'title': 'Buttons', 'icon': Icons.radio_button_checked},
    {'title': 'Inputs & Forms', 'icon': Icons.input},
    {'title': 'Selection Controls', 'icon': Icons.check_box},
    {'title': 'Navigational Components', 'icon': Icons.navigation},
    {'title': 'Pagination', 'icon': Icons.pages},
    {'title': 'Lists', 'icon': Icons.list},
    {'title': 'Tables', 'icon': Icons.table_chart},
    {'title': 'Sliders & Progress Indicators', 'icon': Icons.linear_scale},
    {'title': 'Dialogs & Pop-ups', 'icon': Icons.message},
    {'title': 'Images & Media', 'icon': Icons.image},
    {'title': 'Cards & Containers', 'icon': Icons.credit_card},
    {'title': 'Charts & Graphs', 'icon': Icons.insert_chart},
    {'title': 'Interactive Widgets', 'icon': Icons.widgets},
    {'title': 'Text Elements', 'icon': Icons.text_fields},
    // {'title': 'Menus & Navigation', 'icon': Icons.menu},
    {'title': 'File Handling & Downloads', 'icon': Icons.file_download},
    {'title': 'Grid & Layouts', 'icon': Icons.grid_on},
    {'title': 'Real-time Features', 'icon': Icons.update},
    {'title': 'Authentication & Security', 'icon': Icons.lock},
    {'title': 'Advanced Components', 'icon': Icons.extension},
    {'title': 'Accessibility Features', 'icon': Icons.accessibility},
    {'title': 'Specialized UI Components', 'icon': Icons.star},
    {'title': 'Miscellaneous', 'icon': Icons.more_horiz},
  ];

  List<Widget> destinations = [
    const ButtonScreen(),
    const InputAndFormScreen(),
    const SelectionControlScreen(),
    const NavigationalComponentsScreen(),
    const PaginationScreen(),
    const ListScreen(),
    const TableScreen(),
    const SliderAndProgressIndicatorScreen(),
    const DialgoueAndPopupScreen(),
    const ImagesAndMediaScreen(),
    const CardAndContainerScreen(),
    const ChartAndGraphScreen(),
    const InteractiveWidgetsScreen(),
    const TextElementScreen(),
    const FileHandlingAndDownloadScreen(),
    const GridAndLayoutScreen(),
    const RealTimeFeatureScreen(),
    const AuthenticationAndSecurityScreen(),
    const AdvancedComponentScreen(),
    const AccessibilityFeatureScreen(),
    const SpecializedUiComponentScreen(),
    const MiscellaneousScreen(),
  ];

  int hoveredIndex = -1; // Track the hovered index

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Components",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
            onPressed: () {
              // logout and navigate to login screen
            },
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            )),
      ),
      body: Semantics(
        button: true,
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
          child: Semantics(
            button: true,
            label: "Scroll bar",
            child: RawScrollbar(
              thumbColor: CommonColor.secondaryColor,
              thumbVisibility: true,
              thickness: 8,
              radius: const Radius.circular(8),
              child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.02),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth < 700
                        ? 2
                        : 3, // Set to a fixed number of columns (3)
                    crossAxisSpacing: screenWidth * 0.05,
                    mainAxisSpacing: screenHeight * 0.05,
                    childAspectRatio:
                        screenWidth / 400, // Adjust this ratio for size
                  ),
                  itemCount: components.length,
                  itemBuilder: (context, index) {
                    return MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          hoveredIndex = index; // Set hovered index
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          hoveredIndex = -1; // Reset on hover exit
                        });
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => destinations[index],
                          ));
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: hoveredIndex == index
                                ? CommonColor.primaryColorLight
                                : Colors.white, // Change color on hover
                            borderRadius:
                                BorderRadius.circular(screenHeight * 0.02),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(4, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                height: screenHeight * 0.1,
                                width: screenWidth * 0.1,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      CommonColor.primaryColor,
                                      CommonColor.secondaryColor,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Semantics(
                                  label: components[index]['icon'].toString(),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(CupertinoPageRoute(
                                        builder: (context) =>
                                            destinations[index],
                                      ));
                                    },
                                    icon: Icon(
                                      components[index]['icon'],
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Semantics(
                                label: components[index]['title'].toString(),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(CupertinoPageRoute(
                                      builder: (context) => destinations[index],
                                    ));
                                  },
                                  child: Text(
                                    components[index]['title'],
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: CommonColor.primaryColorDark,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
