// import 'package:components_automation/core/constants.dart';
// import 'package:flutter/material.dart';

// class ListDetailScreen extends StatefulWidget {
//   final String title;
//   final IconData icon;

//   const ListDetailScreen({super.key, required this.title, required this.icon});

//   @override
//   State<ListDetailScreen> createState() => _ListDetailScreenState();
// }

// class _ListDetailScreenState extends State<ListDetailScreen> {
//   List<String> allItems = [
//     'Apple',
//     'Banana',
//     'Orange',
//     'Carrot',
//     'Broccoli',
//     'Spinach',
//     'Cat',
//     'Dog',
//     'Elephant'
//   ];
//   List<String> filteredItems = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredItems = allItems; // Initialize filteredItems
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget listWidget;

//     // Render the appropriate list based on the title
//     switch (widget.title) {
//       case 'Basic list':
//         listWidget = _buildBasicList();
//         break;
//       case 'Expandable list':
//         listWidget = _buildExpandableList();
//         break;
//       case 'Grouped list':
//         listWidget = _buildGroupedList();
//         break;
//       case 'Filterable list':
//         listWidget = _buildFilterableList();
//         break;
//       case 'Virtualised list':
//         listWidget = _buildVirtualisedList();
//         break;
//       case 'Drag and drop list':
//         listWidget = _buildDragAndDropList();
//         break;
//       case 'Infinite scroll list':
//         listWidget = _buildInfiniteScrollList();
//         break;
//       case 'Selectable list':
//         listWidget = _buildSelectableList();
//         break;
//       case 'Reorderable list':
//         listWidget = _buildReorderableList();
//         break;
//       case 'Swipable list':
//         listWidget = _buildSwipableList();
//         break;
//       case 'Interactive list':
//         listWidget = _buildInteractableList();
//         break;
//       default:
//         listWidget = const Text('List not available.');
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title, style: const TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: CommonColor
//             .primaryColor, // Replace with your CommonColor.primaryColor
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: listWidget,
//         ),
//       ),
//     );
//   }

//   // Drag and Drop List
//   Widget _buildDragAndDropList() {
//     return ReorderableListView(
//       onReorder: _onReorder,
//       children: [
//         for (int index = 0; index < filteredItems.length; index++)
//           ListTile(
//             key: ValueKey(index), // Keys are important for reordering
//             title: Text(filteredItems[index]),
//           ),
//       ],
//     );
//   }

//   // Method to handle reordering
//   void _onReorder(int oldIndex, int newIndex) {
//     setState(() {
//       if (newIndex > oldIndex) {
//         newIndex -= 1;
//       }
//       final item = filteredItems.removeAt(oldIndex);
//       filteredItems.insert(newIndex, item);
//     });
//   }

//   // Basic List
//   Widget _buildBasicList() {
//     final List<String> items = [
//       'Item 1',
//       'Item 2',
//       'Item 3',
//       'Item 4',
//       'Item 5',
//       'Item 6',
//       'Item 7',
//       'Item 8',
//       'Item 9',
//       'Item 10'
//     ];

//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         return Card(
//           child: ListTile(
//             title: Text(items[index]),
//             onTap: () {},
//           ),
//         );
//       },
//     );
//   }

//   // Expandable List
//   Widget _buildExpandableList() {
//     final List<Map<String, dynamic>> items = [
//       {
//         'title': 'Fruits',
//         'children': ['Apple', 'Banana', 'Orange', 'Mango']
//       },
//       {
//         'title': 'Vegetables',
//         'children': ['Carrot', 'Tomato', 'Potato', 'Broccoli']
//       },
//       {
//         'title': 'Dairy',
//         'children': ['Milk', 'Cheese', 'Butter', 'Yogurt']
//       },
//     ];

//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, index) {
//         final item = items[index];
//         return Card(
//           child: ExpansionTile(
//             title: Text(item['title']),
//             children: (item['children'] as List<String>).map((child) {
//               return ListTile(
//                 title: Text(child),
//                 leading: Icon(Icons.chevron_right),
//                 onTap: () {},
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }

//   // Grouped List
//   Widget _buildGroupedList() {
//     final groupedData = {
//       'Fruits': ['Apple', 'Banana', 'Orange'],
//       'Vegetables': ['Carrot', 'Broccoli', 'Spinach'],
//       'Animals': ['Cat', 'Dog', 'Elephant'],
//     };

//     return ListView(
//       children: groupedData.entries.map((entry) {
//         final groupTitle = entry.key;
//         final groupItems = entry.value;

//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 groupTitle,
//                 style: const TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             ...groupItems.map((item) => Card(
//                   child: ListTile(
//                     title: Text(item),
//                   ),
//                 )),
//           ],
//         );
//       }).toList(),
//     );
//   }

