import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartDetailScreen extends StatelessWidget {
  final String title;
  final IconData icon;

  const ChartDetailScreen({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    Widget chartWidget;

    // Render the appropriate chart based on the title
    switch (title) {
      case 'Line Chart':
        chartWidget = _buildLineChart();
        break;
      case 'Bar Chart':
        chartWidget = _buildBarChart();
        break;
      case 'Pie Chart':
        chartWidget = _buildPieChart();
        break;
      case 'Doughnut Chart':
        chartWidget = _buildDoughnutChart();
        break;
      case 'Area Chart':
        chartWidget = _buildAreaChart();
        break;
      case 'Radar Chart':
        chartWidget = _buildRadarChart();
        break;
      case 'Gauge Chart':
        chartWidget = _buildGaugeChart();
        break;
      case 'Scatter Chart':
        chartWidget = _buildScatterChart();
      case 'Stacked Bar Chart':
        chartWidget = _buildStackedBarChart();
      default:
        chartWidget = const Text('Chart not available.');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: chartWidget,
        ),
      ),
    );
  }

  // Build Line Chart
  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 1),
              FlSpot(1, 3),
              FlSpot(2, 2),
              FlSpot(3, 1.5),
              FlSpot(4, 2.5),
              FlSpot(5, 3),
              FlSpot(6, 4),
            ],
            isCurved: true,
            barWidth: 4,
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.blueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }

  // Build Bar Chart
  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        barGroups: [
          BarChartGroupData(
              x: 0, barRods: [BarChartRodData(toY: 5, color: Colors.blue)]),
          BarChartGroupData(
              x: 1, barRods: [BarChartRodData(toY: 3, color: Colors.red)]),
          BarChartGroupData(
              x: 2, barRods: [BarChartRodData(toY: 4, color: Colors.green)]),
          BarChartGroupData(
              x: 3, barRods: [BarChartRodData(toY: 7, color: Colors.orange)]),
        ],
      ),
    );
  }

  // Build Pie Chart
  Widget _buildPieChart() {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(value: 40, color: Colors.blue, title: '40%'),
          PieChartSectionData(value: 30, color: Colors.red, title: '30%'),
          PieChartSectionData(value: 20, color: Colors.green, title: '20%'),
          PieChartSectionData(value: 10, color: Colors.orange, title: '10%'),
        ],
      ),
    );
  }

  // Build Doughnut Chart (Pie Chart with hole in the center)
  Widget _buildDoughnutChart() {
    return PieChart(
      PieChartData(
        sectionsSpace: 0,
        centerSpaceRadius: 50,
        sections: [
          PieChartSectionData(value: 25, color: Colors.blue, title: '25%'),
          PieChartSectionData(value: 25, color: Colors.red, title: '25%'),
          PieChartSectionData(value: 25, color: Colors.green, title: '25%'),
          PieChartSectionData(value: 25, color: Colors.orange, title: '25%'),
        ],
      ),
    );
  }

  // Build Area Chart (Line chart with filled area below)
  Widget _buildAreaChart() {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 1),
              FlSpot(1, 1.5),
              FlSpot(2, 1.8),
              FlSpot(3, 2),
              FlSpot(4, 1.7),
              FlSpot(5, 2.5),
              FlSpot(6, 3),
            ],
            isCurved: true,
            color: Colors.blue, // Color of the line
            barWidth: 2,
            belowBarData: BarAreaData(
              show: true,
              color: Colors.blue.withOpacity(0.3), // Fill color below the line
            ),
          ),
        ],
      ),
    );
  }

  // Radar Chart Implementation
  Widget _buildRadarChart() {
    return RadarChart(
      RadarChartData(
        radarTouchData: RadarTouchData(enabled: false),
        dataSets: [
          RadarDataSet(
            dataEntries: [
              const RadarEntry(value: 3),
              const RadarEntry(value: 2),
              const RadarEntry(value: 4),
              const RadarEntry(value: 1),
              const RadarEntry(value: 5),
            ],
            borderColor: Colors.blue,
            fillColor: Colors.blue.withOpacity(0.3),
            borderWidth: 2,
          ),
        ],
        gridBorderData: const BorderSide(color: Colors.blue, width: 1),
        // gridLineData: const GridLineData(show: true),
        titleTextStyle: const TextStyle(color: Colors.blue, fontSize: 14),
      ),
    );
  }

  Widget _buildGaugeChart() {
    return SizedBox(
      height: 200,
      width: 200,
      child: CustomPaint(
        painter: GaugeChartPainter(),
      ),
    );
  }
}

// Build Scatter Chart
Widget _buildScatterChart() {
  return ScatterChart(
    ScatterChartData(
      scatterSpots: [
        ScatterSpot(0, 1),
        ScatterSpot(1, 3),
        ScatterSpot(2, 2),
        ScatterSpot(3, 1.5),
        ScatterSpot(4, 3.5),
        ScatterSpot(5, 2.5),
        ScatterSpot(6, 4),
      ],
    ),
  );
}

// Build Stacked Bar Chart
Widget _buildStackedBarChart() {
  return BarChart(
    BarChartData(
      barGroups: [
        BarChartGroupData(x: 0, barRods: [
          BarChartRodData(toY: 4, color: Colors.blue),
          BarChartRodData(toY: 3, color: Colors.green),
        ]),
        BarChartGroupData(x: 1, barRods: [
          BarChartRodData(toY: 5, color: Colors.red),
          BarChartRodData(toY: 2, color: Colors.orange),
        ]),
        BarChartGroupData(x: 2, barRods: [
          BarChartRodData(toY: 3, color: Colors.purple),
          BarChartRodData(toY: 4, color: Colors.yellow),
        ]),
      ],
    ),
  );
}

// Gauge Chart Custom Painter
class GaugeChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    // Draw the outer circle for the gauge (background circle)
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paint,
    );

    // Draw the filled gauge segment (filled portion)
    paint.color =
        Colors.green; // Change the color to green for the filled portion
    paint.style = PaintingStyle.fill;

    // Draw an arc to represent the filled gauge
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ),
      -90 * 3.14159 / 180, // Starting angle in radians (top-left of the circle)
      180 *
          3.14159 /
          180, // Sweep angle in radians (180 degrees or half circle)
      true, // Whether the arc should be closed
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
