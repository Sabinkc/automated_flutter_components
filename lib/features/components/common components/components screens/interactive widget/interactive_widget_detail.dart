import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import 'package:intl/intl.dart';

class AccordionScreen extends StatelessWidget {
  const AccordionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Adjust font size based on screen width
    double titleFontSize = width > 800 ? 18 : 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Accordion Example",
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            _buildAccordionTile(
              title: 'Item 1',
              content:
                  'This is the content of item 1. It can be expanded or collapsed.',
              titleFontSize: titleFontSize,
            ),
            _buildAccordionTile(
              title: 'Item 2',
              content:
                  'This is the content of item 2. It can be expanded or collapsed.',
              titleFontSize: titleFontSize,
            ),
            _buildAccordionTile(
              title: 'Item 3',
              content:
                  'This is the content of item 3. It can be expanded or collapsed.',
              titleFontSize: titleFontSize,
            ),
            _buildAccordionTile(
              title: 'Item 4',
              content:
                  'This is the content of item 4. It can be expanded or collapsed.',
              titleFontSize: titleFontSize,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccordionTile(
      {required String title,
      required String content,
      required double titleFontSize}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style:
              TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              content,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

class DragAndDropScreen extends StatelessWidget {
  const DragAndDropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // Adjust font size based on screen width
    double titleFontSize = width > 800 ? 18 : 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Drag and Drop Example",
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Create a drag target to drop items onto
              _buildDragTarget(context, titleFontSize),
              const SizedBox(height: 20),
              // Create draggable items
              _buildDraggableItem(context, titleFontSize, 'Item 1'),
              _buildDraggableItem(context, titleFontSize, 'Item 2'),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for the draggable item
  Widget _buildDraggableItem(
      BuildContext context, double titleFontSize, String itemName) {
    return Draggable<String>(
      data: itemName,
      feedback: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blue,
          child: Text(
            itemName,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
      childWhenDragging: const SizedBox.shrink(),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Icon(Icons.drag_handle, size: 30),
              Text(
                itemName,
                style: TextStyle(fontSize: titleFontSize),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget for the drag target area
  Widget _buildDragTarget(BuildContext context, double titleFontSize) {
    String acceptedItem = ''; // Variable to track the last accepted item

    return StatefulBuilder(
      builder: (context, setState) {
        return DragTarget<String>(
          onAccept: (itemName) {
            setState(() {
              acceptedItem =
                  itemName == 'Item 1' ? 'Accepted: $itemName' : 'Not Accepted';
            });
          },
          builder: (context, candidateData, rejectedData) {
            return Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                color: candidateData.isEmpty
                    ? Colors.grey[300]
                    : (candidateData.first == 'Item 2'
                        ? Colors.red[200]
                        : Colors.green[200]),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  candidateData.isEmpty
                      ? (acceptedItem.isEmpty ? 'Drop here' : acceptedItem)
                      : (candidateData.first == 'Item 2'
                          ? 'Item not accepted'
                          : 'Item Accepted!'),
                  style: TextStyle(
                      fontSize: titleFontSize, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class ResizableWidgetScreen extends StatefulWidget {
  const ResizableWidgetScreen({super.key});

  @override
  _ResizableWidgetScreenState createState() => _ResizableWidgetScreenState();
}

class _ResizableWidgetScreenState extends State<ResizableWidgetScreen> {
  double width = 200.0;
  double height = 200.0;
  double initialWidth = 200.0;
  double initialHeight = 200.0;
  double startX = 0;
  double startY = 0;

  // Minimum and Maximum limits for width and height
  double minWidth = 100.0;
  double minHeight = 100.0;
  double maxWidth = 400.0;
  double maxHeight = 400.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Resizable Widget Demo",
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Center(
        child: MouseRegion(
          onEnter: (_) {
            // Mouse enter handler for Web (pointer cursor)
          },
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                // Update width and height based on the drag distance
                double newWidth =
                    initialWidth + (details.localPosition.dx - startX);
                double newHeight =
                    initialHeight + (details.localPosition.dy - startY);

                // Apply the min and max constraints
                width = newWidth.clamp(minWidth, maxWidth);
                height = newHeight.clamp(minHeight, maxHeight);
              });
            },
            onPanStart: (details) {
              // Record the initial position of the widget when resizing starts
              startX = details.localPosition.dx;
              startY = details.localPosition.dy;
              initialWidth = width;
              initialHeight = height;
            },
            child: Stack(
              children: [
                // Resizable Box
                Positioned(
                  left: 100.0,
                  top: 100.0,
                  child: Container(
                    width: width,
                    height: height,
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text(
                        "Resizable Box",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                // Resizing handle
                Positioned(
                  left: 100.0 + width - 20,
                  top: 100.0 + height - 20,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        // Resize the widget by dragging the bottom-right corner
                        double newWidth =
                            initialWidth + (details.localPosition.dx - startX);
                        double newHeight =
                            initialHeight + (details.localPosition.dy - startY);

                        // Apply the min and max constraints
                        width = newWidth.clamp(minWidth, maxWidth);
                        height = newHeight.clamp(minHeight, maxHeight);
                      });
                    },
                    onPanStart: (details) {
                      startX = details.localPosition.dx;
                      startY = details.localPosition.dy;
                      initialWidth = width;
                      initialHeight = height;
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      color: Colors.black,
                      child: const Icon(Icons.drag_handle, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResizablePanelScreen extends StatefulWidget {
  const ResizablePanelScreen({super.key});

  @override
  _ResizablePanelScreenState createState() => _ResizablePanelScreenState();
}

class _ResizablePanelScreenState extends State<ResizablePanelScreen> {
  double leftPanelWidth = 250.0; // Initial width of the left panel
  double startX = 0; // Initial touch position
  double initialWidth = 250.0; // Initial panel width

  // Minimum and Maximum width limits for the left panel
  double minLeftPanelWidth = 150.0;
  double maxLeftPanelWidth = 500.0;

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate the maximum width for the left panel dynamically
    double maxWidthForLeftPanel = screenWidth -
        100.0; // Leave some space for the resizable divider (10px) and the right panel

    // Dynamically adjust the left panel width
    leftPanelWidth =
        leftPanelWidth.clamp(minLeftPanelWidth, maxWidthForLeftPanel);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Resizable Panel Demo",
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Row(
        children: [
          // Left panel: Resizable based on the gesture
          Container(
            width: leftPanelWidth,
            color: Colors.blueAccent,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Left Panel",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          // Resizable divider
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                // Update the left panel width based on drag distance
                double newWidth =
                    initialWidth + (details.localPosition.dx - startX);

                // Apply the min and max constraints
                leftPanelWidth =
                    newWidth.clamp(minLeftPanelWidth, maxWidthForLeftPanel);
              });
            },
            onPanStart: (details) {
              // Record the initial position of the divider when resizing starts
              startX = details.localPosition.dx;
              initialWidth = leftPanelWidth;
            },
            child: Container(
              width: 10, // Divider width
              color: Colors.black,
              height: double.infinity,
            ),
          ),
          // Right panel: Takes up the remaining space
          Expanded(
            child: Container(
              color: Colors.grey[200],
              padding: const EdgeInsets.all(16.0),
              child: const Center(
                child: Text(
                  "Right Panel",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SortablePanelScreen extends StatefulWidget {
  const SortablePanelScreen({super.key});

  @override
  _SortablePanelScreenState createState() => _SortablePanelScreenState();
}

class _SortablePanelScreenState extends State<SortablePanelScreen> {
  // List of panels with some example data
  List<String> panels = ['Panel 1', 'Panel 2', 'Panel 3', 'Panel 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sortable Panel Demo",
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: panels.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: DragTarget<int>(
                onAccept: (fromIndex) {
                  setState(() {
                    // Move the panel from one index to another
                    String movedPanel = panels.removeAt(fromIndex);
                    panels.insert(index, movedPanel);
                  });
                },
                builder: (context, candidateData, rejectedData) {
                  return Draggable<int>(
                    data: index, // Pass the index of the panel being dragged
                    childWhenDragging: Container(
                      width: 300,
                      height: 100,
                      color: Colors.transparent,
                    ),
                    feedback: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: 300,
                        height: 100,
                        color: Colors.blueAccent.withOpacity(0.7),
                        child: Center(
                          child: Text(
                            panels[index],
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    child: Container(
                      width: 300,
                      height: 100,
                      color: Colors.blueAccent,
                      child: Center(
                        child: Text(
                          panels[index],
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ToggleSectionScreen extends StatefulWidget {
  const ToggleSectionScreen({super.key});

  @override
  _ToggleSectionScreenState createState() => _ToggleSectionScreenState();
}

class _ToggleSectionScreenState extends State<ToggleSectionScreen> {
  // Track the switch state for each section
  bool isSection1Active = false;
  bool isSection2Active = false;
  bool isSection3Active = false;

  // Define the color change
  Color section1Color = Colors.blueAccent;
  Color section2Color = Colors.greenAccent;
  Color section3Color = Colors.pinkAccent;

  // Method to change color when switch is toggled
  void toggleSection1(bool value) {
    setState(() {
      isSection1Active = value;
      section1Color =
          isSection1Active ? Colors.blue : Colors.grey; // Toggle color
    });
  }

  void toggleSection2(bool value) {
    setState(() {
      isSection2Active = value;
      section2Color =
          isSection2Active ? Colors.green : Colors.grey; // Toggle color
    });
  }

  void toggleSection3(bool value) {
    setState(() {
      isSection3Active = value;
      section3Color =
          isSection3Active ? Colors.pink : Colors.grey; // Toggle color
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Toogle Section Demo",
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // Section 1: Switch to toggle color
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: section1Color, // Dynamic background color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Section 1: Toggle color',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Switch(
                    value: isSection1Active,
                    onChanged: toggleSection1,
                    activeColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Section 2: Switch to toggle color
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: section2Color, // Dynamic background color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Section 2: Toggle color',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Switch(
                    value: isSection2Active,
                    onChanged: toggleSection2,
                    activeColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Section 3: Switch to toggle color
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: section3Color, // Dynamic background color
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Section 3: Toggle color',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Switch(
                    value: isSection3Active,
                    onChanged: toggleSection3,
                    activeColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FlipCardsScreen extends StatefulWidget {
  const FlipCardsScreen({super.key});

  @override
  _FlipCardsScreenState createState() => _FlipCardsScreenState();
}

class _FlipCardsScreenState extends State<FlipCardsScreen>
    with SingleTickerProviderStateMixin {
  bool isFlipped = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(milliseconds: 600), // Duration for the flip animation
    );

    _animation = Tween<double>(begin: 0.0, end: pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  // Function to toggle the card flip
  void toggleCardFlip() {
    setState(() {
      isFlipped = !isFlipped;
    });

    if (isFlipped) {
      _controller.forward(); // Start the flip animation
    } else {
      _controller.reverse(); // Reverse the flip animation
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flip Card Demo",
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: toggleCardFlip, // Trigger the flip animation on tap
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform(
                transform: Matrix4.rotationY(_animation.value),
                alignment: Alignment.center,
                child: child,
              );
            },
            child: _buildCard(),
          ),
        ),
      ),
    );
  }

  // Widget for the card, which will be flipped
  Widget _buildCard() {
    return Container(
      width: 200,
      height: 300,
      decoration: BoxDecoration(
        color: isFlipped ? Colors.orangeAccent : Colors.blueAccent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          isFlipped ? "Back of Card" : "Front of Card",
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class SwipableListScreen extends StatefulWidget {
  const SwipableListScreen({super.key});

  @override
  _SwipableListScreenState createState() => _SwipableListScreenState();
}

class _SwipableListScreenState extends State<SwipableListScreen> {
  List<String> items = List.generate(10, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Swipable List Demo",
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(items[index]),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.redAccent,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    duration: Duration(milliseconds: 200),
                    content: Text("Deleted ${items[index]}")),
              );
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListTile(
                title: Text(items[index]),
                tileColor: Colors.blue[50],
                leading: const Icon(Icons.label, color: Colors.blueAccent),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ReorderableListScreen extends StatefulWidget {
  const ReorderableListScreen({super.key});

  @override
  _ReorderableListScreenState createState() => _ReorderableListScreenState();
}

class _ReorderableListScreenState extends State<ReorderableListScreen> {
  List<String> items = List.generate(10, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reorderable List Demo",
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: ReorderableListView(
        padding:
            const EdgeInsets.all(8.0), // Add padding around the entire list
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) newIndex--;
            final item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
        children: items.map((item) {
          return Padding(
            key: ValueKey(item),
            padding: const EdgeInsets.symmetric(
                vertical: 4.0), // Add padding between items
            child: ListTile(
              title: Text(item),
              tileColor: Colors.blue[50],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class DatePickerScreen extends StatefulWidget {
  const DatePickerScreen({super.key});

  @override
  _DatePickerScreenState createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date Picker Demo",
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedDate == null
                  ? "No date selected"
                  : "Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text("Pick a Date"),
            ),
          ],
        ),
      ),
    );
  }
}

class TimePickerScreen extends StatefulWidget {
  const TimePickerScreen({super.key});

  @override
  _TimePickerScreenState createState() => _TimePickerScreenState();
}

class _TimePickerScreenState extends State<TimePickerScreen> {
  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Picker Demo",
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              selectedTime == null
                  ? "No time selected"
                  : "Selected Time: ${selectedTime!.format(context)}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text("Pick a Time"),
            ),
          ],
        ),
      ),
    );
  }
}