//   // Filterable List
//   Widget _buildFilterableList() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             onChanged: (query) {
//               setState(() {
//                 if (query.isEmpty) {
//                   filteredItems = allItems;
//                 } else {
//                   filteredItems = allItems
//                       .where((item) =>
//                           item.toLowerCase().contains(query.toLowerCase()))
//                       .toList();
//                 }
//               });
//             },
//             decoration: const InputDecoration(
//               labelText: 'Search',
//               border: OutlineInputBorder(),
//               prefixIcon: Icon(Icons.search),
//             ),
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: filteredItems.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(filteredItems[index]),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }

//   // Virtualised List
//   Widget _buildVirtualisedList() {
//     return ListView.builder(
//       itemCount: 1000, // Number of items in the list
//       itemBuilder: (context, index) {
//         return Card(
//           child: ListTile(
//             title: Text('Item ${index + 1}'),
//           ),
//         );
//       },
//     );
//   }

//   // Infinite Scroll List (Placeholder)
//   Widget _buildInfiniteScrollList() {
//     return const Text("Infinite Scroll List Placeholder");
//   }

//   // Selectable List (Placeholder)
//   Widget _buildSelectableList() {
//     return const Text("Selectable List Placeholder");
//   }

//   // Reorderable List (Placeholder)
//   Widget _buildReorderableList() {
//     return const Text("Reorderable List Placeholder");
//   }

//   // Swipable List (Placeholder)
//   Widget _buildSwipableList() {
//     return const Text("Swipable List Placeholder");
//   }

//   // Interactable List (Placeholder)
//   Widget _buildInteractableList() {
//     return const Text("Interactable List Placeholder");
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: ListDetailScreen(title: 'Drag and drop list', icon: Icons.list),
//   ));
// }

import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class ListDetailScreen extends StatefulWidget {
  final String title;
  final IconData icon;

  const ListDetailScreen({super.key, required this.title, required this.icon});

  @override
  State<ListDetailScreen> createState() => _ListDetailScreenState();
}

class _ListDetailScreenState extends State<ListDetailScreen> {
  List<String> allItems = [
    'Apple',
    'Banana',
    'Orange',
    'Carrot',
    'Broccoli',
    'Spinach',
    'Cat',
    'Dog',
    'Elephant'
  ];
  List<String> filteredItems = [];
  Set<int> selectedItems = {}; // Keep track of selected items by index

  @override
  void initState() {
    super.initState();
    filteredItems = allItems; // Initialize filteredItems
  }

  @override
  Widget build(BuildContext context) {
    Widget listWidget;

    // Render the appropriate list based on the title
    switch (widget.title) {
      case 'Basic list':
        listWidget = _buildBasicList();
        break;
      case 'Expandable list':
        listWidget = _buildExpandableList();
        break;
      case 'Grouped list':
        listWidget = _buildGroupedList();
        break;
      case 'Filterable list':
        listWidget = _buildFilterableList();
        break;
      case 'Virtualised list':
        listWidget = _buildVirtualisedList();
        break;
      case 'Drag and drop list':
        listWidget = _buildDragAndDropList();
        break;
      case 'Infinite scroll list':
        listWidget = _buildInfiniteScrollList();
        break;
      case 'Selectable list':
        listWidget = _buildSelectableList();
        break;
      case 'Reorderable list':
        listWidget = _buildReorderableList();
        break;
      case 'Swipable list':
        listWidget = _buildSwipableList();
        break;
      case 'Interactive list':
        listWidget = _buildInteractableList();
        break;
      default:
        listWidget = const Text('List not available.');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: listWidget,
        ),
      ),
    );
  }

  // Basic List
  Widget _buildBasicList() {
    final List<String> items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
      'Item 6',
      'Item 7',
      'Item 8',
      'Item 9',
      'Item 10'
    ];

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(items[index]),
            onTap: () {},
          ),
        );
      },
    );
  }

  // Selectable List with Checkboxes
  Widget _buildSelectableList() {
    return ListView.builder(
      itemCount: allItems.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(allItems[index]),
            leading: Checkbox(
              value: selectedItems.contains(index),
              onChanged: (bool? selected) {
                setState(() {
                  if (selected == true) {
                    selectedItems.add(index);
                  } else {
                    selectedItems.remove(index);
                  }
                });
              },
            ),
            onTap: () {
              setState(() {
                if (selectedItems.contains(index)) {
                  selectedItems.remove(index);
                } else {
                  selectedItems.add(index);
                }
              });
            },
          ),
        );
      },
    );
  }

  // Reorderable List with Numbers
  Widget _buildReorderableList() {
    return ReorderableListView(
      onReorder: _onReorder,
      children: [
        for (int index = 0; index < allItems.length; index++)
          ListTile(
            key: ValueKey(index),
            title: Text(' ${index + 1}: ${allItems[index]}'),
          ),
      ],
    );
  }

  // Method to handle reordering
  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = allItems.removeAt(oldIndex);
      allItems.insert(newIndex, item);
    });
  }

