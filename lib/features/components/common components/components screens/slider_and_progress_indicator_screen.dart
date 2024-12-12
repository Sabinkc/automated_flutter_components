// import 'dart:async';
// import 'package:components_automation/core/constants.dart';
// import 'package:flutter/material.dart';

// class SliderAndProgressIndicatorScreen extends StatefulWidget {
//   const SliderAndProgressIndicatorScreen({super.key});

//   @override
//   _SliderAndProgressIndicatorScreenState createState() =>
//       _SliderAndProgressIndicatorScreenState();
// }

// class _SliderAndProgressIndicatorScreenState
//     extends State<SliderAndProgressIndicatorScreen> {
//   double _horizontalSliderValue = 0.5;
//   double _verticalSliderValue = 0.5;
//   RangeValues _rangeSliderValues = const RangeValues(20, 80);
//   double _linearProgressValue = 0.0;
//   double _circularProgressValue = 0.0;
//   Timer? _timer;

//   @override
//   void initState() {
//     super.initState();
//     _startProgressIndicators();
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _startProgressIndicators() {
//     _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
//       setState(() {
//         _linearProgressValue += 0.01;
//         _circularProgressValue += 0.01;
//         if (_linearProgressValue > 1.0) _linearProgressValue = 0.0;
//         if (_circularProgressValue > 1.0) _circularProgressValue = 0.0;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     double cardPadding = width > 800 ? 8.0 : 12.0;
//     double titleFontSize = width > 800 ? 18 : 16;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Sliders and Progress Indicators",
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//         backgroundColor: CommonColor.primaryColor,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(
//             Icons.arrow_back_ios,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               CommonColor.primaryColorDark,
//               CommonColor.primaryColorLight
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: RawScrollbar(
//             thumbColor: CommonColor.secondaryColor,
//             thumbVisibility: true,
//             thickness: 4,
//             radius: const Radius.circular(8),
//             child: SingleChildScrollView(
//               child: GridView.count(
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 crossAxisCount: width > 800 ? 4 : 2,
//                 crossAxisSpacing: 12.0,
//                 mainAxisSpacing: 12.0,
//                 childAspectRatio: 1.1,
//                 children: [
//                   _buildSliderCard(
//                     'Horizontal Slider',
//                     _buildSliderContent(_horizontalSliderValue, "Horizontal"),
//                     cardPadding,
//                     titleFontSize,
//                   ),
//                   _buildSliderCard(
//                     'Vertical Slider',
//                     _buildSliderContent(_verticalSliderValue, "Vertical"),
//                     cardPadding,
//                     titleFontSize,
//                   ),
//                   _buildSliderCard(
//                     'Range Slider',
//                     _buildRangeSliderContent(),
//                     cardPadding,
//                     titleFontSize,
//                   ),
//                   _buildSliderCard(
//                     'Linear Progress Bar (With %)',
//                     _buildProgressContent(_linearProgressValue, "Linear"),
//                     cardPadding,
//                     titleFontSize,
//                   ),
//                   _buildSliderCard(
//                     'Circular Progress Indicator (With %)',
//                     _buildProgressContent(_circularProgressValue, "Circular"),
//                     cardPadding,
//                     titleFontSize,
//                   ),
//                   _buildSliderCard(
//                     'Spinner/Loader',
//                     _buildSpinnerContent(),
//                     cardPadding,
//                     titleFontSize,
//                   ),
//                   _buildSliderCard(
//                     'Linear Progress Bar',
//                     _buildLinearProgressBarWithoutPercentage(),
//                     cardPadding,
//                     titleFontSize,
//                   ),
//                   _buildSliderCard(
//                     'Circular Progress Indicator',
//                     _buildCircularProgressIndicatorWithoutPercentage(),
//                     cardPadding,
//                     titleFontSize,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSliderContent(double value, String type) {
//     return Column(
//       children: [
//         Tooltip(
//           message:
//               "$type Slider: A slider that lets the user select a value within a range by sliding a thumb.",
//           child: type == "Vertical"
//               ? SizedBox(
//                   height: 100,
//                   child: RotatedBox(
//                     quarterTurns: 1,
//                     child: Slider(
//                       value: value,
//                       onChanged: (newValue) {
//                         setState(() {
//                           _verticalSliderValue = newValue;
//                         });
//                       },
//                     ),
//                   ),
//                 )
//               : Slider(
//                   value: value,
//                   onChanged: (newValue) {
//                     setState(() {
//                       _horizontalSliderValue = newValue;
//                     });
//                   },
//                 ),
//         ),
//         Text(
//           "${(value * 100).toStringAsFixed(1)}%",
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }

//   Widget _buildRangeSliderContent() {
//     return Column(
//       children: [
//         Tooltip(
//           message:
//               "Range Slider: A slider with two thumbs that lets the user select a range of values.",
//           child: RangeSlider(
//             values: _rangeSliderValues,
//             min: 0,
//             max: 100,
//             divisions: 100,
//             onChanged: (RangeValues values) {
//               setState(() {
//                 _rangeSliderValues = values;
//               });
//             },
//           ),
//         ),
//         Text(
//           "Range: ${_rangeSliderValues.start.toStringAsFixed(1)} - ${_rangeSliderValues.end.toStringAsFixed(1)}",
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }

