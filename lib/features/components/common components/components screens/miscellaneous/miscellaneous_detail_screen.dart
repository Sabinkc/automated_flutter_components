import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class CollapseAnimationsScreen extends StatefulWidget {
  const CollapseAnimationsScreen({super.key});

  @override
  _CollapseAnimationsScreenState createState() =>
      _CollapseAnimationsScreenState();
}

class _CollapseAnimationsScreenState extends State<CollapseAnimationsScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collapse Animations',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Adjust this for your theme
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: _isExpanded ? 200 : 100,
              width: _isExpanded ? 300 : 200,
              color: _isExpanded ? Colors.blueAccent : Colors.orangeAccent,
              alignment: Alignment.center,
              child: const Text(
                'Tap to Expand/Collapse',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Text(_isExpanded ? 'Collapse' : 'Expand'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableSectionScreen extends StatefulWidget {
  const ExpandableSectionScreen({super.key});

  @override
  _ExpandableSectionScreenState createState() =>
      _ExpandableSectionScreenState();
}

class _ExpandableSectionScreenState extends State<ExpandableSectionScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expandible Section',
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Adjust this for your theme
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tap to ${_isExpanded ? 'collapse' : 'expand'}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: _isExpanded ? 200 : 0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: _isExpanded
                  ? const Center(
                      child: Text(
                        'This is the expandable container',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class VotingWidgetScreen extends StatefulWidget {
  const VotingWidgetScreen({super.key});

  @override
  _VotingWidgetScreenState createState() => _VotingWidgetScreenState();
}

class _VotingWidgetScreenState extends State<VotingWidgetScreen> {
  int _voteCount = 0; // Initial vote count

  // Increment vote count
  void _incrementVote() {
    setState(() {
      _voteCount++; // Increase the vote count (upvote)
    });
  }

  // Decrement vote count
  void _decrementVote() {
    setState(() {
      _voteCount--; // Decrease the vote count (downvote)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Voting Widget', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Adjust this for your theme
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Upvote button
                IconButton(
                  icon:
                      const Icon(Icons.thumb_up, size: 50, color: Colors.green),
                  onPressed: _incrementVote,
                ),
                const SizedBox(width: 30),
                // Downvote button
                IconButton(
                  icon:
                      const Icon(Icons.thumb_down, size: 50, color: Colors.red),
                  onPressed: _decrementVote,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Current vote count display
            Text(
              'Votes: $_voteCount',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Tap the upvote or downvote button to change the vote count.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}




class CountdownTimerScreen extends StatefulWidget {
  const CountdownTimerScreen({super.key});

  @override
  _CountdownTimerScreenState createState() => _CountdownTimerScreenState();
}

class _CountdownTimerScreenState extends State<CountdownTimerScreen> {
  int _seconds = 30; // Starting countdown time in seconds
  late Timer _timer; // Timer instance
  bool _isTimerRunning = false; // To track if the timer is running

  // Start or resume the timer
  void _startTimer() {
    if (_isTimerRunning) return; // Prevent starting a new timer if one is already running

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--; // Decrease the time by 1 second
        } else {
          _timer.cancel(); // Stop the timer when it reaches 0
          _showTimeUpDialog(); // Show the dialog when the timer reaches zero
        }
      });
    });

    setState(() {
      _isTimerRunning = true; // Mark the timer as running
    });
  }

  // Reset the timer
  void _resetTimer() {
    setState(() {
      _seconds = 30; // Reset the countdown to 30 seconds
      _isTimerRunning = false; // Mark the timer as not running
    });
    _timer.cancel(); // Cancel the ongoing timer
  }

  // Show dialog when the timer reaches zero
  void _showTimeUpDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevents dismissing the dialog by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Time\'s Up!'),
          content: const Text('The countdown timer has finished.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Ensure the timer is cancelled when the screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Countdown timer', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Adjust this for your theme
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(  // Wrap everything inside Center widget
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Timer Display
              Text(
                '$_seconds',
                style: const TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),
              // Start / Resume Button
              ElevatedButton(
                onPressed: _startTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isTimerRunning ? Colors.grey : Colors.green, // Replaced primary
                  foregroundColor: Colors.white, // Replaced onPrimary
                  minimumSize: const Size(200, 50),
                ),
                child: Text(_isTimerRunning ? 'Timer Running' : 'Start Timer'),
              ),
              const SizedBox(height: 20),
              // Reset Button
              ElevatedButton(
                onPressed: _resetTimer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Replaced primary
                  foregroundColor: Colors.white, // Replaced onPrimary
                  minimumSize: const Size(200, 50),
                ),
                child: const Text('Reset Timer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class CustomPaintScreen extends StatelessWidget {
  const CustomPaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Custom paint demo', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor, // Adjust this for your theme
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
      ),
      body: Center(
        child: CustomPaint(
          size: const Size(300, 300), // Set the size of the custom painting area
          painter: GradientCirclePainter(), // Custom painter for gradient circle
        ),
      ),
    );
  }
}

// Custom painter class to draw a beautiful gradient circle and additional designs
class GradientCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.fill // Filling the shape with color
      ..strokeCap = StrokeCap.round // Rounded edges
      ..strokeJoin = StrokeJoin.round; // Rounded join for paths

    // Draw gradient circle
    final Rect rect = Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2);
    paint.shader = const RadialGradient(
      colors: [Colors.blue, Colors.purple],
      stops: [0.0, 1.0],
    ).createShader(rect);

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    // Draw some additional shapes on top of the gradient circle
    paint.shader = null; // Reset shader
    paint.color = Colors.white; // Set a solid color for other shapes

    // Draw a border around the circle
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 8;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    // Draw some lines in the center for design effect
    paint.style = PaintingStyle.fill;
    paint.color = Colors.white.withOpacity(0.5);
    canvas.drawLine(
      Offset(size.width / 4, size.height / 2),
      Offset(size.width * 3 / 4, size.height / 2),
      paint,
    );
    canvas.drawLine(
      Offset(size.width / 2, size.height / 4),
      Offset(size.width / 2, size.height * 3 / 4),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint in this case
  }
}



