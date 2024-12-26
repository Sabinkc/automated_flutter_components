
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
                  _buildSliderCard(
                    'Customized Linear Progress Bar',
                    _buildCustomizedLinearProgressBar(_linearProgressValue),
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildSliderCard(
                    'Customized Circular Progress Indicator',
                    _buildCustomizedCircularProgressIndicator(
                        _circularProgressValue),
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

  Widget _buildCustomizedLinearProgressBar(double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Tooltip(
          message: "Customized Linear Progress Bar",
          child: Container(
            height: 14.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey[300], // Background color
            ),
            child: Stack(
              children: [
                // Gradient progress container
                Positioned.fill(
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: value, // Controls the width based on value
                    child: Container(
                      height: 14.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        gradient: const LinearGradient(
                          colors: [Colors.red, Colors.yellow],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCustomizedCircularProgressIndicator(double value) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
          value: 1.0,
          strokeWidth: 6.0,
          valueColor: AlwaysStoppedAnimation(Colors.grey[300]),
        ),
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Colors.red, Colors.yellow],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: Container(
            decoration: BoxDecoration(
                color: CommonColor.primaryColor,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(10),
            child: CircularProgressIndicator(
              value: value,
              strokeWidth: 6.0,
              backgroundColor: Colors.transparent,
              valueColor: const AlwaysStoppedAnimation(Colors.white), // Placeholder
            ),
          ),
        ),
      ],
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
