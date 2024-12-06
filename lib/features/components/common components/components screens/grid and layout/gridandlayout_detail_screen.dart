import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridAndLayoutDetailScreen extends StatelessWidget {
  final String title;
  final IconData icon;

  const GridAndLayoutDetailScreen(
      {super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: _getDetailLayout(),
    );
  }

  Widget _getDetailLayout() {
    switch (title) {
      case 'Grid Layout':
        return _buildGridLayout();
      case 'Masonry Layout(Staggered)':
        return _buildMasonryLayout();
      case 'Responsive Layout':
        return _buildResponsiveLayout();
      case 'Scrollable Layout':
        return _buildScrollableLayout();
      case 'Absolute Positioning':
        return _buildAbsolutePositioning();
      case 'Sticky Headers':
        return _buildStickyHeaders();
      default:
        return Center(child: Text('Unknown Layout'));
    }
  }

  Widget _buildGridLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        children: List.generate(6, (index) {
          return Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Text(
                'Grid ${index + 1}', // Updated text to show 'Grid 1', 'Grid 2', etc.
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildMasonryLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Container(
                color: Colors.red,
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Container(
                color: Colors.red,
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Container(
                color: Colors.blue,
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 1,
              mainAxisCellCount: 1,
              child: Container(
                color: Colors.green,
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: Container(
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResponsiveLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Check the screen width to decide the layout
          if (constraints.maxWidth > 600) {
            // Large screens (width > 600px): Two-column grid layout
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // Two columns for larger screens
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text('Item $index',
                        style: TextStyle(color: Colors.white)),
                  ),
                );
              },
            );
          } else {
            // Small screens (width <= 600px): Single-column list
            return ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.greenAccent,
                  child: ListTile(
                    title: Center(child: Text('Item $index')),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildScrollableLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.symmetric(
                vertical: 8.0), // Adds spacing between items
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  'Item $index',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAbsolutePositioning() {
    return Stack(
      children: [
        Positioned(
          top: 100,
          left: 50,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Positioned Item', textAlign: TextAlign.center),
            ),
          ),
        ),
        Positioned(
          top: 250,
          right: 50,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Another Item', textAlign: TextAlign.center),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStickyHeaders() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 100,
          automaticallyImplyLeading: false, // Removes the back button
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text('Sticky Header', style: TextStyle(color: Colors.white)),
            background: Container(color: Colors.blueAccent),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Item $index', textAlign: TextAlign.center),
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
