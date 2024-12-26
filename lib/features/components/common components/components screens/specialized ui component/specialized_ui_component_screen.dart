// import 'package:components_automation/features/components/common%20components/components%20screens/miscellaneous/miscellaneous_detail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:components_automation/core/constants.dart';

// class SpecializedUiComponentScreen extends StatefulWidget {
//   const SpecializedUiComponentScreen({super.key});

//   @override
//   _SpecializedUiComponentScreenState createState() => _SpecializedUiComponentScreenState();
// }

// class _SpecializedUiComponentScreenState extends State<SpecializedUiComponentScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;

//     double cardPadding = width > 800 ? 6.0 : 12.0;
//     double titleFontSize = width > 800 ? 18 : 16;

//     final ScrollController _scrollController = ScrollController();

//     @override
//     void dispose() {
//       _scrollController.dispose();
//       super.dispose();
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title:
//             const Text("Specialized UI components", style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: CommonColor.primaryColor,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
//         ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               CommonColor.primaryColorDark,
//               CommonColor.primaryColorLight,
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: RawScrollbar(
//             controller: _scrollController,
//             thumbColor: CommonColor.secondaryColor,
//             thumbVisibility: true,
//             thickness: 4,
//             radius: const Radius.circular(8),
//             child: SingleChildScrollView(
//               controller: _scrollController,
//               child: GridView.count(
//                 shrinkWrap: true,
//                 crossAxisCount: width > 1000 ? 5 : (width > 600 ? 3 : 2),
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//                 childAspectRatio: 1,
//                 children: [

//                   buildMiscellaneousWidget(
//                     'Tag input',
//                     Icons.animation,
//                     cardPadding,
//                     titleFontSize,
//                     context,
//                     '',
//                   ),
//                   buildMiscellaneousWidget(
//                     'Avatar',
//                     Icons.expand,
//                     cardPadding,
//                     titleFontSize,
//                     context,
//                     '',
//                   ),
//                   buildMiscellaneousWidget(
//                     'Chip',
//                     Icons.thumb_up,
//                     cardPadding,
//                     titleFontSize,
//                     context,
//                     '',
//                   ),

//                   buildMiscellaneousWidget(
//                     'Rating stars',
//                     Icons.timer,
//                     cardPadding,
//                     titleFontSize,
//                     context,
//                     '',
//                   ),
//                   buildMiscellaneousWidget(
//                     'Stepper',
//                     Icons.brush,
//                     cardPadding,
//                     titleFontSize,
//                     context,
//                     '',
//                   ),
//                       buildMiscellaneousWidget(
//                     'Timeline',
//                     Icons.brush,
//                     cardPadding,
//                     titleFontSize,
//                     context,
//                     '',
//                   ),
//                       buildMiscellaneousWidget(
//                     'Tag cloud',
//                     Icons.brush,
//                     cardPadding,
//                     titleFontSize,
//                     context,
//                     '',
//                   ),    buildMiscellaneousWidget(
//                     'Rating bar',
//                     Icons.brush,
//                     cardPadding,
//                     titleFontSize,
//                     context,
//                     '',
//                   ),    buildMiscellaneousWidget(
//                     'Shimmer effect',
//                     Icons.brush,
//                     cardPadding,
//                     titleFontSize,
//                     context,
//                     '',
//                   ),
//                       buildMiscellaneousWidget(
//                     'Lottie animation',
//                     Icons.brush,
//                     cardPadding,
//                     titleFontSize,
//                     context,
//                     '',
//                   ),
//                       buildMiscellaneousWidget(
//                     'Divider',
//                     Icons.brush,
//                     cardPadding,
//                     titleFontSize,
//                     context,
//                     '',
//                   ),
//                       buildMiscellaneousWidget(
//                     'Color picker',
//                     Icons.brush,
//                     cardPadding,
//                     titleFontSize,
//                     context,
//                     '',
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildMiscellaneousWidget(
//     String title,
//     IconData icon,
//     double cardPadding,
//     double titleFontSize,
//     BuildContext context,
//     String tooltipMessage,
//   ) {
//     return Tooltip(
//       message: tooltipMessage,
//       child: Card(
//         elevation: 4,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0),
//         ),
//         child: InkWell(
//           onTap: () {
//             // Update navigation based on the widget type
//             switch (title) {

//               case 'Collapse animations':
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const CollapseAnimationsScreen(),
//                   ),
//                 );
//                 break;
//               case 'Expandable section':
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const ExpandableSectionScreen(),
//                   ),
//                 );
//                 break;
//               case 'Voting widget':
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const VotingWidgetScreen(),
//                   ),
//                 );
//                 break;

//               case 'Countdown timer':
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const CountdownTimerScreen(),
//                   ),
//                 );
//                 break;
//               case 'Custom paint':
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const CustomPaintScreen(),
//                   ),
//                 );
//                 break;
//               default:
//                 break;
//             }
//           },
//           child: Padding(
//             padding: EdgeInsets.all(cardPadding),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(icon, size: 50, color: Colors.blueAccent),
//                 const SizedBox(height: 10),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: titleFontSize,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 10),
//                 const Text(
//                   'Tap to view',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:components_automation/features/components/common%20components/components%20screens/miscellaneous/miscellaneous_detail_screen.dart';
import 'package:components_automation/features/components/common%20components/components%20screens/specialized%20ui%20component/specialized_ui_component_screen_detail.dart';
import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

class SpecializedUiComponentScreen extends StatefulWidget {
  const SpecializedUiComponentScreen({super.key});

  @override
  _SpecializedUiComponentScreenState createState() =>
      _SpecializedUiComponentScreenState();
}

class _SpecializedUiComponentScreenState
    extends State<SpecializedUiComponentScreen> {
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
        title: const Text("Specialized UI components",
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
                  buildSpecialUiComponent(
                    'Tag input',
                    Icons.animation,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Allows users to input and manage tags effectively.',
                    const TagInputScreen(),
                  ),
                  buildSpecialUiComponent(
                    'Avatar',
                    Icons.account_circle,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Displays user profile pictures or icons.',
                    const AvatarScreen(),
                  ),
                  buildSpecialUiComponent(
                    'Rating stars',
                    Icons.star,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Used for user feedback through star ratings.',
                    const RatingStarScreen(),
                  ),
                  buildSpecialUiComponent(
                    'Stepper',
                    Icons.linear_scale,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Displays progress through numbered steps.',
                    const StepperScreen(),
                  ),
                  buildSpecialUiComponent(
                    'Timeline',
                    Icons.timeline,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Visualizes events in chronological order.',
                    const TimelineScreen(),
                  ),
                  buildSpecialUiComponent(
                    'Tag cloud',
                    Icons.cloud,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Shows tags in varying sizes based on importance.',
                    const TagCloudScreen(),
                  ),
                
                  buildSpecialUiComponent(
                    'Shimmer effect',
                    Icons.blur_on,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Creates a loading placeholder animation.',
                    const ShimmerEffectScreen(),
                  ),
                  buildSpecialUiComponent(
                    'Lottie animation',
                    Icons.animation,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Displays engaging JSON-based animations.',
                    const LottieAnimationScreen(),
                  ),
                  buildSpecialUiComponent(
                    'Divider',
                    Icons.horizontal_rule,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Separates content with a horizontal line.',
                    const DividerScreen(),
                  ),
                  buildSpecialUiComponent(
                    'Color picker',
                    Icons.color_lens,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Provides a UI to select colors.',
                    const ColorPickerScreen(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSpecialUiComponent(
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
