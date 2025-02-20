import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:signature/signature.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';


class SortableKanbanBoardScreen extends StatefulWidget {
  const SortableKanbanBoardScreen({super.key});

  @override
  SortableKanbanBoardScreenState createState() =>
      SortableKanbanBoardScreenState();
}

class SortableKanbanBoardScreenState extends State<SortableKanbanBoardScreen> {
  List<String> todo = ['Task 1', 'Task 2', 'Task 3'];
  List<String> inProgress = ['Task 4'];
  List<String> done = ['Task 5'];

  Map<String, dynamic> _lastAction = {};

  void moveTask(String task, List<String> from, List<String> to) {
    setState(() {
      _lastAction = {
        'task': task,
        'from': from,
        'to': to,
      };
      from.remove(task);
      to.add(task);
    });
  }

  void undoLastAction() {
    if (_lastAction.isNotEmpty) {
      setState(() {
        String task = _lastAction['task'];
        List<String> from = _lastAction['to'];
        List<String> to = _lastAction['from'];
        from.remove(task);
        to.add(task);
        _lastAction = {};
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sortable kanban board",
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
      body: Row(
        children: [
          buildKanbanColumn(
            'To Do',
            todo,
            Colors.redAccent,
            inProgress,
            isSmallScreen,
          ),
          buildKanbanColumn(
            'In Progress',
            inProgress,
            Colors.orangeAccent,
            done,
            isSmallScreen,
          ),
          buildKanbanColumn(
            'Done',
            done,
            Colors.greenAccent,
            null,
            isSmallScreen,
          ),
        ],
      ),
    );
  }

  Widget buildKanbanColumn(
    String title,
    List<String> tasks,
    Color color,
    List<String>? nextColumnTasks,
    bool isSmallScreen,
  ) {
    return Expanded(
      child: DragTarget<String>(
        onWillAccept: (data) => true,
        onAccept: (task) {
          moveTask(task, _getList(task), tasks);
        },
        builder: (context, candidateData, rejectedData) {
          return Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isSmallScreen ? 13 : 16,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Draggable<String>(
                        data: task,
                        feedback: Material(
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                task,
                                style: TextStyle(
                                  fontSize: isSmallScreen ? 12 : 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        childWhenDragging: Container(),
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            title: Text(
                              task,
                              style: TextStyle(
                                fontSize: isSmallScreen ? 12 : 14,
                              ),
                            ),
                            trailing: nextColumnTasks != null
                                ? IconButton(
                                    icon: const Icon(Icons.arrow_forward),
                                    onPressed: () {
                                      moveTask(task, tasks, nextColumnTasks);
                                    },
                                  )
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<String> _getList(String task) {
    if (todo.contains(task)) return todo;
    if (inProgress.contains(task)) return inProgress;
    return done;
  }
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calendar",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          children: [
            // Calendar widget with enhanced style
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TableCalendar(
                firstDay: DateTime.utc(2000, 1, 1),
                lastDay: DateTime.utc(2100, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blueAccent,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  weekendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                  outsideDaysVisible: false,
                ),
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: isSmallScreen ? 18 : 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                  leftChevronIcon: const Icon(Icons.chevron_left,
                      size: 30, color: Colors.blueAccent),
                  rightChevronIcon: const Icon(Icons.chevron_right,
                      size: 30, color: Colors.blueAccent),
                ),
                daysOfWeekStyle: DaysOfWeekStyle(
                  weekdayStyle: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                  weekendStyle: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                calendarFormat: CalendarFormat.month,
              ),
            ),
            const SizedBox(height: 20),
            // Display the selected date
            if (_selectedDay != null)
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 24.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Selected Date: ${_selectedDay!.toLocal()}".split(' ')[0],
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}



class SignaturePadScreen extends StatefulWidget {
  const SignaturePadScreen({super.key});

  @override
  SignaturePadScreenState createState() => SignaturePadScreenState();
}

class SignaturePadScreenState extends State<SignaturePadScreen> {
  // Signature controller to capture the signature
  final SignatureController _controller = SignatureController(
    penColor: Colors.black,
    penStrokeWidth: 5,
    exportBackgroundColor: Colors.transparent,
  );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Signature Pad",
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Title and Instructions
            Text(
              'Draw Your Signature Below:',
              style: TextStyle(
                fontSize: isSmallScreen ? 18 : 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Signature Pad
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Signature(
                controller: _controller,
                height: isSmallScreen
                    ? 200
                    : 300, // Adjust height based on screen size
                backgroundColor: Colors.grey.shade200,
              ),
            ),

            const SizedBox(height: 20),

            // Buttons to clear or save the signature
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Clear Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _controller.clear();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  child: Text(
                    "Clear",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 16,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                // Save Button (You can implement saving functionality here)
                ElevatedButton(
                  onPressed: () {
                    // Logic to save the signature (you can export it as an image, for example)
                    // Example: _controller.toImage().then((image) { /* Save image */ });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          duration: Duration(milliseconds: 200),
                          content: Text("Signature Saved!")),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class AnimatedWidgetScreen extends StatefulWidget {
  const AnimatedWidgetScreen({super.key});

  @override
  AnimatedWidgetScreenState createState() => AnimatedWidgetScreenState();
}

class AnimatedWidgetScreenState extends State<AnimatedWidgetScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define the scale animation (scaling from 0.5 to 1.5)
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Define the rotation animation (rotating 360 degrees)
    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14159265359).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _animate() {
    if (_controller.isCompleted) {
      _controller.reverse(); // Reverse the animation if it's completed
    } else {
      _controller.forward(); // Start the animation if it's not completed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text(
          "Animated widget",
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
      body: Center(
        child: GestureDetector(
          onTap: _animate, // Start/Reverse animation when tapped
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Tap Me!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}




class ParallaxScrollingScreen extends StatefulWidget {
  const ParallaxScrollingScreen({super.key});

  @override
  ParallaxScrollingScreenState createState() =>
      ParallaxScrollingScreenState();
}

class ParallaxScrollingScreenState extends State<ParallaxScrollingScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Parallax scrolling",
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
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: isSmallScreen ? 250 : 300,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double scrollPercentage =
                    (constraints.maxHeight - kToolbarHeight) /
                        (isSmallScreen ? 250 : 300);
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background image that moves at a different rate
                    Positioned(
                      top: -scrollPercentage * 100,
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/static_image.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: (constraints.maxHeight - 100) / 2,
                      left: 0,
                      right: 0,
                      child: Opacity(
                        opacity: 1 - scrollPercentage,
                        child: Text(
                          'Parallax Effect',
                          style: TextStyle(
                            fontSize: isSmallScreen ? 24 : 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  color: Colors.blueGrey[50],
                  child: Text(
                    'Item ${index + 1}',
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}


class CustomisedBottomNavigationScreen extends StatefulWidget {
  const CustomisedBottomNavigationScreen({super.key});

  @override
  CustomisedBottomNavigationScreenState createState() =>
      CustomisedBottomNavigationScreenState();
}

class CustomisedBottomNavigationScreenState
    extends State<CustomisedBottomNavigationScreen> {
  int _currentIndex = 0;

  // Screens for each tab
  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
     appBar: AppBar(
        title: const Text(
          "Customised Navigation",
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
      body: _screens[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: "Home"),
          TabItem(icon: Icons.search, title: "Search"),
          // TabItem(icon: Icons.notifications, title: "Notifications"),
          TabItem(icon: Icons.person, title: "Profile"),
        ],
        initialActiveIndex: 0,
        backgroundColor: Colors.deepPurple,
        activeColor: Colors.amber,
        color: Colors.white,
        style: TabStyle.react,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        curve: Curves.easeInOut,
        elevation: 10,
      ),
    );
  }
}

// Mock Screens for Navigation
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Home Screen",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Search Screen",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Notifications Screen",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Profile Screen",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.purple,
        ),
      ),
    );
  }
}

