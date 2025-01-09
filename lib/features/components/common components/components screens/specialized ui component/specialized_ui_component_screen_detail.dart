import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:shimmer/shimmer.dart';

import 'package:lottie/lottie.dart';

class TagInputScreen extends StatefulWidget {
  const TagInputScreen({super.key});

  @override
  _TagInputScreenState createState() => _TagInputScreenState();
}

class _TagInputScreenState extends State<TagInputScreen> {
  final TextEditingController _tagController = TextEditingController();
  final List<String> _tags = [];
  String? _centerText;
  bool _isLoading = false;

  void _addTag() {
    final tag = _tagController.text.trim();
    if (tag.isNotEmpty && !_tags.contains(tag)) {
      setState(() {
        _tags.add(tag);
      });
      _displayText(tag);
    }
    _tagController.clear();
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
  }

  void _displayText(String text) async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      _isLoading = false;
      _centerText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tag input", style: TextStyle(color: Colors.white)),
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
          children: [
            // Search box at the top
            TextField(
              controller: _tagController,
              decoration: InputDecoration(
                labelText: 'Enter a tag',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTag,
                ),
                border: const OutlineInputBorder(),
              ),
              onSubmitted: (_) => _addTag(),
            ),
            const SizedBox(height: 16.0),

            // Center display with loading or text
            Expanded(
              child: Center(
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : Text(
                        _centerText ?? '',
                        style: const TextStyle(fontSize: 24.0),
                        textAlign: TextAlign.center,
                      ),
              ),
            ),

            // Tags displayed at the bottom
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tags:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _tags
                      .map(
                        (tag) => GestureDetector(
                          onTap: () => _displayText(tag),
                          child: Chip(
                            label: Text(tag),
                            deleteIcon: const Icon(Icons.close),
                            onDeleted: () => _removeTag(tag),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avatar", style: TextStyle(color: Colors.white)),
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Outer Circle for Avatar
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
            // Inner Circle
            Container(
              width: 140,
              height: 140,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            // Profile Icon
            const Icon(
              Icons.person,
              size: 80,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

class RatingStarScreen extends StatefulWidget {
  const RatingStarScreen({super.key});

  @override
  _RatingStarScreenState createState() => _RatingStarScreenState();
}

class _RatingStarScreenState extends State<RatingStarScreen> {
  double _rating = 0;

  // Method to handle rating updates
  void _setRating(double rating) {
    setState(() {
      // Decrease the rating if the user presses the already filled star
      if (_rating == rating) {
        _rating = rating - 1; // Decrease the rating by 1
      } else {
        _rating = rating; // Set the rating based on the clicked star
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rating star", style: TextStyle(color: Colors.white)),
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
            // Display the current rating value
            Text(
              'Rating: ${_rating.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 16.0),

            // Rating stars
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                    size: 40.0,
                  ),
                  onPressed: () {
                    _setRating(index +
                        1.0); // Set or decrease the rating based on the clicked star
                  },
                );
              }),
            ),
            const SizedBox(height: 32.0),

            // Responsive feedback text
            if (_rating > 0 && _rating <= 1)
              const Text('Poor', style: TextStyle(fontSize: 18.0))
            else if (_rating > 1 && _rating <= 2)
              const Text('Fair', style: TextStyle(fontSize: 18.0))
            else if (_rating > 2 && _rating <= 3)
              const Text('Good', style: TextStyle(fontSize: 18.0))
            else if (_rating > 3 && _rating <= 4)
              const Text('Very Good', style: TextStyle(fontSize: 18.0))
            else if (_rating > 4)
              const Text('Excellent', style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  int _currentStep = 0;

  // Method to move to the next step
  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    }
  }

  // Method to move to the previous step
  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  // List of steps, each containing a widget and a title
  List<Step> _steps() {
    return [
      Step(
        title: const Text("Step 1"),
        content: const Column(
          children: [
            Text("This is the first step of the process."),
            SizedBox(height: 20),
            Text("Fill out some information here."),
          ],
        ),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: const Text("Step 2"),
        content: const Column(
          children: [
            Text("This is the second step of the process."),
            SizedBox(height: 20),
            Text("Enter additional details here."),
          ],
        ),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: const Text("Step 3"),
        content: const Column(
          children: [
            Text("This is the third and final step."),
            SizedBox(height: 20),
            Text("Review your information before submitting."),
          ],
        ),
        isActive: _currentStep >= 2,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stepper Demo",
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
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: _nextStep,
          onStepCancel: _previousStep,
          steps: _steps(),
        ),
      ),
    );
  }
}

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Timeline Demo",
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
        child: ListView(
          children: _timelineEvents(),
        ),
      ),
    );
  }