//   Widget _buildProgressContent(double value, String type) {
//     return Column(
//       children: [
//         SizedBox(
//           height: type == "Linear" ? 10 : 40,
//           width: type == "Linear" ? double.infinity : 40,
//           child: type == "Linear"
//               ? LinearProgressIndicator(value: value)
//               : CircularProgressIndicator(value: value, strokeWidth: 3.0),
//         ),
//         Text(
//           "${(value * 100).toStringAsFixed(1)}%",
//           style: const TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }

//   Widget _buildLinearProgressBarWithoutPercentage() {
//     return const Tooltip(
//       message:
//           "Linear Progress Bar: Displays the progress of an operation in a straight line.",
//       child: SizedBox(
//         height: 10,
//         child: LinearProgressIndicator(), // Without percentage text
//       ),
//     );
//   }

//   Widget _buildCircularProgressIndicatorWithoutPercentage() {
//     return const Tooltip(
//       message:
//           "Circular Progress Indicator: Shows the progress of an operation in a circular motion.",
//       child: SizedBox(
//         height: 10,
//         width: 50,
//         child:
//             CircularProgressIndicator(strokeWidth: 3.0), // No percentage text
//       ),
//     );
//   }

//   Widget _buildSpinnerContent() {
//     return const Column(
//       children: [
//         SizedBox(
//           height: 40,
//           width: 40,
//           child: CircularProgressIndicator(strokeWidth: 3.0),
//         ),
//         Text(
//           "Loading...",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }

//   Widget _buildSliderCard(
//       String title, Widget content, double padding, double fontSize) {
//     return Card(
//       elevation: 4.0,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: EdgeInsets.all(padding),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               title,
//               style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 16),
//             Expanded(child: content),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class SliderAndProgressIndicatorScreen extends StatefulWidget {
  const SliderAndProgressIndicatorScreen({super.key});

  @override
  _SliderAndProgressIndicatorScreenState createState() =>
      _SliderAndProgressIndicatorScreenState();
}

