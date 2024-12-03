import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> fruits = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grape',
    'Kiwi',
    'Lemon',
    'Mango',
    'Orange',
    'Peach',
    'Pear',
    'Pineapple',
    'Strawberry',
    'Watermelon'
  ];

  List<String> filteredFruits = [];

  @override
  void initState() {
    super.initState();
    filteredFruits = fruits; // Initialize filtered fruits with all fruits
  }

  void _filterFruits(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredFruits = fruits;
      } else {
        filteredFruits = fruits.where((fruit) {
          return fruit.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search", style: TextStyle(color: Colors.white)),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Search for Fruits:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              onChanged: _filterFruits,
              decoration: const InputDecoration(
                labelText: 'Search fruits',
                hintText: 'Enter fruit name...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: filteredFruits.isEmpty
                  ? const Center(
                      child: Text(
                        'No results found',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredFruits.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(filteredFruits[index]),
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