  // Function to generate the timeline events
  List<Widget> _timelineEvents() {
    final List<Map<String, dynamic>> events = [
      {
        'date': '2024-12-01',
        'title': 'Project Started',
        'description': 'Started a new Flutter project for a timeline app.',
        'icon': Icons.star,
        'color': Colors.blue, // Correctly define color as Color
      },
      {
        'date': '2024-12-05',
        'title': 'First Milestone Achieved',
        'description':
            'Completed the basic structure and UI design of the app.',
        'icon': Icons.check_circle,
        'color': Colors.green, // Correctly define color as Color
      },
      {
        'date': '2024-12-10',
        'title': 'Added Timeline Feature',
        'description':
            'Integrated the timeline feature to show events sequentially.',
        'icon': Icons.timeline,
        'color': Colors.orange, // Correctly define color as Color
      },
      {
        'date': '2024-12-15',
        'title': 'App Testing Started',
        'description':
            'Started testing the app to ensure smooth functionality.',
        'icon': Icons.h_mobiledata,
        'color': Colors.purple, // Correctly define color as Color
      },
    ];

    return events.map((Map<String, dynamic> event) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: event['color'], // Color should be of type Color
              ),
              child: Icon(
                event['icon'],
                color: Colors.white,
                size: 24.0,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event['title'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    event['date'],
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event['description'],
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Divider(
                    color: Colors.grey.withOpacity(0.5),
                    thickness: 1.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}

class TagCloudScreen extends StatelessWidget {
  const TagCloudScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tag Cloud Demo",
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
        child: Center(
          child: _buildTagCloud(context), // Pass context to _buildTagCloud
        ),
      ),
    );
  }

  // Function to generate the tag cloud
  Widget _buildTagCloud(BuildContext context) {
    // Accept BuildContext as parameter
    final List<String> tags = [
      'Flutter',
      'Dart',
      'Programming',
      'Mobile Development',
      'App Development',
      'UI/UX Design',
      'Machine Learning',
      'Artificial Intelligence',
      'Backend Development',
      'Frontend Development',
      'Web Development',
    ];

    // Generate a random size for each tag to simulate a tag cloud
    return Wrap(
      spacing: 8.0, // horizontal space between tags
      runSpacing: 8.0, // vertical space between tags
      children: tags.map((tag) {
        // Randomly adjust font size
        final double fontSize = (16 + (tags.indexOf(tag) % 5) * 4).toDouble();

        return GestureDetector(
          onTap: () {
            // Handle tag tap (for now just showing a snack bar)
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  duration: const Duration(milliseconds: 200),
                  content: Text('You tapped on $tag')),
            );
          },
          child: Chip(
            label: Text(
              tag,
              style: TextStyle(
                fontSize: fontSize, // Dynamic font size for effect
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.blueAccent,
            labelStyle: const TextStyle(color: Colors.white),
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          ),
        );
      }).toList(),
    );
  }
}

class ShimmerEffectScreen extends StatelessWidget {
  const ShimmerEffectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Shimmer Effect", style: TextStyle(color: Colors.white)),
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Shimmer effect for the title (Rounded)
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.white,
                  child: Container(
                    width: screenWidth * 0.7, // Responsive width
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          BorderRadius.circular(8.0), // Rounded corners
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Shimmer effect for a description (Rounded)
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.white,
                  child: Container(
                    width: screenWidth * 0.8, // Responsive width
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          BorderRadius.circular(4.0), // Rounded corners
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Shimmer effect for a user image (Circle)
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.white,
                  child: Container(
                    width: screenWidth * 0.3, // Responsive width
                    height:
                        screenWidth * 0.3, // Square container for the circle
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Shimmer effect for a button (Rounded)
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.white,
                  child: Container(
                    width: screenWidth * 0.6, // Responsive width
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          BorderRadius.circular(25.0), // Rounded corners
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Shimmer effect for another description (Rounded)
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.white,
                  child: Container(
                    width: screenWidth * 0.6, // Responsive width
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          BorderRadius.circular(4.0), // Rounded corners
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Shimmer effect for a card-like container (Advanced)
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.white,
                  child: Container(
                    width: screenWidth * 0.9, // Responsive width
                    height: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          BorderRadius.circular(15.0), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6.0,
                          offset: const Offset(0, 2),
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
    );
  }
}

class LottieAnimationScreen extends StatelessWidget {
  const LottieAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottie Animation",
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
        child: Lottie.asset(
          'assets/heart.json', // Path to your Lottie animation
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class DividerScreen extends StatelessWidget {
  const DividerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Divider Demo", style: TextStyle(color: Colors.white)),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              const Text(
                'Horizontal Divider',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),

              // Horizontal Divider
              Divider(
                color: Colors.grey[600], // Divider color
                thickness: 2.0, // Divider thickness
                indent: 0.0, // Start indent
                endIndent: 0.0, // End indent
              ),
              const SizedBox(height: 16.0),

              // Content under Horizontal Divider
              const Text(
                'This is the content below the horizontal divider.',
                style: TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 30.0),

              // Heading
              const Text(
                'Vertical Divider',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),

              // Row with Vertical Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Content before the Vertical Divider
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Left of Vertical Divider',
                        style: TextStyle(fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  // Vertical Divider
                  SizedBox(
                    height: 100, // Set a height to ensure divider shows up
                    child: VerticalDivider(
                      color: Colors.grey[600], // Divider color
                      thickness: 2.0, // Divider thickness
                      width: 20.0, // Space between the divider and the content
                      indent: 10.0, // Top indent for the divider
                      endIndent: 10.0, // Bottom indent for the divider
                    ),
                  ),
                  // Content after the Vertical Divider
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Right of Vertical Divider',
                        style: TextStyle(fontSize: 16.0),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorPickerScreen extends StatefulWidget {
  const ColorPickerScreen({super.key});

  @override
  _ColorPickerScreenState createState() => _ColorPickerScreenState();
}

class _ColorPickerScreenState extends State<ColorPickerScreen> {
  Color _selectedColor = Colors.blue; // Default selected color

  // Method to show the color picker dialog
  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  _selectedColor = color; // Update the selected color
                });
              },
              // Show color name label
              enableAlpha: false, // Disable alpha slider
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the color picker dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Picker Demo",
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
            children: [
              // Display the selected color
              Container(
                width: 100,
                height: 100,
                color: _selectedColor,
                child: Center(
                  child: Text(
                    'Color',
                    style: TextStyle(
                      color: _selectedColor.computeLuminance() > 0.5
                          ? Colors.black
                          : Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // Button to open the color picker with updated style
              ElevatedButton(
                onPressed: _showColorPicker,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _selectedColor, // Set the background color of the button
                ),
                child: const Text('Pick a Color'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FloatingLabelScreen extends StatefulWidget {
  const FloatingLabelScreen({super.key});

  @override
  State<FloatingLabelScreen> createState() => _FloatingLabelScreenState();
}

class _FloatingLabelScreenState extends State<FloatingLabelScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Floating labels Demo",
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Name Field with Floating Label
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name', // Label will float when focused
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Email Field with Floating Label
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email', // Label will float when focused
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Password Field with Floating Label
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password', // Label will float when focused
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Form submitted successfully')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
