import 'package:components_automation/core/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'dart:math';

class LiveChatWindowScreen extends StatefulWidget {
  const LiveChatWindowScreen({Key? key}) : super(key: key);

  @override
  _LiveChatWindowScreenState createState() => _LiveChatWindowScreenState();
}

class _LiveChatWindowScreenState extends State<LiveChatWindowScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = []; // To hold chat messages
  bool _isTyping = false; // To simulate typing status

  // Simulate sending a message and receiving a response after a delay
  void _sendMessage() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _messages.add('You: ${_controller.text}'); // Add the user's message
      _isTyping = true;
    });

    // Simulate a delay for the other user to reply
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _messages.add('Bot: I received your message.'); // Simulated bot reply
        _isTyping = false;
      });
    });

    _controller.clear(); // Clear the text field after sending the message
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Live chat window",
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
      body: Column(
        children: [
          // Chat window (ListView to display messages)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true, // To make the latest message appear at the bottom
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(message: _messages[index]);
              },
            ),
          ),
          // Typing indicator (when the bot is typing)
          if (_isTyping)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(width: 10),
                  Text('Bot is typing...'),
                ],
              ),
            ),
          // Input field and send button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage, // Send the message when pressed
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;

  const ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine if the message is from the user or bot
    final isUserMessage = message.startsWith('You:');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Align(
        alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isUserMessage ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isUserMessage ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<String> _notifications = []; // List for push notifications
  final List<String> _inAppNotifications = []; // List for in-app notifications
  late Timer _notificationTimer; // Timer to simulate receiving notifications
  double _notificationPosition =
      -100.0; // Position for the sliding push notification
  bool _isNotificationRead = false;

  @override
  void initState() {
    super.initState();
    // Remove the periodic timer and only handle notifications with button presses
  }

  // Simulate receiving a push notification
  void _receivePushNotification() {
    // Ensure the setState only occurs if the widget is still mounted
    if (!mounted) return;

    setState(() {
      _notifications.insert(0, 'New Push Notification at ${DateTime.now()}');
      _notificationPosition = -100.0; // Start position for animation
    });

    // Animate the push notification to move near the app bar
    Future.delayed(Duration(milliseconds: 100), () {
      if (!mounted) return;
      setState(() {
        _notificationPosition = 50.0; // Final position after animation
      });
    });
  }

  // Simulate sending an in-app notification (which disappears after 3 seconds)
  void _sendInAppNotification() {
    // Ensure there are no more than 4 notifications
    if (_inAppNotifications.length >= 4) {
      setState(() {
        _inAppNotifications.removeAt(_inAppNotifications.length - 1);
      });
    }

    if (!mounted) return;

    setState(() {
      _inAppNotifications.insert(0, 'You have a new in-app notification!');
    });

    // Remove the in-app notification after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      if (_inAppNotifications.isNotEmpty && mounted) {
        setState(() {
          _inAppNotifications.removeAt(0);
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Handle tap on a notification
  void _onNotificationTap(String notification) {
    // Ensure we show the snack bar safely
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: Duration(microseconds: 500),
          content: Text('Notification read successfully')),
    );

    // Remove the notification from the list after it is read
    setState(() {
      _notifications.remove(notification);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications screen",
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
      body: Stack(
        children: [
          // Push Notification with Animation from Top
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: _notificationPosition,
            left: 20.0,
            right: 20.0,
            child: _notifications.isNotEmpty
                ? GestureDetector(
                    onTap: () => _onNotificationTap(_notifications[0]),
                    child: NotificationTile(notification: _notifications[0]),
                  )
                : Container(),
          ),

          // In-App Notifications List
          Positioned(
            top:
                150.0, // Place in-app notifications below the push notification
            left: 20.0,
            right: 20.0,
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              itemCount: _inAppNotifications.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _onNotificationTap(_inAppNotifications[index]),
                  child: NotificationTile(
                      notification: _inAppNotifications[index]),
                );
              },
            ),
          ),

          // Buttons at the Bottom to send notifications
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: _receivePushNotification,
                    child: const Text('Send Push Notification'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _sendInAppNotification,
                    child: const Text('Send In-App Notification'),
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

class NotificationTile extends StatelessWidget {
  final String notification;

  const NotificationTile({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(Icons.notifications, color: Colors.blue),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                notification,
                style: const TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityFeedScreen extends StatefulWidget {
  const ActivityFeedScreen({Key? key}) : super(key: key);

  @override
  _ActivityFeedScreenState createState() => _ActivityFeedScreenState();
}

class _ActivityFeedScreenState extends State<ActivityFeedScreen> {
  final List<Post> _posts = []; // List to hold the posts
  late Timer _postTimer; // Timer to simulate receiving new posts
  late Timer _likeUpdateTimer; // Timer to simulate liking posts
  bool _isLoading = true; // Flag to indicate loading state

  @override
  void initState() {
    super.initState();

    // Simulate delay to show the CircularProgressIndicator initially
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _isLoading = false; // Stop loading after 500 ms
      });
    });

    // Start a timer to simulate new posts being added every 4 seconds
    _postTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      _addNewPost();
    });

    // Start a timer to simulate users liking posts every 3 seconds
    _likeUpdateTimer = Timer.periodic(Duration(seconds: 3), (timer) {
      _likeRandomPost();
    });

    // Add the first post instantly
    _addNewPost();
  }

  // Simulate adding a new post
  void _addNewPost() {
    if (!mounted) return;

    setState(() {
      // Add a new post to the list
      _posts.insert(
        0,
        Post(
          title: 'New Post at ${DateTime.now().toLocal()}',
          description: 'This is a newly created post in the feed.',
          likes: 0,
        ),
      );

      // Ensure the list doesn't exceed 5 posts
      if (_posts.length > 5) {
        _posts.removeLast(); // Remove the oldest post if there are more than 5
      }
    });
  }

  // Simulate liking a random post
  void _likeRandomPost() {
    if (_posts.isNotEmpty) {
      // Generate a random index from the list of posts
      int postIndex =
          (DateTime.now().millisecondsSinceEpoch % _posts.length).toInt();

      setState(() {
        _posts[postIndex].likes +=
            1; // Increment the like count for the selected post
      });
    }
  }

  // Handle tap on the Like button
  void _onLikeTap(Post post) {
    setState(() {
      post.likes += 1; // Increment the like count on tap
    });
  }

  @override
  void dispose() {
    // Cancel the timers when the screen is disposed
    _postTimer.cancel();
    _likeUpdateTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Activity feed", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          // Display the activity feed list (posts)
          Positioned.fill(
            child: _isLoading
                ? Center(
                    child:
                        CircularProgressIndicator(), // Show loading indicator
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _posts.length,
                    itemBuilder: (context, index) {
                      final post = _posts[index];

                      return PostTile(
                        post: post,
                        onLikeTap: () => _onLikeTap(post),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class PostTile extends StatelessWidget {
  final Post post;
  final VoidCallback onLikeTap;

  const PostTile({Key? key, required this.post, required this.onLikeTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              post.description,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  onPressed: onLikeTap,
                  icon: Icon(Icons.thumb_up, color: Colors.blue),
                ),
                Text(
                  '${post.likes} Likes',
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Post {
  String title;
  String description;
  int likes;

  Post({
    required this.title,
    required this.description,
    required this.likes,
  });
}

class TypingIndicatorScreen extends StatefulWidget {
  const TypingIndicatorScreen({Key? key}) : super(key: key);

  @override
  _TypingIndicatorScreenState createState() => _TypingIndicatorScreenState();
}

class _TypingIndicatorScreenState extends State<TypingIndicatorScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = []; // To hold chat messages
  bool _isTyping = false; // To simulate typing status

  Timer? _typingTimer; // Timer to simulate the delay in typing time
  late ValueNotifier<int> _dotCountNotifier; // To manage the dot animation

  @override
  void initState() {
    super.initState();
    _dotCountNotifier = ValueNotifier<int>(0); // Start with 0 dots
  }

  // Simulate sending a message and receiving a response after a delay
  void _sendMessage() {
    if (_controller.text.isEmpty) return;

    setState(() {
      _messages.add('You: ${_controller.text}'); // Add the user's message
    });

    _controller.clear(); // Clear the text field after sending the message

    // Simulate typing time for the bot's response
    _simulateBotTyping();
  }

  // Simulate the bot typing with a random delay between 1 and 4 seconds
  void _simulateBotTyping() {
    setState(() {
      _isTyping = true; // Start the typing animation
    });

    // Random delay for bot response (between 1 and 4 seconds)
    final random = Random();
    final typingDelay =
        random.nextInt(4) + 1; // Random delay between 1 and 4 seconds

    // Timer for typing delay to simulate real typing time
    _typingTimer = Timer(Duration(seconds: typingDelay), () {
      setState(() {
        _isTyping = false; // Stop typing animation after the message is sent
        _messages.add('User: I received your message.'); // Simulated bot reply
      });
    });

    // Start the typing animation (dots)
    _startTypingAnimation();
  }

  // Start the typing animation (dots) with a 500ms interval
  void _startTypingAnimation() {
    const duration = Duration(milliseconds: 500); // Interval for dot animation
    int count = 0;

    // Keep updating the dot count for animation effect
    Timer.periodic(duration, (timer) {
      if (!_isTyping) {
        timer.cancel();
        _dotCountNotifier.value = 0;
        return;
      }

      count = (count + 1) % 4; // Cycle through 0 to 3 dots
      _dotCountNotifier.value = count;
    });
  }

  @override
  void dispose() {
    // Safely cancel the typing timer if it's not null
    _typingTimer?.cancel();
    _dotCountNotifier
        .dispose(); // Dispose the ValueNotifier when no longer needed
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Ensuring that when the screen is reentered, the typing state is reset if needed.
    if (!_isTyping && _dotCountNotifier.value != 0) {
      _dotCountNotifier.value = 0; // Reset dots if the typing is not active
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Typing indicator",
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
      body: Column(
        children: [
          // Chat window (ListView to display messages)
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true, // To make the latest message appear at the bottom
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return TypingIndicatorChatBubble(message: _messages[index]);
              },
            ),
          ),

          // Typing indicator (when the bot is typing)
          if (_isTyping)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildTypingAnimation(),
                  const SizedBox(width: 10),
                  Text('User is typing...',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

          // Input field and send button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage, // Send the message when pressed
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Typing animation (three dots that animate)
  Widget _buildTypingAnimation() {
    return ValueListenableBuilder<int>(
      valueListenable: _dotCountNotifier,
      builder: (context, dotCount, child) {
        final dots = '.' * dotCount; // Create dots based on the count
        return Text(
          dots,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        );
      },
    );
  }
}

class TypingIndicatorChatBubble extends StatelessWidget {
  final String message;

  const TypingIndicatorChatBubble({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isUserMessage = message.startsWith('You:');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Align(
        alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: isUserMessage ? Colors.blue : Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isUserMessage ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class RealTimeUpdatesScreen extends StatefulWidget {
  const RealTimeUpdatesScreen({Key? key}) : super(key: key);

  @override
  _StockTickerScreenState createState() => _StockTickerScreenState();
}

class _StockTickerScreenState extends State<RealTimeUpdatesScreen> {
  late Timer _tickerTimer;
  List<FlSpot> _stockData = [];
  double _currentPrice = 100.0; // Initial price
  int _timeElapsed = 0;

  @override
  void initState() {
    super.initState();

    // Start the timer to simulate the stock updates every second
    _tickerTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateStockData();
    });
  }

  // Function to update stock data
  void _updateStockData() {
    setState(() {
      _timeElapsed++;
      _currentPrice = _currentPrice +
          (Random().nextDouble() * 2 - 1); // Simulating small price fluctuation
      _stockData.add(FlSpot(_timeElapsed.toDouble(), _currentPrice));

      // Keep only the last 50 data points
      if (_stockData.length > 50) {
        _stockData.removeAt(0);
      }
    });
  }

  @override
  void dispose() {
    // Cancel the timer when the screen is disposed
    _tickerTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Real time updates",
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
        child: Column(
          children: [
            // Display current price
            Text(
              'Stock current Price: \$${_currentPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Display real-time stock chart
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: _stockData,
                      isCurved: true,
                      color: Colors.blue,
                      barWidth: 4,
                      belowBarData: BarAreaData(show: false),
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
