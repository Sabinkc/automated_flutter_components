// import 'package:components_automation/core/constants.dart';
// import 'package:flutter/material.dart';

// class PaginationScreen extends StatelessWidget {
//   const PaginationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Pagination",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: CommonColor.primaryColor,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({super.key});

  @override
  _PaginationScreenState createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  final List<int> _data = []; // Store paginated data
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  int _currentPage = 1;
  final int _pageSize = 20;

  @override
  void initState() {
    super.initState();
    _fetchData(); // Load initial data
    _scrollController
        .addListener(_scrollListener); // Add listener for pagination
  }

  // Simulate fetching data from an API
  Future<void> _fetchData() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    List<int> newData = List.generate(
        _pageSize, (index) => (_currentPage - 1) * _pageSize + index + 1);

    setState(() {
      _data.addAll(newData);
      _isLoading = false;
      _currentPage++;
    });
  }

  // Scroll listener for detecting when the user scrolls near the end
  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchData(); // Fetch more data
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pagination",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // Tablet/Desktop View
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blue[100],
                    child: const Center(
                      child: Text(
                        "Sidebar",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: _buildPaginationList(),
                ),
              ],
            );
          } else {
            // Mobile View
            return _buildPaginationList();
          }
        },
      ),
    );
  }

  // Widget to build paginated list
  Widget _buildPaginationList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _data.length + 1, // Add 1 for the loading indicator
      itemBuilder: (context, index) {
        if (index == _data.length) {
          // Show loading indicator
          return _isLoading
              ? const Center(
                  child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ))
              : const SizedBox(); // Empty if no more data
        }
        return ListTile(
          title: Text('Item ${_data[index]}'),
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text('${_data[index]}'),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
