import 'package:components_automation/features/components/common%20components/components%20screens/miscellaneous/miscellaneous_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

class MiscellaneousScreen extends StatefulWidget {
  const MiscellaneousScreen({super.key});

  @override
  _MiscellaneousScreenState createState() => _MiscellaneousScreenState();
}

class _MiscellaneousScreenState extends State<MiscellaneousScreen> {
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
        title:
            const Text("Miscellaneous", style: TextStyle(color: Colors.white)),
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
               
                  buildMiscellaneousWidget(
                    'Collapse animations',
                    Icons.animation,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Animate widgets collapsing smoothly',
                  ),
                  buildMiscellaneousWidget(
                    'Expandable section',
                    Icons.expand,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Expand or collapse sections with a click',
                  ),
                  buildMiscellaneousWidget(
                    'Voting widget',
                    Icons.thumb_up,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Allow users to upvote and downvote content',
                  ),
               
                  buildMiscellaneousWidget(
                    'Countdown timer',
                    Icons.timer,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Show a timer counting down',
                  ),
                  buildMiscellaneousWidget(
                    'Custom paint',
                    Icons.brush,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Design unique shapes or patterns',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildMiscellaneousWidget(
    String title,
    IconData icon,
    double cardPadding,
    double titleFontSize,
    BuildContext context,
    String tooltipMessage,
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
            // Update navigation based on the widget type
            switch (title) {
              
              case 'Collapse animations':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CollapseAnimationsScreen(),
                  ),
                );
                break;
              case 'Expandable section':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ExpandableSectionScreen(),
                  ),
                );
                break;
              case 'Voting widget':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VotingWidgetScreen(),
                  ),
                );
                break;
              
              case 'Countdown timer':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CountdownTimerScreen(),
                  ),
                );
                break;
              case 'Custom paint':
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomPaintScreen(),
                  ),
                );
                break;
              default:
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
