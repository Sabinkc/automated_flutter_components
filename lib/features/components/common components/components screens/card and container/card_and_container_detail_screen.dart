import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class BasicCardScreen extends StatelessWidget {
  const BasicCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic card", style: TextStyle(color: Colors.white)),
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
        child: ListView(
          children: [
            Card(
              elevation: 4, // Adds a shadow effect
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Title',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'This is a basic card demonstrating how to use the Card widget in Flutter. You can customize it as needed.',
                      style: TextStyle(fontSize: 14),
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
}

class ExpandableCardScreen extends StatelessWidget {
  const ExpandableCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expandable Card",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor
            .primaryColor, // Replace with your primary color if needed
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ExpandableCard(
              title: 'Expandable Card Title',
              content:
                  'This is the content of the expandable card. You can expand or collapse this card to see more or less information.',
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableCard extends StatefulWidget {
  final String title;
  final String content;

  const ExpandableCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  State<ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded; // Toggle expanded state
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            if (_isExpanded) ...[
              const SizedBox(height: 8),
              Text(
                widget.content,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class CollapsibleCardScreen extends StatelessWidget {
  const CollapsibleCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Collapsible Card",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor
            .primaryColor, // Replace with your primary color if needed
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CollapsibleCard(
              title: 'Collapsible Card Title',
              content:
                  'This card is initially expanded and can be collapsed by tapping the header.',
            ),
          ],
        ),
      ),
    );
  }
}

class CollapsibleCard extends StatefulWidget {
  final String title;
  final String content;

  const CollapsibleCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  State<CollapsibleCard> createState() => _CollapsibleCardState();
}

class _CollapsibleCardState extends State<CollapsibleCard> {
  bool _isExpanded = true; // Set to true to make the card expanded initially

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded; // Toggle expanded state
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            if (_isExpanded) ...[
              const SizedBox(height: 8),
              Text(
                widget.content,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ImageCardScreen extends StatelessWidget {
  const ImageCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Card", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor
            .primaryColor, // Replace with your primary color if needed
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ImageCard(
              title: 'Image Card Title',
              imagePath:
                  'assets/static_image.jpg', // Make sure the image exists in the assets folder
              content: 'This is a card with an image.',
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String content;

  const ImageCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image as the card header
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardWithActionScreen extends StatelessWidget {
  const CardWithActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card with Actions",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor
            .primaryColor, // Replace with your primary color if needed
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CardWithAction(
              title: 'Card with Action Title',
              content:
                  'This card contains actionable buttons that users can tap to perform an action.',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      duration: Duration(milliseconds: 200),
                      content: Text('Action button clicked!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CardWithAction extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressed; // Callback for button action

  const CardWithAction({
    super.key,
    required this.title,
    required this.content,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onPressed, // Executes the action when pressed
              child: const Text('Click Me'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Profile Card", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor
            .primaryColor, // Replace with your primary color if needed
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ProfileCard(
              username: 'John Doe',
              bio:
                  'Flutter Developer | Tech Enthusiast | Open Source Contributor',
              onPressed: () {
                // Action for follow button, can navigate to another screen or show a dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      duration: Duration(milliseconds: 200),
                      content: Text('Following John Doe')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String username;
  final String bio;
  final VoidCallback onPressed;

  const ProfileCard({
    super.key,
    required this.username,
    required this.bio,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile icon as profile image
            Center(
              child: CircleAvatar(
                radius: 40, // Size of the profile icon
                backgroundColor:
                    Colors.grey.shade300, // Background color of the avatar
                child: const Icon(
                  Icons.person, // Profile icon
                  size: 80, // Icon size
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Username Text
            Text(
              username,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Bio Text
            Text(
              bio,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Follow Button
            ElevatedButton(
              onPressed: onPressed, // Executes the action when pressed
              child: const Text('Follow'),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationCardScreen extends StatefulWidget {
  const NotificationCardScreen({super.key});

  @override
  _NotificationCardScreenState createState() => _NotificationCardScreenState();
}

class _NotificationCardScreenState extends State<NotificationCardScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Create the sliding animation from left to right
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Start position (off-screen to the left)
      end: Offset.zero, // End position (fully visible)
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));
  }

  // Function to show the notification with animation
  void _showNotification() {
    // Start the animation to show the notification
    _animationController.forward();
  }

  // Function to dismiss the notification with animation
  void _dismissNotification() {
    // Reverse the animation to slide out the notification
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Card",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Primary color
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _showNotification,
              child: const Text("Display Notification"),
            ),
          ),
          // Sliding notification card
          SlideTransition(
            position: _slideAnimation,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(Icons.notifications, color: Colors.white),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'You have a new notification!',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: _dismissNotification,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // Clean up the animation controller
    super.dispose();
  }
}

class AnimatedCardScreen extends StatefulWidget {
  const AnimatedCardScreen({super.key});

  @override
  _AnimatedCardScreenState createState() => _AnimatedCardScreenState();
}

class _AnimatedCardScreenState extends State<AnimatedCardScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true); // Make the animation loop continuously

    // Define the animations for width, height, and color
    _widthAnimation = Tween<double>(begin: 300.0, end: 350.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _heightAnimation = Tween<double>(begin: 150.0, end: 250.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _colorAnimation =
        ColorTween(begin: Colors.blueAccent, end: Colors.greenAccent).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    // Dispose the animation controller when the widget is disposed
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Animated Card", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Primary color
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return AnimatedContainer(
              duration: const Duration(seconds: 1),
              width: _widthAnimation.value,
              height: _heightAnimation.value,
              decoration: BoxDecoration(
                color: _colorAnimation.value,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.card_travel, size: 40, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'Animated Card!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class BasicContainerScreen extends StatelessWidget {
  const BasicContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Containers",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Primary color
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the content with SingleChildScrollView to make it scrollable
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // Changed to Column since SingleChildScrollView works with a single child, in this case, the Column
          children: [
            // Border Container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border:
                    Border.all(color: Colors.blue, width: 2), // Border style
              ),
              child: const Center(
                child: Text(
                  'Border Container',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Rounded Container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: const Center(
                child: Text(
                  'Rounded Container',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Shadowed Container
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(4, 4),
                  ),
                ], // Shadow effect
              ),
              child: const Center(
                child: Text(
                  'Shadowed Container',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Circular Container
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.purpleAccent,
                shape: BoxShape.circle, // Circular shape
              ),
              child: const Center(
                child: Text(
                  'Circular Container',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Gradient Container
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple], // Gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: const Center(
                child: Text(
                  'Gradient Container',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StackedContainerScreen extends StatelessWidget {
  const StackedContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stacked Containers",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Primary color
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Stack(
        // Use Stack to overlay containers
        children: [
          // First container (background layer)
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color:
                  Colors.blue.withOpacity(0.5), // Semi-transparent background
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Text(
                'Background Container',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),

          // Second container (middle layer)
          Positioned(
            top: 50, // Position this container with a top margin
            left: 30,
            child: Container(
              width: 250,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Middle Layer Container',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Third container (top layer)
          Positioned(
            top: 100, // Position this container slightly below the second one
            left: 60,
            child: Container(
              width: 200,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Top Layer Container',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Optional Floating Action Button for demonstration
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      duration: Duration(milliseconds: 200),
                      content: Text('Floating Action Button Pressed')),
                );
              },
              child: const Icon(Icons.add),
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class OverlayContainerScreen extends StatelessWidget {
  const OverlayContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Overlay Containers Demo",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Primary color
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Stack(
        // Use Stack to overlay containers
        children: [
          // Main content container
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.blue.shade50, // Light blue background
            child: const Center(
              child: Text(
                'Main Content',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
            ),
          ),

          // Semi-transparent overlay container
          Positioned.fill(
            child: Container(
              color: Colors.transparent
                  .withOpacity(0.4), // Semi-transparent overlay
              child: const Center(
                child: Text(
                  'This is an overlay container\nTap to dismiss',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          // Inner container (popup effect)
          Positioned(
            top: 150,
            left: 50,
            right: 50,
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Overlay Content',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollableContainerScreen extends StatelessWidget {
  const ScrollableContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scrollable Red Container",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Primary color
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        // Ensure content is scrollable
        child: Center(
          child: Container(
            width: double.infinity, // Take full width of screen
            color: Colors.red, // Red background color for the container
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'This is a red container',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Scroll the container to see more content. This is a scrollable container with a red background color.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Adding more content to make the container scrollable
                Container(
                  height: 400, // Increased content height to ensure scroll
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Scrollable content goes here!',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'You can keep adding content and the container will scroll.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 100), // More space for scrolling
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WidgetContainerScreen extends StatelessWidget {
  const WidgetContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Container",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Primary color
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
          child: Container(
            width: double.infinity, // Take up the full width
            color: Colors.blueGrey, // Background color of the container
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Widget Container Demonstration',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                const Text(
                  'This is a container displaying various widgets in Flutter.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Displaying an image from assets
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/static_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 20),
                // Displaying an icon
                const Icon(
                  Icons.star,
                  size: 50,
                  color: Colors.yellow,
                ),
                const SizedBox(height: 20),
                // A raised button for interaction
                ElevatedButton(
                  onPressed: () {
                    // Action when pressed
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          duration: Duration(milliseconds: 200),
                          content: Text('Button Pressed')),
                    );
                  },
                  child: const Text('Press Me'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Set background color
                    foregroundColor: Colors.white, // Set text color
                  ),
                ),
                const SizedBox(height: 20),
                // Adding another text widget
                const Text(
                  'You can use any widget inside a container in Flutter.',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GridContainerScreen extends StatelessWidget {
  const GridContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Grid Container", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Primary color
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
          child: Container(
            width: double.infinity, // Full width of the container
            color: Colors.blueGrey, // Container background color
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: screenWidth > 600 ? 3 : 2, // 2 items per row
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisSpacing: 10.0, // Spacing between rows
              ),
              itemCount: 6, // Total number of items in the grid
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Item ${index + 1}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
