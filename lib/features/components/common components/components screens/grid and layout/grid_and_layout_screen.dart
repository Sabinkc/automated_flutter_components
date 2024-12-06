import 'package:components_automation/core/constants.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/grid%20and%20layout/gridandlayout_detail_screen.dart';
import 'package:flutter/material.dart';

class GridAndLayoutScreen extends StatefulWidget {
  const GridAndLayoutScreen({super.key});

  @override
  _ChartsAndGraphsScreenState createState() => _ChartsAndGraphsScreenState();
}

class _ChartsAndGraphsScreenState extends State<GridAndLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Layouts & Components",
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade800, Colors.blueGrey.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RawScrollbar(
            thumbColor: Colors.blueGrey,
            thumbVisibility: true,
            thickness: 4,
            radius: Radius.circular(8),
            child: SingleChildScrollView(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: width > 1000 ? 5 : (width > 600 ? 3 : 2),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1,
                children: [
                  _buildChartCard(
                      'Grid Layout',
                      Icons.grid_3x3,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Organizes items into rows and columns for equal-sized elements.'),
                  _buildChartCard(
                      'Masonry Layout(Staggered)',
                      Icons.photo_size_select_actual,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Arranges items with varying heights, often used for galleries.'),
                  _buildChartCard(
                      'Responsive Layout',
                      Icons.phone_android,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Adjusts for different screen sizes ensuring a smooth experience.'),
                  _buildChartCard(
                      'Scrollable Layout',
                      Icons.move_down,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Displays content in a scrollable view, allowing users to easily navigate through large amounts of data.'),
                  _buildChartCard(
                      'Absolute Positioning',
                      Icons.place,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Positions elements at fixed coordinates for precise control.'),
                  _buildChartCard(
                      'Sticky Headers',
                      Icons.arrow_upward,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Keeps headers visible while scrolling for easy navigation.'),
                  _buildChartCard(
                    'Vertical ListView',
                    Icons.list,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Displays a vertical scrollable list of items.',
                  ),
                  _buildChartCard(
                    'Horizontal ListView',
                    Icons.arrow_forward,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Displays a horizontal scrollable list of items.',
                  ),
                  _buildChartCard(
                    'PageView Layout',
                    Icons.pages,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Allows swiping through pages of content, each in its own full screen.',
                  ),
                  _buildChartCard(
                    'Bottom Navigation Bar',
                    Icons.navigation,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Provides navigation between different app sections via a bottom bar.',
                  ),
                  _buildChartCard(
                    'Tab Bar Layout',
                    Icons.tab,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Organizes content into tabs for easy navigation between sections.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build chart cards with tooltips
  Widget _buildChartCard(String title, IconData icon, double cardPadding,
      double titleFontSize, BuildContext context, String tooltipMessage) {
    return Tooltip(
      message: tooltipMessage, // Tooltip message explaining the chart
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: () {
            // Navigate to the Detail Screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    GridAndLayoutDetailScreen(title: title, icon: icon),
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
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
