import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class TopTabScreen extends StatelessWidget {
  const TopTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Tab Bar Example",
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: CommonColor.primaryColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.search), text: "Search"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text(
                "Home Tab Content",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                "Search Tab Content",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Center(
              child: Text(
                "Settings Tab Content",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomTabScreen extends StatefulWidget {
  const BottomTabScreen({super.key});

  @override
  State<BottomTabScreen> createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
  int _currentIndex = 0; // To keep track of the selected tab

  // Content for each tab
  final List<Widget> _tabs = [
    const Center(
      child: Text(
        "Home Tab Content",
        style: TextStyle(fontSize: 20),
      ),
    ),
    const Center(
      child: Text(
        "Search Tab Content",
        style: TextStyle(fontSize: 20),
      ),
    ),
    const Center(
      child: Text(
        "Settings Tab Content",
        style: TextStyle(fontSize: 20),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bottom Tab Example",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: _tabs[_currentIndex], // Display the content of the selected tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected tab
          });
        },
        selectedItemColor: CommonColor.primaryColor, // Active tab color
        unselectedItemColor: Colors.grey, // Inactive tab color
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({super.key});

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  String _selectedContent =
      "Swipe from the left or press the menu icon to open the drawer.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Navigation Drawer Example",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer(); // Opens the drawer
                },
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: CommonColor.primaryColor,
              ),
              child: const Center(
                child: Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  _selectedContent = "Navigated to Home Screen";
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text("Search"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  _selectedContent = "Navigated to Search Screen";
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  _selectedContent = "Navigated to Settings Screen";
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                setState(() {
                  _selectedContent = "Logged Out!";
                });
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          _selectedContent,
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class SidePanelScreen extends StatefulWidget {
  const SidePanelScreen({super.key});

  @override
  _SidePanelScreenState createState() => _SidePanelScreenState();
}

class _SidePanelScreenState extends State<SidePanelScreen> {
  String _selectedContent = "Select an option from the side panel";

  @override
  Widget build(BuildContext context) {
    double sidePanelWidth =
        MediaQuery.of(context).size.width * 0.25; // 25% of screen width

    // Calculate font size based on screen width (smaller screen, smaller font size)
    double fontSize = MediaQuery.of(context).size.width < 600
        ? 8
        : 16; // Adjust font size threshold here

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Side Panel Navigation",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Row(
        children: [
          // Side panel with responsive width
          Container(
            width: sidePanelWidth,
            color: Colors.blue.shade100,
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.blue),
                  title: Text(
                    "Home",
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedContent = "Navigated to Home Screen";
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.search, color: Colors.blue),
                  title: Text(
                    "Search",
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedContent = "Navigated to Search Screen";
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.blue),
                  title: Text(
                    "Settings",
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedContent = "Navigated to Settings Screen";
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info, color: Colors.blue),
                  title: Text(
                    "About",
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedContent = "Navigated to About Screen";
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.blue),
                  title: Text(
                    "Logout",
                    style: TextStyle(fontSize: fontSize),
                  ),
                  onTap: () {
                    setState(() {
                      _selectedContent = "Logged Out!";
                    });
                  },
                ),
              ],
            ),
          ),
          // Main content area
          Expanded(
            child: Center(
              child: Text(
                _selectedContent,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BreadcrumbScreen extends StatefulWidget {
  const BreadcrumbScreen({super.key});

  @override
  _BreadcrumbScreenState createState() => _BreadcrumbScreenState();
}

class _BreadcrumbScreenState extends State<BreadcrumbScreen> {
  // Maximum number of breadcrumbs allowed
  static const int _maxBreadcrumbs = 5;

  List<String> _breadcrumbList = ['Home'];
  final Set<String> _visitedSections = {'Home'}; // Track visited sections

  void _addBreadcrumb(String newBreadcrumb) {
    setState(() {
      // Only add the breadcrumb if it's not already in the path
      if (!_visitedSections.contains(newBreadcrumb)) {
        // Add new breadcrumb only if the list size is less than max allowed
        if (_breadcrumbList.length < _maxBreadcrumbs) {
          _breadcrumbList.add(newBreadcrumb);
          _visitedSections.add(newBreadcrumb); // Mark as visited
        } else {
          // Remove the oldest breadcrumb (index 0) and add the new one
          _breadcrumbList.removeAt(0);
          _breadcrumbList.add(newBreadcrumb);
          _visitedSections.add(newBreadcrumb); // Mark as visited
        }
      }
    });
  }

  void _navigateToBreadcrumb(int index) {
    setState(() {
      _breadcrumbList = _breadcrumbList.sublist(
          0, index + 1); // Keep only the breadcrumb path up to clicked point
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust text size and button size based on screen width
    double textSize = screenWidth < 600 ? 12 : 16;
    double buttonFontSize = screenWidth < 600 ? 14 : 16;
    double buttonHeight = screenWidth < 600 ? 40 : 50;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Breadcrumb Navigation",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Breadcrumb navigation
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < _breadcrumbList.length; i++)
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => _navigateToBreadcrumb(i),
                        child: Text(
                          _breadcrumbList[i],
                          style: TextStyle(
                              fontSize: textSize, fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (i != _breadcrumbList.length - 1)
                        const Text(' > ', style: TextStyle(fontSize: 16)),
                    ],
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // Main content area
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth > 600 ? 200 : 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Current Breadcrumb Path: ${_breadcrumbList.join(' > ')}',
                    style: TextStyle(fontSize: textSize),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _addBreadcrumb('Category');
                    },
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(
                        Size(double.infinity, buttonHeight),
                      ),
                    ),
                    child: Text(
                      'Go to Category',
                      style: TextStyle(fontSize: buttonFontSize),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _addBreadcrumb('Product');
                    },
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(
                        Size(double.infinity, buttonHeight),
                      ),
                    ),
                    child: Text(
                      'Go to Product',
                      style: TextStyle(fontSize: buttonFontSize),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      _addBreadcrumb('Checkout');
                    },
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(
                        Size(double.infinity, buttonHeight),
                      ),
                    ),
                    child: Text(
                      'Go to Checkout',
                      style: TextStyle(fontSize: buttonFontSize),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaginationControlScreen extends StatefulWidget {
  const PaginationControlScreen({super.key});

  @override
  _PaginationControlScreenState createState() =>
      _PaginationControlScreenState();
}

class _PaginationControlScreenState extends State<PaginationControlScreen> {
  int _currentPage = 1;
  final int _itemsPerPage = 10;
  final int _totalItems = 100; // Simulated total items

  List<String> _getItemsForCurrentPage() {
    List<String> items = [];
    int start = (_currentPage - 1) * _itemsPerPage;
    int end = start + _itemsPerPage;
    for (int i = start; i < end && i < _totalItems; i++) {
      items.add('Item ${i + 1}');
    }
    return items;
  }

  void _nextPage() {
    setState(() {
      if (_currentPage < (_totalItems / _itemsPerPage).ceil()) {
        _currentPage++;
      }
    });
  }

  void _previousPage() {
    setState(() {
      if (_currentPage > 1) {
        _currentPage--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust text size and button size based on screen width
    double textSize = screenWidth < 600 ? 14 : 16;
    double buttonFontSize = screenWidth < 600 ? 14 : 16;
    double buttonHeight = screenWidth < 600 ? 40 : 50;

    List<String> itemsToDisplay = _getItemsForCurrentPage();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pagination Control",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Display the current items for the current page
          Expanded(
            child: ListView.builder(
              itemCount: itemsToDisplay.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      itemsToDisplay[index],
                      style: TextStyle(fontSize: textSize),
                    ),
                  ),
                );
              },
            ),
          ),
          // Pagination controls
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _previousPage,
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(
                      Size(buttonHeight, buttonHeight),
                    ),
                  ),
                  child: Text(
                    'Previous',
                    style: TextStyle(fontSize: buttonFontSize),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  'Page $_currentPage',
                  style: TextStyle(
                      fontSize: textSize, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(
                      Size(buttonHeight, buttonHeight),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: buttonFontSize),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DropdownMenuScreen extends StatefulWidget {
  const DropdownMenuScreen({super.key});

  @override
  _DropdownScreenState createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownMenuScreen> {
  String _message = 'Press menu icon to navigate'; // Initial message
  final List<String> _options = ['Home', 'Category', 'Product', 'Checkout'];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust text size based on screen width
    double textSize = screenWidth < 600 ? 14 : 16;
    double buttonFontSize = screenWidth < 600 ? 14 : 16;
    double buttonHeight = screenWidth < 600 ? 40 : 50;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dropdown Navigation",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _showDropdownMenu(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Screen message
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _message, // Display the message
                      style: TextStyle(
                        fontSize: textSize * 1.5, // Increase size for title
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Press menu icon to navigate',
                      style: TextStyle(fontSize: textSize),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to show dropdown menu
  void _showDropdownMenu(BuildContext context) async {
    String? selectedOption = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width - 100, // Right side of the screen
        kToolbarHeight, // Below the AppBar
        0,
        0,
      ),
      items: _options.map<PopupMenuEntry<String>>((String option) {
        return PopupMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );

    if (selectedOption != null) {
      setState(() {
        _message = 'Navigated to $selectedOption screen'; // Update the message
      });
    }
  }
}

class ContextMenuScreen extends StatefulWidget {
  const ContextMenuScreen({super.key});

  @override
  _ContextMenuScreenState createState() => _ContextMenuScreenState();
}

class _ContextMenuScreenState extends State<ContextMenuScreen> {
  String _message =
      'Double tap anywhere to open context menu'; // Initial message
  final List<String> _options = ['Home', 'Category', 'Product', 'Checkout'];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust text size based on screen width
    double textSize = screenWidth < 600 ? 14 : 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Context Menu Navigation",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: CommonColor
            .primaryColor, // Replace CommonColor.primaryColor with blue
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert,
                color: Colors.white), // Three dots icon
            onPressed: () {
              _showContextMenu(context); // Show the context menu when pressed
            },
          ),
        ],
      ),
      body: Center(
        child: MouseRegion(
          onEnter: (_) => setState(() {
            _message = 'Double tap anywhere to open context menu';
          }),
          child: InkWell(
            onDoubleTap: () {
              _showContextMenu(context); // Show context menu on double tap
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Screen message
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _message, // Display the message
                            style: TextStyle(
                              fontSize:
                                  textSize * 1.5, // Increase size for title
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Method to show context menu
  void _showContextMenu(BuildContext context) async {
    String? selectedOption = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(
        MediaQuery.of(context).size.width -
            150, // Right side of the screen (top-right)
        50, // Close to the top of the screen
        0,
        0,
      ),
      items: _options.map<PopupMenuEntry<String>>((String option) {
        return PopupMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
    );

    if (selectedOption != null) {
      setState(() {
        // Update the message to show the selected option
        _message =
            'Navigated to $selectedOption screen'; // Update the message at the center
      });

      // Show a SnackBar to indicate navigation
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Navigated to $selectedOption screen'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}

class HamburgerMenuScreen extends StatefulWidget {
  const HamburgerMenuScreen({super.key});

  @override
  _HamburgerMenuScreenState createState() => _HamburgerMenuScreenState();
}

class _HamburgerMenuScreenState extends State<HamburgerMenuScreen> {
  String _message = 'Welcome! Open the menu to navigate.';
  final List<String> _menuOptions = ['Home', 'Profile', 'Settings', 'Logout'];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Adjust text size based on screen width
    double textSize = screenWidth < 600 ? 14 : 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hamburger Menu Navigation",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onSelected: _onMenuOptionSelected,
            itemBuilder: (BuildContext context) {
              return _menuOptions.map((String option) {
                return PopupMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _message, // Display the current message
                style: TextStyle(
                  fontSize: textSize * 1.5,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onMenuOptionSelected(String option) {
    setState(() {
      // Update the message with the selected option
      _message = 'Navigated to $option screen';
    });
  }
}
