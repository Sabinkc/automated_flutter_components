import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ListDetailScreen extends StatelessWidget {
  final String title;
  final IconData icon;

  const ListDetailScreen({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    Widget listWidget;

    // Render the appropriate chart based on the title
    switch (title) {
      case 'Basic List':
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
      case 'Interactable list':
        listWidget = _buildInteractableList();
        break;
      default:
        listWidget = const Text('List not available.');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.white)),
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
    return const Text("Basic List Placeholder");
  }

  // Expandable List
  Widget _buildExpandableList() {
    return const Text("Expandable List Placeholder");
  }

  // Grouped List
  Widget _buildGroupedList() {
    return const Text("Grouped List Placeholder");
  }

  // Filterable List
  Widget _buildFilterableList() {
    return const Text("Filterable List Placeholder");
  }

  // Virtualised List
  Widget _buildVirtualisedList() {
    return const Text("Virtualised List Placeholder");
  }

  // Drag and Drop List
  Widget _buildDragAndDropList() {
    return const Text("Drag and Drop List Placeholder");
  }

  // Infinite Scroll List
  Widget _buildInfiniteScrollList() {
    return const Text("Infinite Scroll List Placeholder");
  }

  // Selectable List
  Widget _buildSelectableList() {
    return const Text("Selectable List Placeholder");
  }

  // Reorderable List
  Widget _buildReorderableList() {
    return const Text("Reorderable List Placeholder");
  }

  // Swipable List
  Widget _buildSwipableList() {
    return const Text("Swipable List Placeholder");
  }

  // Interactable List
  Widget _buildInteractableList() {
    return const Text("Interactable List Placeholder");
  }
}