// // Swipable List with Dismissable Handler
//   Widget _buildSwipableList() {
//     return ListView.builder(
//       itemCount: allItems.length,
//       itemBuilder: (context, index) {
//         return Dismissible(
//           key: ValueKey(index),
//           onDismissed: (direction) {
//             // Remove the item before showing the Snackbar
//             final dismissedItem = allItems[index];
//             setState(() {
//               allItems.removeAt(index);
//             });

//             // Show a snack bar when the item is dismissed
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('$dismissedItem dismissed')),
//             );
//           },
//           background: Container(color: Colors.red),
//           child: Card(
//             child: ListTile(
//               title: Text(allItems[index]),
//               leading: Icon(Icons.delete),
//             ),
//           ),
//         );
//       },
//     );
//   }

// Swipable List with Dismissable Handler
  Widget _buildSwipableList() {
    return ListView.builder(
      itemCount: allItems.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(allItems[index]), // Use the item itself as the key
          onDismissed: (direction) {
            final dismissedItem = allItems[index]; // Get the dismissed item

            // First, remove the item from the list
            setState(() {
              allItems.removeAt(index);
            });

            // Then show the snackbar after updating the list
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  duration: Duration(milliseconds: 100),
                  content: Text('$dismissedItem dismissed')),
            );
          },
          background: Container(color: Colors.red),
          child: Card(
            child: ListTile(
              title: Text(allItems[index]),
              leading: Icon(Icons.delete),
            ),
          ),
        );
      },
    );
  }

  // Expandable List
  Widget _buildExpandableList() {
    final List<Map<String, dynamic>> items = [
      {
        'title': 'Fruits',
        'children': ['Apple', 'Banana', 'Orange', 'Mango']
      },
      {
        'title': 'Vegetables',
        'children': ['Carrot', 'Tomato', 'Potato', 'Broccoli']
      },
      {
        'title': 'Dairy',
        'children': ['Milk', 'Cheese', 'Butter', 'Yogurt']
      },
    ];

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          child: ExpansionTile(
            title: Text(item['title']),
            children: (item['children'] as List<String>).map((child) {
              return ListTile(
                title: Text(child),
                leading: Icon(Icons.chevron_right),
                onTap: () {},
              );
            }).toList(),
          ),
        );
      },
    );
  }

  // Grouped List
  Widget _buildGroupedList() {
    final groupedData = {
      'Fruits': ['Apple', 'Banana', 'Orange'],
      'Vegetables': ['Carrot', 'Broccoli', 'Spinach'],
      'Animals': ['Cat', 'Dog', 'Elephant'],
    };

    return ListView(
      children: groupedData.entries.map((entry) {
        final groupTitle = entry.key;
        final groupItems = entry.value;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                groupTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...groupItems.map((item) => Card(
                  child: ListTile(
                    title: Text(item),
                  ),
                )),
          ],
        );
      }).toList(),
    );
  }

  // Interactive List with More Creative and Functional Interactions
  Widget _buildInteractableList() {
    return ListView.builder(
      itemCount: allItems.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(allItems[index]),
            onTap: () {
              _showItemDialog(context, allItems[index]);
            },
            onLongPress: () {
              _highlightItem(index);
            },
          ),
        );
      },
    );
  }

  // Show a dialog with item details
  void _showItemDialog(BuildContext context, String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Item Details'),
          content: Text('You tapped on: $item'),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // Highlight item on long press (for example, change color temporarily)
  void _highlightItem(int index) {
    final snackBar =
        SnackBar(content: Text('Long pressed: ${allItems[index]}'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Filterable List
  Widget _buildFilterableList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (query) {
              setState(() {
                if (query.isEmpty) {
                  filteredItems = allItems;
                } else {
                  filteredItems = allItems
                      .where((item) =>
                          item.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                }
              });
            },
            decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(filteredItems[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  // Virtualized List
  Widget _buildVirtualisedList() {
    return ListView.builder(
      itemCount: 1000, // Number of items in the list
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text('Item ${index + 1}'),
          ),
        );
      },
    );
  }

  // Drag and Drop List
  Widget _buildDragAndDropList() {
    return ReorderableListView(
      onReorder: _onReorder,
      children: [
        for (int index = 0; index < allItems.length; index++)
          ListTile(
            key: ValueKey(index),
            title: Text(allItems[index]),
          ),
      ],
    );
  }

  // Infinite Scroll List
  Widget _buildInfiniteScrollList() {
    return ListView.builder(
      itemCount: 1000,
      itemBuilder: (context, index) {
        if (index == 999) {
          // Simulate infinite scroll by adding more items at the end
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("Loading more...")),
          );
        }
        return Card(
          child: ListTile(
            title: Text('Item ${index + 1}'),
          ),
        );
      },
    );
  }
}
