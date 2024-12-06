import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridAndLayoutDetailScreen extends StatefulWidget {
  final String title;
  final IconData icon;

  GridAndLayoutDetailScreen(
      {super.key, required this.title, required this.icon});

  @override
  State<GridAndLayoutDetailScreen> createState() =>
      _GridAndLayoutDetailScreenState();
}

class _GridAndLayoutDetailScreenState extends State<GridAndLayoutDetailScreen> {
  int _selectedIndex = 0;

  // List of widgets for each tab's content
  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Home Screen')),
    Center(child: Text('Search Screen')),
    Center(child: Text('Settings Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
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
    switch (widget.title) {
      case 'Grid Layout':
        return _buildGridLayout();
      case 'Masonry Layout(Staggered)':
        return _buildMasonryLayout();
      case 'Responsive Layout':
        return _buildResponsiveLayout();
      case 'Scrollable Layout':
        return _buildScrollableLayout();
      case 'Absolute Positioning':
        return _buildAbsolutePositioningLayout();
      case 'Sticky Headers':
        return _buildStickyHeaders();
      case 'Masonry Layout(Staggered)':
        return _buildMasonryLayout();
      case 'Vertical ListView':
        return _buildVerticalListView();
      case 'Horizontal ListView':
        return _buildHorizontalListView();
      case 'PageView Layout':
        return _buildPageViewLayout();
      case 'Bottom Navigation Bar':
        return _buildBottomNavigationBarLayout();
      case 'Tab Bar Layout':
        return _buildTabBarLayout();
      default:
        return Center(child: Text('Unknown Layout'));
    }
  }

  Widget _buildGridLayout() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 2,
        children: List.generate(10, (index) {
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

  Widget _buildAbsolutePositioningLayout() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          // Background element
          Container(
            color: Colors.blue[100],
            width: double.infinity,
            height: 300,
            child: Center(
                child: Text('Background',
                    style: TextStyle(color: Colors.white, fontSize: 20))),
          ),
          // Positioned element 1
          Positioned(
            top: 50,
            left: 100,
            child: Container(
              color: Colors.red,
              width: 90,
              height: 90,
              child: Center(
                child: Text(
                  'Top: 50\nLeft: 100',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          // Positioned element 2
          Positioned(
            bottom: 30,
            right: 20,
            child: Container(
              color: Colors.green,
              width: 60,
              height: 60,
              child: Center(
                child: Text(
                  'Bottom: 30\nRight: 20',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          // Positioned element 3
          Positioned(
            top: 120,
            left: 10,
            child: Container(
              color: Colors.orange,
              width: 100,
              height: 100,
              child: Center(
                child: Text(
                  'Top: 150\nLeft: 10',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
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

  Widget _buildVerticalListView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
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
      ),
    );
  }

  Widget _buildHorizontalListView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 50,
          itemBuilder: (context, index) {
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
        ),
      ),
    );
  }

  Widget _buildPageViewLayout() {
    List _colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Scaffold(
            backgroundColor: _colors[index],
            body: Center(
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Page $index', textAlign: TextAlign.center),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigationBarLayout() {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Keep track of the selected index
        selectedItemColor: Colors.blue, // Set the color for the selected item
        unselectedItemColor:
            Colors.grey, // Set the color for the unselected items
        selectedFontSize: 14.0, // Set font size for the selected item
        unselectedFontSize: 12.0, // Set font size for the unselected items
        iconSize: 30.0, // Set icon size for both selected and unselected items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Update the selected index
          });
        },
      ),
    );
  }

  Widget _buildTabBarLayout() {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('Content of Tab 1')),
            Center(child: Text('Content of Tab 2')),
            Center(child: Text('Content of Tab 3')),
          ],
        ),
      ),
    );
  }
}
