import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class PaginationScreen extends StatefulWidget {
  const PaginationScreen({super.key});

  @override
  _PaginationScreenState createState() => _PaginationScreenState();
}

class _PaginationScreenState extends State<PaginationScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];
  int _currentPage = 1;
  final int _itemsPerPage = 20;
  bool _isLoading = false;

  void _performSearch() {
    String query = _searchController.text.trim();

    if (query.isEmpty) {
      _showMessage('Search input cannot be empty!');
      return;
    }

    if (query.length > 100) {
      _showMessage('Input text cannot exceed 100 characters!');
      return;
    }

    setState(() {
      _isLoading = true; // Show loading indicator
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _searchResults = List.generate(
          100,
          (index) => '$query details ${index + 1}',
        );
        _currentPage = 1; // Reset to the first page
        _isLoading = false; // Hide loading indicator
      });
    });
  }

  void _goToPage(int pageNumber) {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _currentPage = pageNumber;
        _isLoading = false; // Hide loading indicator
      });
    });
  }

  List<String> _getPaginatedData() {
    int startIndex = (_currentPage - 1) * _itemsPerPage;
    int endIndex = startIndex + _itemsPerPage;
    return _searchResults.sublist(startIndex,
        endIndex > _searchResults.length ? _searchResults.length : endIndex);
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalPages = (_searchResults.length / _itemsPerPage).ceil();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagination Screen",
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
      body: Semantics(
        container: true,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Semantics(
                      container: true,
                      child: TextField(
                        controller: _searchController,
                        maxLength: 100, // Limit the input to 100 characters
                        decoration: const InputDecoration(
                          labelText: 'Enter text to search',
                          border: OutlineInputBorder(),
                          counterText: '', // Hides the character count
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _performSearch,
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              if (_isLoading)
                Expanded(
                  child: Semantics(
                    button: true,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              else if (_searchResults.isNotEmpty)
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: _getPaginatedData().length,
                          itemBuilder: (context, index) {
                            return Semantics(
                              button: true,
                              child: Card(
                                child: ListTile(
                                  title: TextButton(
                                      onPressed: () {},
                                      child: Text(_getPaginatedData()[index])),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          totalPages,
                          (index) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: ElevatedButton(
                              onPressed: () => _goToPage(index + 1),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _currentPage == index + 1
                                    ? CommonColor.primaryColor
                                    : Colors.grey,
                              ),
                              child: Semantics(
                                  container: true, child: Text('${index + 1}')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              else
                Expanded(
                  child: Center(
                    child: Semantics(
                        container: true,
                        child: Text(
                            'Enter a search term and press the search icon')),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
