
import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class AutocompleteScreen extends StatelessWidget {
  const AutocompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> continents = [
      'Asia',
      'Africa',
      'Europe',
      'North America',
      'South America',
      'Antarctica',
      'Australia',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Autocomplete Input",
            style: TextStyle(color: Colors.white)),
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
              "Enter Continent Name:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<
                      String>.empty(); // No suggestions when text is empty
                } else {
                  return continents.where((continent) => continent
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase()));
                }
              },
              onSelected: (String selectedContinent) {
                _showAlertDialog(
                    context, 'Selected Continent', selectedContinent, false);
              },
              fieldViewBuilder:
                  (context, controller, focusNode, onFieldSubmitted) {
                return TextField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    labelText: 'Enter Continent',
                    hintText: 'Start typing a continent...',
                    border: OutlineInputBorder(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to show an alert dialog with the selected continent
  void _showAlertDialog(
      BuildContext context, String title, String content, bool isImportant) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