class _SliderAndProgressIndicatorScreenState
    extends State<SliderAndProgressIndicatorScreen> {
  double _horizontalSliderValue = 0.5;
  double _verticalSliderValue = 0.5;
  RangeValues _rangeSliderValues = const RangeValues(20, 80);
  double _linearProgressValue = 0.0;
  double _circularProgressValue = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startProgressIndicators();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startProgressIndicators() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        _linearProgressValue += 0.01;
        _circularProgressValue += 0.01;
        if (_linearProgressValue > 1.0) _linearProgressValue = 0.0;
        if (_circularProgressValue > 1.0) _circularProgressValue = 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double cardPadding = width > 800 ? 8.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sliders and Progress Indicators",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CommonColor.primaryColorDark,
              CommonColor.primaryColorLight
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
            child: SingleChildScrollView(
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: width > 800 ? 4 : 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                childAspectRatio: 1.1,
                children: [
                  _buildSliderCard(
                    'Horizontal Slider',
                    _buildSliderContent(_horizontalSliderValue, "Horizontal"),
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildSliderCard(
                    'Vertical Slider',
                    _buildSliderContent(_verticalSliderValue, "Vertical"),
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildSliderCard(
                    'Range Slider',
                    _buildRangeSliderContent(),
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildSliderCard(
                    'Linear Progress Indicator (With %)',
                    _buildProgressContent(_linearProgressValue, "Linear"),
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildSliderCard(
                    'Circular Progress Indicator (With %)',
                    _buildProgressContent(_circularProgressValue, "Circular"),
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildSliderCard(
                    'Spinner/Loader',
                    _buildSpinnerContent(),
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildSliderCard(
                    'Linear Progress Bar',
                    _buildProgressContentWithoutPercentage(
                        _linearProgressValue, "Linear"),
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildSliderCard(
                    'Circular Progress Indicator',
                    _buildProgressContentWithoutPercentage(
                        _circularProgressValue, "Circular"),
                    cardPadding,
                    titleFontSize,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSliderContent(double value, String type) {
    return Column(
      children: [
        Tooltip(
          message:
              "$type Slider: A slider that lets the user select a value within a range by sliding a thumb.",
          child: type == "Vertical"
              ? SizedBox(
                  height: 100,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Slider(
                      value: value,
                      onChanged: (newValue) {
                        setState(() {
                          _verticalSliderValue = newValue;
                        });
                      },
                    ),
                  ),
                )
              : Slider(
                  value: value,
                  onChanged: (newValue) {
                    setState(() {
                      _horizontalSliderValue = newValue;
                    });
                  },
                ),
        ),
        Text(
          "${(value * 100).toStringAsFixed(1)}%",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildRangeSliderContent() {
    return Column(
      children: [
        Tooltip(
          message:
              "Range Slider: A slider with two thumbs that lets the user select a range of values.",
          child: RangeSlider(
            values: _rangeSliderValues,
            min: 0,
            max: 100,
            divisions: 100,
            onChanged: (RangeValues values) {
              setState(() {
                _rangeSliderValues = values;
              });
            },
          ),
        ),
        Text(
          "Range: ${_rangeSliderValues.start.toStringAsFixed(1)} - ${_rangeSliderValues.end.toStringAsFixed(1)}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildProgressContent(double value, String type) {
    return Column(
      children: [
        SizedBox(
          height: type == "Linear" ? 10 : 40,
          width: type == "Linear" ? double.infinity : 40,
          child: type == "Linear"
              ? LinearProgressIndicator(value: value)
              : CircularProgressIndicator(value: value, strokeWidth: 3.0),
        ),
        Text(
          "${(value * 100).toStringAsFixed(1)}%",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildProgressContentWithoutPercentage(double value, String type) {
    return Column(
      children: [
        SizedBox(
          height: type == "Linear" ? 10 : 40,
          width: type == "Linear" ? double.infinity : 40,
          child: type == "Linear"
              ? LinearProgressIndicator(value: value)
              : CircularProgressIndicator(value: value, strokeWidth: 3.0),
        ),
      ],
    );
  }

  Widget _buildSpinnerContent() {
    return const Column(
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(strokeWidth: 3.0),
        ),
        Text(
          "Loading...",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSliderCard(
      String title, Widget content, double padding, double fontSize) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Expanded(child: content),
          ],
        ),
      ),
    );
  }
}
