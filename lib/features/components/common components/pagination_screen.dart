import 'package:components_automation/core/constants.dart';
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
  bool _isInitialLoading = true; // Flag for the first data load
  int _currentPage = 1;
  final int _pageSize = 21; // Load 21 items per scroll

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

    if (mounted) {
      setState(() {
        _data.addAll(newData);
        _isLoading = false;
        _isInitialLoading = false; // First load completed
        _currentPage++;
      });
    }
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
      body: _isInitialLoading
          ? const Center(
              child:
                  CircularProgressIndicator(), // Center spinner for initial loading
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 600
                    ? 3
                    : 1; // 3 columns for large screens
                double itemWidth = constraints.maxWidth / crossAxisCount;

                return RawScrollbar(
                  thumbColor: CommonColor.secondaryColor,
                  thumbVisibility: true,
                  thickness: 4,
                  radius: const Radius.circular(8),
                  child: GridView.builder(
                    controller: _scrollController,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio:
                          itemWidth / 100, // Adjust item height based on width
                    ),
                    itemCount: _data.length + (_isLoading ? crossAxisCount : 0),
                    itemBuilder: (context, index) {
                      // Show spinner as a full-width row at the end
                      if (index >= _data.length) {
                        return index % crossAxisCount == 0
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : const SizedBox(); // Empty cells to fill the last row
                      }
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Item ${_data[index]}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Properly dispose of the controller
    super.dispose();
  }
}
