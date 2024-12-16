import 'package:components_automation/core/constants.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/chart%20and%20graph/chart_detail_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/lists/list_detail_screen.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ChartsAndGraphsScreenState createState() => _ChartsAndGraphsScreenState();
}

class _ChartsAndGraphsScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lists", style: TextStyle(color: Colors.white)),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RawScrollbar(
            thumbColor: CommonColor.secondaryColor,
            thumbVisibility: true,
            thickness: 4,
            radius: const Radius.circular(8),
            child: SingleChildScrollView(
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: width > 1000 ? 5 : (width > 600 ? 3 : 2),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1,
                children: [
                  _buildListCard(
                      'Basic list',
                      Icons.list, // Updated icon for a basic list
                      cardPadding,
                      titleFontSize,
                      context,
                      'A simple list to display items in a vertical format.'),
                  _buildListCard(
                      'Expandable list',
                      Icons.expand_more, // Updated icon for expandable lists
                      cardPadding,
                      titleFontSize,
                      context,
                      'A list where items can expand to show more details.'),
                  _buildListCard(
                      'Grouped list',
                      Icons.folder, // Icon representing grouped items
                      cardPadding,
                      titleFontSize,
                      context,
                      'A list with grouped items, often organized under headers.'),
                  _buildListCard(
                      'Filterable list',
                      Icons.filter_list, // Updated icon for filtering
                      cardPadding,
                      titleFontSize,
                      context,
                      'A list that allows filtering items based on conditions.'),
                  _buildListCard(
                      'Virtualised list',
                      Icons.memory, // Icon for performance or virtualization
                      cardPadding,
                      titleFontSize,
                      context,
                      'A list optimized for performance when displaying a large number of items.'),
                  _buildListCard(
                      'Drag and drop list',
                      Icons
                          .drag_handle, // Icon representing drag-and-drop functionality
                      cardPadding,
                      titleFontSize,
                      context,
                      'A list where items can be rearranged using drag-and-drop gestures.'),
                  _buildListCard(
                      'Infinite scroll list',
                      Icons
                          .motion_photos_auto, // Icon representing infinite scrolling
                      cardPadding,
                      titleFontSize,
                      context,
                      'A list that loads more items as the user scrolls.'),
                  _buildListCard(
                      'Selectable list',
                      Icons.check_box, // Icon representing selection
                      cardPadding,
                      titleFontSize,
                      context,
                      'A list where users can select one or multiple items.'),
                  _buildListCard(
                      'Reorderable list',
                      Icons.swap_vert, // Icon representing reordering
                      cardPadding,
                      titleFontSize,
                      context,
                      'A list where items can be reordered by the user.'),
                  _buildListCard(
                      'Swipable list',
                      Icons.swipe, // Icon for swipeable interactions
                      cardPadding,
                      titleFontSize,
                      context,
                      'A list where items can be swiped for additional actions like delete or archive.'),
                  _buildListCard(
                      'Interactive list',
                      Icons.touch_app, // Icon for interactivity
                      cardPadding,
                      titleFontSize,
                      context,
                      'A list with interactive elements like buttons or checkboxes.'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build chart cards with tooltips
  Widget _buildListCard(String title, IconData icon, double cardPadding,
      double titleFontSize, BuildContext context, String tooltipMessage) {
    return Tooltip(
      message: tooltipMessage, // Tooltip message explaining the chart
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: () {
            // Navigate to the Chart Detail Screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ListDetailScreen(title: title, icon: icon),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
