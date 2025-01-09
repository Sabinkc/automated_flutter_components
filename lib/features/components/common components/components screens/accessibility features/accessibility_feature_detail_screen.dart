import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenReaderHintsScreen extends StatelessWidget {
  const ScreenReaderHintsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen reader hints",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title with screen reader hint
              Tooltip(
                message:
                    'Welcome message: Learn how screen readers work on this screen.',
                child: Semantics(
                  label:
                      'Welcome to the screen reader demo. This screen demonstrates how to use screen reader hints for accessibility.',
                  child: const Text(
                    'Welcome to the Screen Reader Demo!',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Instructions for enabling screen readers

              // Button with screen reader hint for greeting
              Tooltip(
                message: 'Tap to hear a greeting message.',
                child: Semantics(
                  label: 'Press this button to hear a greeting message.',
                  button: true,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            duration: Duration(milliseconds: 500),
                            content: Text('Hello! Welcome to the app!')),
                      );
                    },
                    child: const Text('Greet Me'),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Text field for name input with screen reader hint
              Tooltip(
                message: 'Enter your name in the text field.',
                child: Semantics(
                  label: 'Enter your name.',
                  hint: 'You can type your name in the field below.',
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Slider with screen reader hint for volume control
              Tooltip(
                message: 'Adjust the volume level by dragging the slider.',
                child: Semantics(
                  label: 'Adjust the volume level using the slider below.',
                  hint: 'Drag the slider to change the volume.',
                  child: Slider(
                    value: 50,
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      // You can add any logic to handle the slider change
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Go back button with screen reader hint
              Tooltip(
                message: 'Go back to the previous screen.',
                child: Semantics(
                  label: 'Press this button to go back to the previous screen.',
                  button: true,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Go back to the previous screen
                    },
                    child: const Text('Go Back'),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Tooltip(
                message:
                    'Detailed instructions on how to activate screen readers.',
                child: Semantics(
                  label:
                      'Instructions for enabling screen readers on Android and iOS devices.',
                  child: const Text(
                    'How to Enable Screen Readers:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '• On Android: Go to Settings > Accessibility > TalkBack and enable it.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              const Text(
                '• On iOS: Go to Settings > Accessibility > VoiceOver and enable it.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class KeyboardNavigationScreen extends StatefulWidget {
  @override
  _KeyboardNavigationScreenState createState() =>
      _KeyboardNavigationScreenState();
}

class _KeyboardNavigationScreenState extends State<KeyboardNavigationScreen> {
  final FocusNode _buttonFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Focus on the button when the screen is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _buttonFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _buttonFocusNode.dispose();
    super.dispose();
  }

  // Handle key press events
  void _handleKeyPress(KeyEvent event) {
    if (event.runtimeType.toString() == 'RawKeyDownEvent') {
      // When Enter or Space key is pressed, navigate to the new screen
      if (event.logicalKey.keyId == 0x100000005 ||
          event.logicalKey.keyId == 0x100000002) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewScreen()), // Navigate to NewScreen
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keyboard navigation demo",
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
      body: KeyboardListener(
        focusNode: FocusNode(),
        onKeyEvent: _handleKeyPress,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: ElevatedButton(
              focusNode: _buttonFocusNode, // Focus on the button by default
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewScreen()), // Navigate to NewScreen
                );
              },
              child: Text('Press Enter key from keyboard'),
            ),
          ),
        ),
      ),
    );
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New screen", style: TextStyle(color: Colors.white)),
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
        child: Text(
          "This is the new screen!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class FocusIndicatorScreen extends StatefulWidget {
  @override
  _FocusIndicatorScreenState createState() => _FocusIndicatorScreenState();
}

class _FocusIndicatorScreenState extends State<FocusIndicatorScreen> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();

  // Track the hover state for each button
  bool _isHovered1 = false;
  bool _isHovered2 = false;
  bool _isHovered3 = false;

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Focus Indicator demo",
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
            Focus(
              focusNode: _focusNode1,
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _isHovered1 = true; // Button 1 is being hovered
                  });
                },
                onExit: (_) {
                  setState(() {
                    _isHovered1 = false; // Button 1 is no longer hovered
                  });
                },
                child: GestureDetector(
                  onTap: () => _focusNode1.requestFocus(),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _focusNode1.hasFocus
                          ? Colors.blue.withOpacity(0.2)
                          : Colors.grey.withOpacity(0.1),
                      border: Border.all(
                        color: _focusNode1.hasFocus ? Colors.blue : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    transform: Matrix4.identity()
                      ..scale(_isHovered1
                          ? 1.1
                          : 1.0), // Enlarge the button on hover
                    child: Text(
                      'Button 1',
                      style: TextStyle(
                        fontSize: 18,
                        color:
                            _focusNode1.hasFocus ? Colors.blue : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Focus(
              focusNode: _focusNode2,
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _isHovered2 = true; // Button 2 is being hovered
                  });
                },
                onExit: (_) {
                  setState(() {
                    _isHovered2 = false; // Button 2 is no longer hovered
                  });
                },
                child: GestureDetector(
                  onTap: () => _focusNode2.requestFocus(),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _focusNode2.hasFocus
                          ? Colors.green.withOpacity(0.2)
                          : Colors.grey.withOpacity(0.1),
                      border: Border.all(
                        color:
                            _focusNode2.hasFocus ? Colors.green : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    transform: Matrix4.identity()
                      ..scale(_isHovered2
                          ? 1.1
                          : 1.0), // Enlarge the button on hover
                    child: Text(
                      'Button 2',
                      style: TextStyle(
                        fontSize: 18,
                        color:
                            _focusNode2.hasFocus ? Colors.green : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Focus(
              focusNode: _focusNode3,
              child: MouseRegion(
                onEnter: (_) {
                  setState(() {
                    _isHovered3 = true; // Button 3 is being hovered
                  });
                },
                onExit: (_) {
                  setState(() {
                    _isHovered3 = false; // Button 3 is no longer hovered
                  });
                },
                child: GestureDetector(
                  onTap: () => _focusNode3.requestFocus(),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _focusNode3.hasFocus
                          ? Colors.red.withOpacity(0.2)
                          : Colors.grey.withOpacity(0.1),
                      border: Border.all(
                        color: _focusNode3.hasFocus ? Colors.red : Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    transform: Matrix4.identity()
                      ..scale(_isHovered3
                          ? 1.1
                          : 1.0), // Enlarge the button on hover
                    child: Text(
                      'Button 3',
                      style: TextStyle(
                        fontSize: 18,
                        color: _focusNode3.hasFocus ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class HighContrastModeScreen extends StatefulWidget {
  @override
  _HighContrastModeScreenState createState() => _HighContrastModeScreenState();
}

class _HighContrastModeScreenState extends State<HighContrastModeScreen> {
  bool isHighContrast = false;

  @override
  Widget build(BuildContext context) {
    // Define the color schemes for high and low contrast
    final backgroundColor = isHighContrast ? Colors.black : Colors.white;
    final textColor = isHighContrast ? Colors.yellow : Colors.black;
    final buttonColor = isHighContrast ? Colors.yellow : Colors.blue;
    final buttonTextColor = isHighContrast ? Colors.black : Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: const Text("High contrast mode",
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
      backgroundColor: backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Informative Text
              Text(
                'This screen demonstrates toggling between high and low contrast modes.',
                style: TextStyle(
                  fontSize: 18,
                  color: textColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Example Content
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: isHighContrast ? Colors.grey[800] : Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'This is some example content.',
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                  ),
                ),
              ),
              SizedBox(height: 40),
              // Toggle Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: buttonTextColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                onPressed: () {
                  setState(() {
                    isHighContrast = !isHighContrast;
                  });
                },
                child: Text(isHighContrast
                    ? 'Switch to Low Contrast'
                    : 'Switch to High Contrast'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
