import 'package:components_automation/features/components/common%20components/components%20screens/advanced%20components/advanced_component_detail_screen.dart';

import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

class AdvancedComponentScreen extends StatefulWidget {
  const AdvancedComponentScreen({super.key});

  @override
  _AdvancedComponentScreenState createState() =>
      _AdvancedComponentScreenState();
}

class _AdvancedComponentScreenState extends State<AdvancedComponentScreen> {
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
        title: const Text("Specialized UI components",
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
            controller: scrollController,
            thumbColor: CommonColor.secondaryColor,
            thumbVisibility: true,
            thickness: 4,
            radius: const Radius.circular(8),
            child: SingleChildScrollView(
              controller: scrollController,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: width > 1000 ? 5 : (width > 600 ? 3 : 2),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1,
                children: [
                  buildAdvancedComponent(
                    'Sortable Kanban Board',
                    Icons.animation,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Organize tasks visually using a drag-and-drop Kanban board.',
                    const SortableKanbanBoardScreen(),
                  ),
                  buildAdvancedComponent(
                    'Calendar',
                    Icons.calendar_today,
                    cardPadding,
                    titleFontSize,
                    context,
                    'View and manage events in month, week, or day views.',
                    const CalendarScreen(),
                  ),
                  buildAdvancedComponent(
                    'Map Viewer',
                    Icons.map,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Explore locations and visualize data on a map.',
                    const MapViewerScreen(),
                  ),
                  buildAdvancedComponent(
                    'Signature Pad',
                    Icons.edit,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Capture handwritten signatures digitally.',
                    const SignaturePadScreen(),
                  ),
              buildAdvancedComponent(
                    'Animated Widgets',
                    Icons.animation,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Bring your UI to life with animations.',
                    const AnimatedWidgetScreen(),
                  ),
                  buildAdvancedComponent(
                    'Parallax Scrolling',
                    Icons.view_carousel,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Create immersive scrolling effects.',
                    const ParallaxScrollingScreen(),
                  ),
                  buildAdvancedComponent(
                    'Customized Bottom Navigation',
                    Icons.menu,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Enhance navigation with customized styles and behavior.',
                    const CustomisedBottomNavigationScreen(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAdvancedComponent(
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
