import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class BasicTableScreen extends StatelessWidget {
  const BasicTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Table", style: TextStyle(color: Colors.white)),
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Card(
            margin: const EdgeInsets.all(16.0),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable(
                border: TableBorder.all(
                  // Adds borders to the table
                  color: Colors.grey,
                  width: 1,
                ),
                columns: const [
                  DataColumn(
                      label: Text('ID',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Name',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Age',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('1')),
                    DataCell(Text('John Doe')),
                    DataCell(Text('28')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('2')),
                    DataCell(Text('Jane Smith')),
                    DataCell(Text('34')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('3')),
                    DataCell(Text('Sam Brown')),
                    DataCell(Text('45')),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditableTableScreen extends StatefulWidget {
  const EditableTableScreen({super.key});

  @override
  _EditableTableScreenState createState() => _EditableTableScreenState();
}

class _EditableTableScreenState extends State<EditableTableScreen> {
  // Table data stored as a list of maps
  List<Map<String, dynamic>> tableData = [
    {"id": "1", "name": "John Doe", "age": "28"},
    {"id": "2", "name": "Jane Smith", "age": "34"},
    {"id": "3", "name": "Sam Brown", "age": "45"},
  ];

  // Controllers for editing existing rows
  late List<TextEditingController> nameControllers;
  late List<TextEditingController> ageControllers;

  // Controllers for adding new rows
  final TextEditingController newNameController = TextEditingController();
  final TextEditingController newAgeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    // Initialize controllers for each row
    nameControllers = tableData
        .map((row) => TextEditingController(text: row["name"]))
        .toList();
    ageControllers = tableData
        .map((row) => TextEditingController(text: row["age"]))
        .toList();
  }

  @override
  void dispose() {
    // Dispose controllers
    for (var controller in nameControllers) {
      controller.dispose();
    }
    for (var controller in ageControllers) {
      controller.dispose();
    }
    newNameController.dispose();
    newAgeController.dispose();
    super.dispose();
  }

  // Function to add a new row
  void _addNewRow() {
    if (newNameController.text.isNotEmpty && newAgeController.text.isNotEmpty) {
      setState(() {
        tableData.add({
          "id": (tableData.length + 1).toString(),
          "name": newNameController.text,
          "age": newAgeController.text,
        });
        nameControllers
            .add(TextEditingController(text: newNameController.text));
        ageControllers.add(TextEditingController(text: newAgeController.text));
        newNameController.clear();
        newAgeController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            duration: Duration(milliseconds: 100),
            content: Text("Row added successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            duration: Duration(milliseconds: 100),
            content: Text("Please fill in all fields!")),
      );
    }
  }

  // Function to delete a row
  void _deleteRow(int index) {
    setState(() {
      tableData.removeAt(index);
      nameControllers.removeAt(index);
      ageControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Editable Table", style: TextStyle(color: Colors.white)),
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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.all(16.0),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: TextField(
                            controller: newNameController,
                            decoration: const InputDecoration(
                              labelText: "Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: newAgeController,
                            decoration: const InputDecoration(
                              labelText: "Age",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton.icon(
                          onPressed: _addNewRow,
                          icon: const Icon(Icons.add),
                          label: const Text("Add Row"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Table UI
                    DataTable(
                      border: TableBorder.all(color: Colors.grey, width: 1),
                      columns: const [
                        DataColumn(
                            label: Text('ID',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Name',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Age',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Actions',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: List<DataRow>.generate(
                        tableData.length,
                        (index) => DataRow(
                          cells: [
                            DataCell(Text(tableData[index]["id"])),
                            DataCell(
                              TextField(
                                controller: nameControllers[index],
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                              ),
                            ),
                            DataCell(
                              TextField(
                                controller: ageControllers[index],
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            DataCell(
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteRow(index),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Add new row UI
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SortableTableScreen extends StatefulWidget {
  const SortableTableScreen({super.key});

  @override
  _SortableTableScreenState createState() => _SortableTableScreenState();
}

class _SortableTableScreenState extends State<SortableTableScreen> {
  // Table data stored as a list of maps
  List<Map<String, dynamic>> tableData = [
    {"id": "1", "name": "John Doe", "age": "28"},
    {"id": "2", "name": "Jane Smith", "age": "34"},
    {"id": "3", "name": "Sam Brown", "age": "45"},
  ];

  // Controllers for editing existing rows
  late List<TextEditingController> nameControllers;
  late List<TextEditingController> ageControllers;

  // Controllers for adding new rows
  final TextEditingController newNameController = TextEditingController();
  final TextEditingController newAgeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    // Initialize controllers for each row
    nameControllers = tableData
        .map((row) => TextEditingController(text: row["name"]))
        .toList();
    ageControllers = tableData
        .map((row) => TextEditingController(text: row["age"]))
        .toList();
  }

  @override
  void dispose() {
    // Dispose controllers
    for (var controller in nameControllers) {
      controller.dispose();
    }
    for (var controller in ageControllers) {
      controller.dispose();
    }
    newNameController.dispose();
    newAgeController.dispose();
    super.dispose();
  }

  // Function to add a new row
  void _addNewRow() {
    if (newNameController.text.isNotEmpty && newAgeController.text.isNotEmpty) {
      setState(() {
        tableData.add({
          "id": (tableData.length + 1).toString(),
          "name": newNameController.text,
          "age": newAgeController.text,
        });
        nameControllers
            .add(TextEditingController(text: newNameController.text));
        ageControllers.add(TextEditingController(text: newAgeController.text));
        newNameController.clear();
        newAgeController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            duration: Duration(milliseconds: 100),
            content: Text("Row added successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            duration: Duration(milliseconds: 100),
            content: Text("Please fill in all fields!")),
      );
    }
  }

  // Function to delete a row
  void _deleteRow(int index) {
    setState(() {
      tableData.removeAt(index);
      nameControllers.removeAt(index);
      ageControllers.removeAt(index);
    });
  }

  // Function to sort the table data by name in ascending order
  void _sortTableByName() {
    setState(() {
      tableData.sort((a, b) => a["name"].compareTo(b["name"]));
      // Update controllers after sorting
      nameControllers = tableData
          .map((row) => TextEditingController(text: row["name"]))
          .toList();
      ageControllers = tableData
          .map((row) => TextEditingController(text: row["age"]))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Sortable Table", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor:
            CommonColor.primaryColor, // Change to your desired color
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.all(16.0),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: TextField(
                            controller: newNameController,
                            decoration: const InputDecoration(
                              labelText: "Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          width: 100,
                          child: TextField(
                            controller: newAgeController,
                            decoration: const InputDecoration(
                              labelText: "Age",
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton.icon(
                          onPressed: _addNewRow,
                          icon: const Icon(Icons.add),
                          label: const Text("Add Row"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Sort Button
                    ElevatedButton(
                      onPressed: _sortTableByName,
                      child: const Text("Sort by Name"),
                    ),
                    const SizedBox(height: 16),

                    // Table UI
                    DataTable(
                      border: TableBorder.all(color: Colors.grey, width: 1),
                      columns: const [
                        DataColumn(
                            label: Text('ID',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Name',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Age',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        DataColumn(
                            label: Text('Actions',
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                      rows: List<DataRow>.generate(
                        tableData.length,
                        (index) => DataRow(
                          cells: [
                            DataCell(Text(tableData[index]["id"])),
                            DataCell(
                              TextField(
                                controller: nameControllers[index],
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                              ),
                            ),
                            DataCell(
                              TextField(
                                controller: ageControllers[index],
                                decoration: const InputDecoration(
                                    border: InputBorder.none),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            DataCell(
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteRow(index),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Add new row UI
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FilterableTableScreen extends StatefulWidget {
  const FilterableTableScreen({super.key});

  @override
  _FilterableTableScreenState createState() => _FilterableTableScreenState();
}

class _FilterableTableScreenState extends State<FilterableTableScreen> {
  // Sample table data
  List<Map<String, dynamic>> tableData = [
    {"id": "1", "name": "John Doe", "age": "28"},
    {"id": "2", "name": "Jane Smith", "age": "34"},
    {"id": "3", "name": "Sam Brown", "age": "45"},
    {"id": "4", "name": "Mike Davis", "age": "30"},
    {"id": "5", "name": "Emily Clark", "age": "40"},
  ];

  // List to store the filtered data
  List<Map<String, dynamic>> filteredData = [];

  // Controller for the search/filter input
  TextEditingController filterController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize filtered data with all table data initially
    filteredData = tableData;
  }

  // Filter the table based on the search text
  void _filterTable(String query) {
    final filtered = tableData.where((row) {
      return row["name"].toLowerCase().contains(query.toLowerCase()) ||
          row["age"].contains(query);
    }).toList();
    setState(() {
      filteredData = filtered;
    });
  }

  @override
  void dispose() {
    filterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filterable Table"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Card(
            margin: const EdgeInsets.all(16.0),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Search bar for filtering
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
                      width: 300,
                      child: TextField(
                        controller: filterController,
                        onChanged: _filterTable,
                        decoration: const InputDecoration(
                          labelText: "Search by name or age",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),

                  // Table UI
                  DataTable(
                    border: TableBorder.all(color: Colors.grey, width: 1),
                    columns: const [
                      DataColumn(
                          label: Text('ID',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Name',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Age',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: List<DataRow>.generate(
                      filteredData.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text(filteredData[index]["id"])),
                          DataCell(Text(filteredData[index]["name"])),
                          DataCell(Text(filteredData[index]["age"])),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PaginatedTableScreen extends StatelessWidget {
  const PaginatedTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paginated Table'),
      ),
      body: PaginatedDataTable(
        header: const Text('User Data'),
        columns: const [
          DataColumn(label: Text('ID')),
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Age')),
        ],
        source: _DataSource(),
        rowsPerPage: 3,
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  final List<Map<String, dynamic>> data = [
    {'ID': 1, 'Name': 'John Doe', 'Age': 28},
    {'ID': 2, 'Name': 'Jane Smith', 'Age': 34},
    {'ID': 3, 'Name': 'Sam Brown', 'Age': 45},
    {'ID': 4, 'Name': 'Chris Green', 'Age': 23},
    {'ID': 5, 'Name': 'Alex Black', 'Age': 30},
  ];

  @override
  DataRow getRow(int index) {
    final e = data[index];
    return DataRow(cells: [
      DataCell(Text(e['ID'].toString())),
      DataCell(Text(e['Name'])),
      DataCell(Text(e['Age'].toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}

class DynamicColumnTableScreen extends StatelessWidget {
  const DynamicColumnTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Column Table'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('Country')),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('John Doe')),
              DataCell(Text('28')),
              DataCell(Text('Nepal')),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Jane Smith')),
              DataCell(Text('34')),
              DataCell(Text('USA')),
            ]),
            DataRow(cells: [
              DataCell(Text('3')),
              DataCell(Text('Sam Brown')),
              DataCell(Text('45')),
              DataCell(Text('UK')),
            ]),
          ],
        ),
      ),
    );
  }
}

class DataGridTableScreen extends StatefulWidget {
  const DataGridTableScreen({super.key});

  @override
  _DataGridTableScreenState createState() => _DataGridTableScreenState();
}

class _DataGridTableScreenState extends State<DataGridTableScreen> {
  List<Map<String, dynamic>> data = [
    {'ID': 1, 'Name': 'John Doe', 'Age': 28},
    {'ID': 2, 'Name': 'Jane Smith', 'Age': 34},
    {'ID': 3, 'Name': 'Sam Brown', 'Age': 45},
    {'ID': 4, 'Name': 'Lisa White', 'Age': 29},
    {'ID': 5, 'Name': 'Mark Green', 'Age': 40},
    {'ID': 6, 'Name': 'Emma Black', 'Age': 36},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Grid Table'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Data Grid:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 2.5, // Adjust cell width/height ratio
                ),
                itemCount:
                    data.length * 3, // Each row has 3 fields: ID, Name, Age
                itemBuilder: (context, index) {
                  // Calculate row and column positions
                  int rowIndex = index ~/ 3;
                  int colIndex = index % 3;

                  // Display data based on column index
                  String value;
                  switch (colIndex) {
                    case 0:
                      value = data[rowIndex]['ID'].toString();
                      break;
                    case 1:
                      value = data[rowIndex]['Name'];
                      break;
                    case 2:
                      value = data[rowIndex]['Age'].toString();
                      break;
                    default:
                      value = '';
                  }

                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black26),
                    ),
                    child: Text(
                      value,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
