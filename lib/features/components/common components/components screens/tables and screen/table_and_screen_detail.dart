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
        title: const Text("Filterable Table",
            style: TextStyle(color: Colors.white)),
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

class PaginatedTableScreen extends StatefulWidget {
  const PaginatedTableScreen({super.key});

  @override
  _PaginatedTableScreenState createState() => _PaginatedTableScreenState();
}

class _PaginatedTableScreenState extends State<PaginatedTableScreen> {
  // Sample table data
  List<Map<String, dynamic>> tableData = [
    {"id": "1", "name": "John Doe", "age": "28"},
    {"id": "2", "name": "Jane Smith", "age": "34"},
    {"id": "3", "name": "Sam Brown", "age": "45"},
    {"id": "4", "name": "Mike Davis", "age": "30"},
    {"id": "5", "name": "Emily Clark", "age": "40"},
    {"id": "6", "name": "Jake White", "age": "25"},
    {"id": "7", "name": "Sarah Green", "age": "33"},
    {"id": "8", "name": "Tom Black", "age": "29"},
    {"id": "9", "name": "Anna Grey", "age": "22"},
    {"id": "10", "name": "David Blue", "age": "41"},
    {"id": "11", "name": "Olivia Brown", "age": "29"},
    {"id": "12", "name": "Sophia Clark", "age": "37"},
    {"id": "13", "name": "Liam Scott", "age": "23"},
    {"id": "14", "name": "Noah Harris", "age": "50"},
    {"id": "15", "name": "Ava Lewis", "age": "31"},
  ];

  // Pagination variables
  int currentPage = 1;
  int rowsPerPage = 5;
  int totalPages = 0;

  @override
  void initState() {
    super.initState();
    totalPages = (tableData.length / rowsPerPage).ceil();
  }

  // Get the data for the current page
  List<Map<String, dynamic>> _getCurrentPageData() {
    int startIndex = (currentPage - 1) * rowsPerPage;
    int endIndex = (startIndex + rowsPerPage) > tableData.length
        ? tableData.length
        : startIndex + rowsPerPage;
    return tableData.sublist(startIndex, endIndex);
  }

  // Handle next page
  void _nextPage() {
    if (currentPage < totalPages) {
      setState(() {
        currentPage++;
      });
    }
  }

