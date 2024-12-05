// import 'package:flutter/material.dart';

// class BasicTableScreen extends StatelessWidget {
//   const BasicTableScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Basic Table'),
//       ),
//       body: Center(
//         child: const Text('This is the Basic Table screen.'),
//       ),
//     );
//   }
// }

// class EditableTableScreen extends StatelessWidget {
//   const EditableTableScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Editable Table'),
//       ),
//       body: Center(
//         child: const Text('This is the Editable Table screen.'),
//       ),
//     );
//   }
// }

// class SortableTableScreen extends StatelessWidget {
//   const SortableTableScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sortable Table'),
//       ),
//       body: Center(
//         child: const Text('This is the Sortable Table screen.'),
//       ),
//     );
//   }
// }

// class FilterableTableScreen extends StatelessWidget {
//   const FilterableTableScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Filterable Table'),
//       ),
//       body: Center(
//         child: const Text('This is the Filterable Table screen.'),
//       ),
//     );
//   }
// }

// class PaginatedTableScreen extends StatelessWidget {
//   const PaginatedTableScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Paginated Table'),
//       ),
//       body: Center(
//         child: const Text('This is the Paginated Table screen.'),
//       ),
//     );
//   }
// }

// class DynamicColumnTableScreen extends StatelessWidget {
//   const DynamicColumnTableScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dynamic Column Table'),
//       ),
//       body: Center(
//         child: const Text('This is the Dynamic Column Table screen.'),
//       ),
//     );
//   }
// }

// class DataGridScreen extends StatelessWidget {
//   const DataGridScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Data Grid'),
//       ),
//       body: Center(
//         child: const Text('This is the Data Grid screen.'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class BasicTableScreen extends StatelessWidget {
  const BasicTableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Table'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
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
    );
  }
}

class EditableTableScreen extends StatefulWidget {
  const EditableTableScreen({super.key});

  @override
  _EditableTableScreenState createState() => _EditableTableScreenState();
}

class _EditableTableScreenState extends State<EditableTableScreen> {
  List<DataRow> rows = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editable Table'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
          ],
          rows: rows,
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
  bool sortAscending = true;
  int sortColumnIndex = 0;

  List<Map<String, dynamic>> data = [
    {'ID': 1, 'Name': 'John Doe', 'Age': 28},
    {'ID': 2, 'Name': 'Jane Smith', 'Age': 34},
    {'ID': 3, 'Name': 'Sam Brown', 'Age': 45},
  ];

  void sort<T>(Comparable<T> Function(Map<String, dynamic>) getField,
      int columnIndex, bool ascending) {
    data.sort((a, b) {
      if (!ascending) {
        final temp = a;
        a = b;
        b = temp;
      }
      return Comparable.compare(getField(a), getField(b));
    });
    setState(() {
      sortColumnIndex = columnIndex;
      sortAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sortable Table'),
      ),
      body: SingleChildScrollView(
        child: DataTable(
          sortColumnIndex: sortColumnIndex,
          sortAscending: sortAscending,
          columns: [
            DataColumn(
              label: const Text('ID'),
              onSort: (columnIndex, ascending) {
                sort<int>((d) => d['ID'], columnIndex, ascending);
              },
            ),
            DataColumn(
              label: const Text('Name'),
              onSort: (columnIndex, ascending) {
                sort<String>((d) => d['Name'], columnIndex, ascending);
              },
            ),
            DataColumn(
              label: const Text('Age'),
              onSort: (columnIndex, ascending) {
                sort<int>((d) => d['Age'], columnIndex, ascending);
              },
            ),
          ],
          rows: data
              .map(
                (e) => DataRow(cells: [
                  DataCell(Text(e['ID'].toString())),
                  DataCell(Text(e['Name'])),
                  DataCell(Text(e['Age'].toString())),
                ]),
              )
              .toList(),
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
  List<Map<String, dynamic>> data = [
    {'ID': 1, 'Name': 'John Doe', 'Age': 28},
    {'ID': 2, 'Name': 'Jane Smith', 'Age': 34},
    {'ID': 3, 'Name': 'Sam Brown', 'Age': 45},
  ];

  List<Map<String, dynamic>>? filteredData;

  @override
  void initState() {
    super.initState();
    filteredData = List.from(data);
  }

  void filterData(String query) {
    setState(() {
      filteredData = data
          .where((d) => d['Name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filterable Table'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: filterData,
              decoration: const InputDecoration(
                labelText: 'Search by Name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Age')),
                  ],
                  rows: filteredData!
                      .map((e) => DataRow(cells: [
                            DataCell(Text(e['ID'].toString())),
                            DataCell(Text(e['Name'])),
                            DataCell(Text(e['Age'].toString())),
                          ]))
                      .toList(),
                ),
              ),
            ),
          ],
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
