// import 'package:components_automation/core/constants.dart';
// import 'package:flutter/material.dart';

// class ListScreen extends StatelessWidget {
//   const ListScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Lists",
//           style: const TextStyle(color: Colors.white),
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

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListControlsScreenState createState() => _ListControlsScreenState();
}

class _ListControlsScreenState extends State<ListScreen> {
  final bool _isExpanded = false;
  final List<String> _allItems = List<String>.generate(20, (index) => 'Item $index');
  List<String> _filteredItems = [];
  final bool _isFiltering = false;
  final ScrollController _scrollController = ScrollController();
  final List<String> _dragItems = ['Drag 1', 'Drag 2', 'Drag 3', 'Drag 4', 'Drag 5'];

  @override
  void initState() {
    super.initState();
    _filteredItems = _allItems;
    _scrollController.addListener(_loadMoreItems);
  }

  void _loadMoreItems() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      setState(() {
        _allItems.addAll(List<String>.generate(
            20, (index) => 'Item ${_allItems.length + index}'));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("List Controls"),
      ),
      body: GridView.count(
        crossAxisCount: width > 800 ? 3 : 1,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        children: [
          _buildControlCard('Basic List', _buildBasicList()),
          _buildControlCard('Expandable List', _buildExpandableList()),
          _buildControlCard('Grouped List', _buildGroupedList()),
          _buildControlCard('Filterable List', _buildFilterableList()),
          _buildControlCard('Virtualized List', _buildVirtualizedList()),
          _buildControlCard('Drag and Drop List', _buildDragDropList()),
        ],
      ),
    );
  }

  Widget _buildBasicList() {
    return ListView.builder(
      key: const PageStorageKey('BasicList'),
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Basic Item $index'),
        );
      },
    );
  }

  Widget _buildExpandableList() {
    return ExpansionTile(
      key: const PageStorageKey('ExpandableList'),
      title: const Text('Expandable List'),
      children: List.generate(
        5,
        (index) => ListTile(title: Text('Expandable Item $index')),
      ),
    );
  }

  Widget _buildGroupedList() {
    return Column(
      key: const PageStorageKey('GroupedList'),
      children: [
        const Text('Group 1'),
        ...List.generate(
          5,
          (index) => ListTile(title: Text('Grouped Item 1-$index')),
        ),
      ],
    );
  }

  Widget _buildFilterableList() {
    return Column(
      key: const PageStorageKey('FilterableList'),
      children: [
        TextField(
          decoration: const InputDecoration(hintText: 'Filter items'),
          onChanged: (value) {
            setState(() {
              _filteredItems = _allItems
                  .where((item) =>
                      item.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            });
          },
        ),
        Expanded(
          child: ListView.builder(
            key: const PageStorageKey('FilteredList'),
            itemCount: _filteredItems.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(_filteredItems[index]));
            },
          ),
        ),
      ],
    );
  }

  Widget _buildVirtualizedList() {
    return ListView.builder(
      key: const PageStorageKey('VirtualizedList'),
      controller: _scrollController,
      itemCount: _allItems.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(_allItems[index]));
      },
    );
  }

  Widget _buildDragDropList() {
    return ReorderableListView(
      key: const PageStorageKey('DragDropList'),
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final item = _dragItems.removeAt(oldIndex);
          _dragItems.insert(newIndex, item);
        });
      },
      children: _dragItems
          .map((item) => ListTile(
                key: ValueKey(item),
                title: Text(item),
              ))
          .toList(),
    );
  }

  Widget _buildControlCard(String title, Widget control) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: control),
        ],
      ),
    );
  }
}
