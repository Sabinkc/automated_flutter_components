import 'package:components_automation/features/components/common%20components/components%20screens/authentication%20and%20security/authentication_and_security_detail_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/real%20time%20features/real_time_feature_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

class RealTimeFeatureScreen extends StatefulWidget {
  const RealTimeFeatureScreen({super.key});

  @override
  _RealTimeFeatureScreenState createState() => _RealTimeFeatureScreenState();
}

class _RealTimeFeatureScreenState extends State<RealTimeFeatureScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    final ScrollController scrollController = ScrollController();

    @override
    void dispose() {
      scrollController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Realtime feature screen",
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
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CommonColor.primaryColorDark,
              CommonColor.primaryColorLight,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RawScrollbar(
            thumbColor: CommonColor.secondaryColor,
            thumbVisibility: true,
            thickness: 4,
            radius: const Radius.circular(8),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: width > 1000 ? 5 : (width > 600 ? 3 : 2),
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 1,
              children: [
                buildRealTimeFeatureComponent(
                  'Live chat window',
                  Icons.chat,
                  cardPadding,
                  titleFontSize,
                  context,
                  'This component allows users to engage in real-time chat with others.',
                  const LiveChatWindowScreen(),
                ),
                buildRealTimeFeatureComponent(
                  'Notifications',
                  Icons.notifications,
                  cardPadding,
                  titleFontSize,
                  context,
                  'This component keeps users updated with real-time notifications.',
                  const NotificationsScreen(),
                ),
                buildRealTimeFeatureComponent(
                  'Activity feed',
                  Icons.rss_feed,
                  cardPadding,
                  titleFontSize,
                  context,
                  'Displays the user’s activity in a real-time feed, keeping them informed.',
                  const ActivityFeedScreen(),
                ),
                buildRealTimeFeatureComponent(
                  'Typing indicator',
                  Icons.text_fields,
                  cardPadding,
                  titleFontSize,
                  context,
                  'Shows when another user is typing in real-time.',
                  const TypingIndicatorScreen(),
                ),
                buildRealTimeFeatureComponent(
                  'Real time updates',
                  Icons.update,
                  cardPadding,
                  titleFontSize,
                  context,
                  'Shows live updates on various components, keeping the app in sync.',
                  const RealTimeUpdatesScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRealTimeFeatureComponent(
    String title,
    IconData icon,
    double cardPadding,
    double titleFontSize,
    BuildContext context,
    String tooltipMessage,
    Widget navigationScreen,
  ) {
    return Tooltip(
      message: tooltipMessage,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => navigationScreen,
              ),
            );
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
