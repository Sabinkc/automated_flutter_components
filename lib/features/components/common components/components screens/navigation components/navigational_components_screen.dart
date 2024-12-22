import 'package:components_automation/features/components/common%20components/components%20screens/navigation%20components/navigtional_components_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

class NavigationalComponentsScreen extends StatefulWidget {
  const NavigationalComponentsScreen({super.key});

  @override
  _NavigationalComponentsScreenState createState() =>
      _NavigationalComponentsScreenState();
}

class _NavigationalComponentsScreenState
    extends State<NavigationalComponentsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    final ScrollController _scrollController = ScrollController();

    @override
    void dispose() {
      _scrollController
          .dispose(); // Clean up the controller when the widget is disposed.
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigational Components",
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CommonColor.primaryColorDark,
              CommonColor.primaryColorLight
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RawScrollbar(
            controller: _scrollController,
            thumbColor: CommonColor.secondaryColor,
            thumbVisibility: true,
            thickness: 4,
            radius: const Radius.circular(8),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: width > 1000 ? 5 : (width > 600 ? 3 : 2),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1,
                children: [
                  _buildNavigationCard(
                      'Top Tab',
                      Icons.tab,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Navigate using top tabs to switch between different sections.'),
                  _buildNavigationCard(
                      'Bottom Tab',
                      Icons.table_chart,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Navigate using bottom tabs for quick access to main sections.'),
                  _buildNavigationCard(
                      'Navigation Drawer',
                      Icons.menu,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Side drawer that slides out to provide navigation options.'),
                  _buildNavigationCard(
                      'Side Panel',
                      Icons.view_sidebar,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Fixed or collapsible side panel for additional navigation.'),
                  _buildNavigationCard(
                      'Breadcrumbs',
                      Icons.barcode_reader,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Trail navigation showing the path to your current location.'),
                  _buildNavigationCard(
                      'Pagination Control',
                      Icons.format_list_numbered,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Control navigation through data using page numbers or arrows.'),
                  _buildNavigationCard(
                      'Dropdown Menu',
                      Icons.arrow_drop_down,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Expands to reveal navigation options in a dropdown list.'),
                  _buildNavigationCard(
                      'Context Menu',
                      Icons.more_vert,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Opens a menu with context-specific options for navigation.'),
                  _buildNavigationCard(
                      'Hamburger Menu',
                      Icons.menu_open,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Collapsible menu icon that expands to show navigation items.'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationCard(String title, IconData icon, double cardPadding,
      double titleFontSize, BuildContext context, String tooltipMessage) {
    return Tooltip(
      message: tooltipMessage,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: () {
            switch (title) {
              case 'Top Tab':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TopTabScreen(),
                  ),
                );
                break;
              case 'Bottom Tab':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BottomTabScreen(),
                  ),
                );
                break;
              case 'Navigation Drawer':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NavigationDrawerScreen(),
                  ),
                );
                break;
              case 'Side Panel':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SidePanelScreen(),
                  ),
                );
                break;
              case 'Breadcrumbs':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BreadcrumbScreen(),
                  ),
                );
                break;
              case 'Pagination Control':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaginationControlScreen(),
                  ),
                );
                break;
              case 'Dropdown Menu':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DropdownMenuScreen(),
                  ),
                );
                break;
              case 'Context Menu':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ContextMenuScreen(),
                  ),
                );
                break;
              case 'Hamburger Menu':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HamburgerMenuScreen(),
                  ),
                );
                break;
            }
          },
          child: Padding(
            padding: EdgeInsets.all(cardPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 50, color: Colors.blueAccent),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tap to view',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
