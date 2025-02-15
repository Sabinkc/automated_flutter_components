
import 'package:components_automation/features/components/common%20components/components%20screens/card%20and%20container/card_and_container_detail_screen.dart';

import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

class CardAndContainerScreen extends StatefulWidget {
  const CardAndContainerScreen({super.key});

  @override
  _CardAndContainerState createState() => _CardAndContainerState();
}

class _CardAndContainerState extends State<CardAndContainerScreen> {
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
        title: const Text("Cards and containers",
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
                buildCardAndContainer(
                  'Basic card',
                  Icons.credit_card, // Icon for basic card
                  cardPadding,
                  titleFontSize,
                  context,
                  'Displays a simple card with title and description.', // Tooltip
                  const BasicCardScreen(),
                ),
                buildCardAndContainer(
                  'Expandable card',
                  Icons.expand, // Icon for expandable card
                  cardPadding,
                  titleFontSize,
                  context,
                  'A card that can expand to show more content.', // Tooltip
                  const ExpandableCardScreen(),
                ),
                buildCardAndContainer(
                  'Collapsible card',
                  Icons.unfold_less, // Icon for collapsible card
                  cardPadding,
                  titleFontSize,
                  context,
                  'A card that can collapse to hide its content.', // Tooltip
                  const CollapsibleCardScreen(),
                ),
                buildCardAndContainer(
                  'Image card',
                  Icons.image, // Icon for image card
                  cardPadding,
                  titleFontSize,
                  context,
                  'A card that displays an image along with text.', // Tooltip
                  const ImageCardScreen(),
                ),
                buildCardAndContainer(
                  'Card with actions',
                  Icons.touch_app, // Icon for card with actions
                  cardPadding,
                  titleFontSize,
                  context,
                  'A card with buttons or actionable elements.', // Tooltip
                  const CardWithActionScreen(),
                ),
                buildCardAndContainer(
                  'Profile card',
                  Icons.person, // Icon for profile card
                  cardPadding,
                  titleFontSize,
                  context,
                  'Displays user information such as profile picture and details.', // Tooltip
                  const ProfileCardScreen(),
                ),
                buildCardAndContainer(
                  'Notification card',
                  Icons.notifications, // Icon for notification card
                  cardPadding,
                  titleFontSize,
                  context,
                  'Displays notifications with actions like dismiss or read.', // Tooltip
                  const NotificationCardScreen(),
                ),
                buildCardAndContainer(
                  'Animated card',
                  Icons.animation, // Icon for animated card
                  cardPadding,
                  titleFontSize,
                  context,
                  'A card with animation effects like transitions.', // Tooltip
                  const AnimatedCardScreen(),
                ),
                buildCardAndContainer(
                  'Basic container',
                  Icons.square, // Icon for basic container
                  cardPadding,
                  titleFontSize,
                  context,
                  'A simple container to hold and style content.', // Tooltip
                  const BasicContainerScreen(),
                ),
                buildCardAndContainer(
                  'Stacked container',
                  Icons.layers, // Icon for stacked container
                  cardPadding,
                  titleFontSize,
                  context,
                  'Layers multiple containers or widgets on top of each other.', // Tooltip
                  const StackedContainerScreen(),
                ),
                buildCardAndContainer(
                  'Overlay container',
                  Icons.layers_outlined, // Icon for overlay container
                  cardPadding,
                  titleFontSize,
                  context,
                  'A container with overlay effects like gradients or semi-transparent layers.', // Tooltip
                  const OverlayContainerScreen(),
                ),
                buildCardAndContainer(
                  'Scrollable container',
                  Icons.view_list, // Icon for scrollable container
                  cardPadding,
                  titleFontSize,
                  context,
                  'A container that enables scrolling for large content.', // Tooltip
                  const ScrollableContainerScreen(),
                ),
                buildCardAndContainer(
                  'Widget Container',
                  Icons.widgets, // Icon for widget container
                  cardPadding,
                  titleFontSize,
                  context,
                  'A container to demonstrate various widgets.', // Tooltip
                  const WidgetContainerScreen(),
                ),
                buildCardAndContainer(
                  'Grid container',
                  Icons.grid_view, // Icon for grid container
                  cardPadding,
                  titleFontSize,
                  context,
                  'Displays content in a grid format.', // Tooltip
                  const GridContainerScreen(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardAndContainer(
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