  // Handle previous page
  void _previousPage() {
    if (currentPage > 1) {
      setState(() {
        currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paginated Table",
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
                  // Table UI with pagination
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
                      _getCurrentPageData().length,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text(_getCurrentPageData()[index]["id"])),
                          DataCell(Text(_getCurrentPageData()[index]["name"])),
                          DataCell(Text(_getCurrentPageData()[index]["age"])),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Pagination controls
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _previousPage,
                        child: const Text("Previous"),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Page $currentPage of $totalPages",
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _nextPage,
                        child: const Text("Next"),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
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

class DynamicColumnTableScreen extends StatefulWidget {
  const DynamicColumnTableScreen({super.key});

  @override
  _DynamicColumnTableScreenState createState() =>
      _DynamicColumnTableScreenState();
}

class _DynamicColumnTableScreenState extends State<DynamicColumnTableScreen> {
  // Sample data for the table (dynamic columns and rows)
  List<Map<String, dynamic>> tableData = [
    {
      "id": "1",
      "name": "John Doe",
      "age": 28,
    },
    {
      "id": "2",
      "name": "Jane Smith",
      "age": 34,
    },
    {
      "id": "3",
      "name": "Sam Brown",
      "age": 45,
    },
    {
      "id": "4",
      "name": "Mike Davis",
      "age": 30,
    },
    {
      "id": "5",
      "name": "Emily Clark",
      "age": 40,
    },
  ];

  // Columns (could be dynamic or user-defined as well)
  List<String> columnHeaders = [
    "id",
    "name",
    "age",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Column Table",
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
                  LayoutBuilder(
                    builder: (context, constraints) {
                      // Check screen size and adjust accordingly
                      bool isSmallScreen = constraints.maxWidth < 600;

                      return Column(
                        children: [
                          // DataTable with responsive behavior
                          DataTable(
                            border:
                                TableBorder.all(color: Colors.grey, width: 1),
                            columns: columnHeaders
                                .map(
                                  (column) => DataColumn(
                                    label: Text(
                                      column.toUpperCase(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                                .toList(),
                            rows: List<DataRow>.generate(
                              tableData.length,
                              (index) => DataRow(
                                cells: columnHeaders
                                    .map(
                                      (column) => DataCell(
                                        // Use Flexible for better spacing in each cell on small screens
                                        Flexible(
                                          child: Text(tableData[index][column]
                                              .toString()),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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

class InteractiveTableScreen extends StatefulWidget {
  const InteractiveTableScreen({super.key});

  @override
  _InteractiveTableScreenState createState() => _InteractiveTableScreenState();
}

class _InteractiveTableScreenState extends State<InteractiveTableScreen> {
  // Sample data for the table without email
  List<Map<String, dynamic>> tableData = [
    {"id": "1", "name": "John Doe", "age": 28},
    {"id": "2", "name": "Jane Smith", "age": 34},
    {"id": "3", "name": "Sam Brown", "age": 45},
    {"id": "4", "name": "Mike Davis", "age": 30},
    {"id": "5", "name": "Emily Clark", "age": 40},
  ];

  // Updated column headers without email
  List<String> columnHeaders = ["id", "name", "age"];

  // For sorting
  int _sortColumnIndex = 0;
  bool _isAscending = true;

  // For filtering
  TextEditingController filterController = TextEditingController();

  // For adding new row (user input)
  TextEditingController newIdController = TextEditingController();
  TextEditingController newNameController = TextEditingController();
  TextEditingController newAgeController = TextEditingController();

  @override
  void dispose() {
    filterController.dispose();
    newIdController.dispose();
    newNameController.dispose();
    newAgeController.dispose();
    super.dispose();
  }

  // Sort function
  void _sortData(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _isAscending = ascending;
      tableData.sort((a, b) {
        final aValue = a[columnHeaders[columnIndex]].toString().toLowerCase();
        final bValue = b[columnHeaders[columnIndex]].toString().toLowerCase();
        if (ascending) {
          return aValue.compareTo(bValue);
        } else {
          return bValue.compareTo(aValue);
        }
      });
    });
  }

  // Filter function
  void _filterTable(String query) {
    setState(() {
      if (query.isEmpty) {
        tableData = [
          {"id": "1", "name": "John Doe", "age": 28},
          {"id": "2", "name": "Jane Smith", "age": 34},
          {"id": "3", "name": "Sam Brown", "age": 45},
          {"id": "4", "name": "Mike Davis", "age": 30},
          {"id": "5", "name": "Emily Clark", "age": 40},
        ]; // Reset data
      } else {
        tableData = tableData.where((row) {
          return row.values.any((value) {
            return value.toString().toLowerCase().contains(query.toLowerCase());
          });
        }).toList();
      }
    });
  }

  // Function to add a row
  void _addRow() {
    newIdController.clear();
    newNameController.clear();
    newAgeController.clear();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Row"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: newIdController,
                decoration: const InputDecoration(labelText: "ID"),
              ),
              TextField(
                controller: newNameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
              TextField(
                controller: newAgeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Age"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  tableData.add({
                    "id": newIdController.text,
                    "name": newNameController.text,
                    "age": int.tryParse(newAgeController.text) ?? 0,
                  });
                });
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  // Function to show details of a specific row
  void _showRowDetails(Map<String, dynamic> row) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Row Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: row.entries
                .map((entry) => Text("${entry.key}: ${entry.value}"))
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  // Build the table UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Interactive Table",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: CommonColor.primaryColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              // Filter input for searching
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextField(
                  controller: filterController,
                  onChanged: _filterTable,
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),

              // Buttons to add and delete rows
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _addRow,
                      child: const Text("Add Row"),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        if (tableData.isNotEmpty) {
                          setState(() {
                            tableData.removeLast();
                          });
                        }
                      },
                      child: const Text("Delete Last Row"),
                    ),
                  ],
                ),
              ),

              // DataTable with sorting functionality and borders
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    child: DataTable(
                      columnSpacing: 20,
                      sortColumnIndex: _sortColumnIndex,
                      sortAscending: _isAscending,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black), // Add border
                        borderRadius: BorderRadius.circular(8),
                      ),
                      columns: columnHeaders.map((column) {
                        return DataColumn(
                          label: Text(column.toUpperCase()),
                          onSort: (int columnIndex, bool ascending) {
                            _sortData(columnIndex, ascending);
                          },
                        );
                      }).toList(),
                      rows: tableData
                          .map(
                            (row) => DataRow(
                              cells: columnHeaders.map((column) {
                                return DataCell(
                                  GestureDetector(
                                    onTap: () {
                                      _showRowDetails(row);
                                    },
                                    child: Text(row[column].toString()),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
