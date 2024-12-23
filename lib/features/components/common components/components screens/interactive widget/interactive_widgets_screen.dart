import 'package:components_automation/features/components/common%20components/components%20screens/interactive%20widget/interactive_widget_detail.dart';
import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

class InteractiveWidgetsScreen extends StatefulWidget {
  const InteractiveWidgetsScreen({super.key});

  @override
  _InteractiveWidgetsScreenState createState() =>
      _InteractiveWidgetsScreenState();
}

class _InteractiveWidgetsScreenState extends State<InteractiveWidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    final ScrollController _scrollController = ScrollController();

    @override
    void dispose() {
      _scrollController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Interactive Widgets",
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
                  buildInteractiveWidgetCard(
                      'Accordion',
                      Icons.tab,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Accordion component'),
                  buildInteractiveWidgetCard(
                      'Drag-and-drop widget',
                      Icons.table_chart,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Drag and drop items'),
                  buildInteractiveWidgetCard(
                      'Resizable widgets',
                      Icons.menu,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Resizable UI components'),
                  buildInteractiveWidgetCard(
                      'Resizable panels',
                      Icons.view_sidebar,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Panels that can be resized'),
                  buildInteractiveWidgetCard(
                      'Sortable panels',
                      Icons.format_list_numbered,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Panels with sorting capability'),
                  buildInteractiveWidgetCard(
                      'Toggle sections',
                      Icons.arrow_drop_down,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Sections that can be toggled'),
                  buildInteractiveWidgetCard(
                      'Flip Cards',
                      Icons.menu_open,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Cards that flip on interaction'),
                  buildInteractiveWidgetCard(
                      'Swipeable list',
                      Icons.swipe,
                      cardPadding,
                      titleFontSize,
                      context,
                      'List items that can be swiped'),
                  buildInteractiveWidgetCard(
                      'Reorderable list',
                      Icons.sort,
                      cardPadding,
                      titleFontSize,
                      context,
                      'List items that can be reordered'),
                  buildInteractiveWidgetCard(
                      'Date picker',
                      Icons.date_range,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Interactive date selection'),
                  buildInteractiveWidgetCard(
                      'Time picker',
                      Icons.access_time,
                      cardPadding,
                      titleFontSize,
                      context,
                      'Interactive time selection'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInteractiveWidgetCard(
      String title,
      IconData icon,
      double cardPadding,
      double titleFontSize,
      BuildContext context,
      String tooltipMessage) {
    return Tooltip(
      message: tooltipMessage,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: () {
            // Update navigation based on the widget type
            switch (title) {
              case 'Accordion':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AccordionScreen(),
                  ),
                );
                break;
              case 'Drag-and-drop widget':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DragAndDropScreen(),
                  ),
                );
                break;
              case 'Resizable widgets':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResizableWidgetScreen(),
                  ),
                );
                break;
              case 'Resizable panels':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResizablePanelScreen(),
                  ),
                );
                break;
              case 'Sortable panels':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SortablePanelScreen(),
                  ),
                );
                break;
              case 'Toggle sections':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ToggleSectionScreen(),
                  ),
                );
                break;

              case 'Flip Cards':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FlipCardsScreen(),
                  ),
                );
                break;
              case 'Swipeable list':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SwipableListScreen(),
                  ),
                );
                break;
              case 'Reorderable list':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReorderableListScreen(),
                  ),
                );
                break;

              case 'Date picker':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DatePickerScreen(),
                  ),
                );
                break;
              case 'Time picker':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TimePickerScreen(),
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
