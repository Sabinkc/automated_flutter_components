import 'package:components_automation/features/components/common%20components/components%20screens/chart%20and%20graph/chart_detail_scree.dart';
import 'package:flutter/material.dart';

class ChartAndGraphScreen extends StatefulWidget {
  const ChartAndGraphScreen({super.key});

  @override
  _ChartsAndGraphsScreenState createState() => _ChartsAndGraphsScreenState();
}

class _ChartsAndGraphsScreenState extends State<ChartAndGraphScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Charts & Graphs",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
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
                      'Line Chart',
                      Icons.show_chart,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Line charts display data trends over time.'),
                  _buildChartCard(
                      'Bar Chart',
                      Icons.bar_chart,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Bar charts compare quantities of different categories.'),
                  _buildChartCard(
                      'Pie Chart',
                      Icons.pie_chart,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Pie charts show the proportions of different categories.'),
                  _buildChartCard(
                      'Doughnut Chart',
                      Icons.donut_small,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Doughnut charts are similar to pie charts but with a hole in the center.'),
                  _buildChartCard(
                      'Area Chart',
                      Icons.area_chart,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Area charts display quantities over time with shaded areas.'),
                  _buildChartCard(
                      'Radar Chart',
                      Icons.radar,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Radar charts visualize multivariable data in a circular layout.'),
                  _buildChartCard(
                      'Gauge Chart',
                      Icons.speed,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Gauge charts show data on a circular scale, commonly used for measuring performance.'),
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
                    ChartDetailScreen(title: title, icon: icon),
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
                  'Tap to view chart',
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
