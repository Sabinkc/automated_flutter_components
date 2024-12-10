import 'package:components_automation/core/constants.dart';

import 'package:components_automation/features/components/common%20components/components%20screens/tables%20and%20screen/table_and_screen_detail.dart';
import 'package:flutter/material.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  _TablesAndGridsScreenState createState() => _TablesAndGridsScreenState();
}

class _TablesAndGridsScreenState extends State<TableScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Tables & Grids", style: TextStyle(color: Colors.white)),
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
            thumbColor: Colors.blueGrey,
            thumbVisibility: true,
            thickness: 4,
            radius: const Radius.circular(8),
            child: SingleChildScrollView(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: width > 1000 ? 5 : (width > 600 ? 3 : 2),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1,
                children: [
                  _buildTableCard(
                      'Basic Table',
                      Icons.table_chart,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Basic tables for displaying static data.'),
                  _buildTableCard(
                      'Editable Table',
                      Icons.edit,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Editable tables for allowing user modifications.'),
                  _buildTableCard(
                      'Sortable Table',
                      Icons.sort,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Sortable tables for sorting data in ascending/descending order.'),
                  _buildTableCard(
                      'Filterable Table',
                      Icons.filter_list,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Filterable tables for searching through rows of data.'),
                  _buildTableCard(
                      'Paginated Table',
                      Icons.pages,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Paginated tables to break up large datasets into multiple pages.'),
                  _buildTableCard(
                      'Dynamic Column Table',
                      Icons.dynamic_form,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Tables with dynamically adjustable columns.'),
                  _buildTableCard(
                      'Data Grid',
                      Icons.grid_on,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Interactive data grids with features like sorting, filtering, and paging.'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build table component cards with tooltips
  Widget _buildTableCard(String title, IconData icon, double cardPadding,
      double titleFontSize, BuildContext context, String tooltipMessage) {
    return Tooltip(
      message: tooltipMessage, // Tooltip message explaining the table
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: () {
            // Navigate to the respective table component screen
            switch (title) {
              case 'Basic Table':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BasicTableScreen(),
                  ),
                );
                break;
              case 'Editable Table':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditableTableScreen(),
                  ),
                );
                break;
              case 'Sortable Table':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SortableTableScreen(),
                  ),
                );
                break;
              case 'Filterable Table':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FilterableTableScreen(),
                  ),
                );
                break;
              case 'Paginated Table':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaginatedTableScreen(),
                  ),
                );
                break;
              case 'Dynamic Column Table':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DynamicColumnTableScreen(),
                  ),
                );
                break;
              case 'Data Grid':
                // Navigator.push(
                //   context,
                //   // MaterialPageRoute(
                //   //   builder: (context) => const DataGridScreen(),
                //   // ),
                // );
                break;
            }
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
                  'Tap to view table',
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
