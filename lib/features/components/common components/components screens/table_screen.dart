import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tables",
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
    );
  }
}
// import 'package:flutter/material.dart';

// class TableScreen extends StatefulWidget {
//   const TableScreen({super.key});

//   @override
//   _TablesScreenState createState() => _TablesScreenState();
// }

// class _TablesScreenState extends State<TableScreen> {
//   // Sample data for tables
//   List<Map<String, String>> tableData = [
//     {"Name": "John", "Age": "23", "Country": "USA"},
//     {"Name": "Alice", "Age": "30", "Country": "UK"},
//     {"Name": "Bob", "Age": "25", "Country": "Canada"},
//     {"Name": "Charlie", "Age": "28", "Country": "Australia"},
//   ];

//   bool _isEditable = false;
//   bool _isSortable = false;
//   String _filterText = '';
//   int _rowsPerPage = 2;

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     double iconSize = width > 800 ? height * 0.06 : height * 0.05;
//     double cardPadding = width > 800 ? 6.0 : 12.0;
//     double titleFontSize = width > 800 ? 18 : 16;

//     // Adjust child aspect ratio dynamically to prevent overflow
//     double aspectRatio = width > 800 ? 1.5 : 1;

//     return Scaffold(
//       appBar: AppBar(
//         title:
//             const Text("Tables Example", style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//         ),
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.blueAccent, Colors.lightBlue],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: RawScrollbar(
//             thumbColor: Colors.white,
//             thumbVisibility: true,
//             thickness: 4,
//             radius: Radius.circular(8),
//             child: GridView.count(
//               crossAxisCount: width > 800
//                   ? 4
//                   : (width > 600 ? 3 : 2), // More columns for larger screens
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//               childAspectRatio:
//                   aspectRatio, // Dynamic aspect ratio to avoid overflow
//               children: [
//                 _buildTableCard(
//                   'Basic Table',
//                   _buildBasicTable(),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                 ),
//                 _buildTableCard(
//                   'Editable Table',
//                   _buildEditableTable(),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                 ),
//                 _buildTableCard(
//                   'Sortable Table',
//                   _buildSortableTable(),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                 ),
//                 _buildTableCard(
//                   'Filterable Table',
//                   _buildFilterableTable(),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                 ),
//                 _buildTableCard(
//                   'Paginated Table',
//                   _buildPaginatedTable(),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                 ),
//                 _buildTableCard(
//                   'Dynamic Column Table',
//                   _buildDynamicColumnTable(),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                 ),
//                 _buildTableCard(
//                   'Data Grid (Interactive Table)',
//                   _buildInteractiveTable(),
//                   iconSize,
//                   cardPadding,
//                   titleFontSize,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTableCard(
//     String title,
//     Widget tableWidget,
//     double iconSize,
//     double cardPadding,
//     double titleFontSize,
//   ) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(cardPadding),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: TextStyle(
//                 fontSize: titleFontSize,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 10),
//             Expanded(child: tableWidget), // Use Expanded to prevent overflow
//           ],
//         ),
//       ),
//     );
//   }

//   // Basic Table
//   Widget _buildBasicTable() {
//     return DataTable(
//       columns: const [
//         DataColumn(label: Text('Name')),
//         DataColumn(label: Text('Age')),
//         DataColumn(label: Text('Country')),
//       ],
//       rows: tableData.map((data) {
//         return DataRow(cells: [
//           DataCell(Text(data['Name']!)),
//           DataCell(Text(data['Age']!)),
//           DataCell(Text(data['Country']!)),
//         ]);
//       }).toList(),
//     );
//   }

//   // Editable Table
//   Widget _buildEditableTable() {
//     return ListView.builder(
//       itemCount: tableData.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Row(
//             children: [
//               TextField(
//                 controller:
//                     TextEditingController(text: tableData[index]['Name']),
//                 onChanged: (value) {
//                   setState(() {
//                     tableData[index]['Name'] = value;
//                   });
//                 },
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextField(
//                 controller:
//                     TextEditingController(text: tableData[index]['Age']),
//                 onChanged: (value) {
//                   setState(() {
//                     tableData[index]['Age'] = value;
//                   });
//                 },
//                 decoration: InputDecoration(labelText: 'Age'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   // Sortable Table
//   Widget _buildSortableTable() {
//     // Example sorting logic, sortable by Name
//     tableData.sort((a, b) => a['Name']!.compareTo(b['Name']!));

//     return DataTable(
//       columns: const [
//         DataColumn(label: Text('Name')),
//         DataColumn(label: Text('Age')),
//         DataColumn(label: Text('Country')),
//       ],
//       rows: tableData.map((data) {
//         return DataRow(cells: [
//           DataCell(Text(data['Name']!)),
//           DataCell(Text(data['Age']!)),
//           DataCell(Text(data['Country']!)),
//         ]);
//       }).toList(),
//     );
//   }

//   // Filterable Table
//   Widget _buildFilterableTable() {
//     return Column(
//       children: [
//         TextField(
//           onChanged: (value) {
//             setState(() {
//               _filterText = value;
//             });
//           },
//           decoration: InputDecoration(
//             labelText: 'Filter by Name',
//             border: OutlineInputBorder(),
//           ),
//         ),
//         const SizedBox(height: 10),
//         DataTable(
//           columns: const [
//             DataColumn(label: Text('Name')),
//             DataColumn(label: Text('Age')),
//             DataColumn(label: Text('Country')),
//           ],
//           rows: tableData
//               .where((data) => data['Name']!
//                   .toLowerCase()
//                   .contains(_filterText.toLowerCase()))
//               .map((data) {
//             return DataRow(cells: [
//               DataCell(Text(data['Name']!)),
//               DataCell(Text(data['Age']!)),
//               DataCell(Text(data['Country']!)),
//             ]);
//           }).toList(),
//         ),
//       ],
//     );
//   }

//   // Paginated Table
//   Widget _buildPaginatedTable() {
//     return PaginatedDataTable(
//       header: const Text('Paginated Table'),
//       columns: const [
//         DataColumn(label: Text('Name')),
//         DataColumn(label: Text('Age')),
//         DataColumn(label: Text('Country')),
//       ],
//       source: _DataTableSource(tableData),
//       rowsPerPage: _rowsPerPage,
//     );
//   }

//   // Dynamic Column Table
//   Widget _buildDynamicColumnTable() {
//     List<String> columns = ['Name', 'Age', 'Country'];
//     return DataTable(
//       columns: columns.map((col) => DataColumn(label: Text(col))).toList(),
//       rows: tableData.map((data) {
//         return DataRow(
//             cells: columns.map((col) => DataCell(Text(data[col]!))).toList());
//       }).toList(),
//     );
//   }

//   // Interactive Data Grid (Interactive Table)
//   Widget _buildInteractiveTable() {
//     return ListView.builder(
//       itemCount: tableData.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Row(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   print('Row ${index + 1} clicked');
//                 },
//                 child: Text(tableData[index]['Name']!),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   print('Row ${index + 1} clicked');
//                 },
//                 child: Text(tableData[index]['Age']!),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   print('Row ${index + 1} clicked');
//                 },
//                 child: Text(tableData[index]['Country']!),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// // DataTableSource for Paginated Table
// class _DataTableSource extends DataTableSource {
//   final List<Map<String, String>> data;

//   _DataTableSource(this.data);

//   @override
//   DataRow? getRow(int index) {
//     if (index >= data.length) return null;
//     return DataRow(cells: [
//       DataCell(Text(data[index]['Name']!)),
//       DataCell(Text(data[index]['Age']!)),
//       DataCell(Text(data[index]['Country']!)),
//     ]);
//   }

//   @override
//   int get rowCount => data.length;

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get selectedRowCount => 0;
// }
