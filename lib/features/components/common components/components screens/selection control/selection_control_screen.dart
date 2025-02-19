import 'package:components_automation/features/components/common%20components/components%20screens/selection%20control/selection_control_detail.dart';
import 'package:flutter/material.dart';
import 'package:components_automation/core/constants.dart';

class SelectionControlScreen extends StatefulWidget {
  const SelectionControlScreen({super.key});

  @override
  _SelectionControlState createState() => _SelectionControlState();
}

class _SelectionControlState extends State<SelectionControlScreen> {
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
        title: const Text("Selection controls",
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
      body: Semantics(
        button: true,
        child: Container(
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
                  buildSelectionControl(
                    'Check box',
                    Icons.check_box,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Select multiple options',
                    const CheckboxScreen(),
                  ),
                  buildSelectionControl(
                    'Radio button',
                    Icons.radio_button_checked,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Select one option from a group',
                    const RadioButtonScreen(),
                  ),
                  buildSelectionControl(
                    'Switch',
                    Icons.toggle_on,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Toggle between ON and OFF states',
                    const SwitchScreen(),
                  ),
                  buildSelectionControl(
                    'Range slider',
                    Icons.tune,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Select a range of values',
                    const RangeSliderScreen(),
                  ),
                  buildSelectionControl(
                    'Dropdown',
                    Icons.arrow_drop_down,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Select one option from a dropdown list',
                    const DropdownScreen(),
                  ),
                  buildSelectionControl(
                    'Multiselect dropdown',
                    Icons.arrow_drop_down_circle,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Select multiple options from a dropdown list',
                    const MultiSelectDropdownScreen(),
                  ),
                  buildSelectionControl(
                    'Segmented control',
                    Icons.view_array,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Switch between multiple views',
                    const SegmentedControlScreen(),
                  ),
                  buildSelectionControl(
                    'Chip selection',
                    Icons.label,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Select options using chips',
                    const ChipSelectionScreen(),
                  ),
                  buildSelectionControl(
                    'Stepper',
                    Icons.format_list_numbered,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Move through steps in a process',
                    const StepperScreen(),
                  ),
                  buildSelectionControl(
                    'Popup menu',
                    Icons.more_vert,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Show options in a popup menu',
                    const PopMenuScreen(),
                  ),
                  buildSelectionControl(
                    'Gesture-based selection',
                    Icons.gesture,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Select options using gestures',
                    const GestureSelectionScreen(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSelectionControl(
    String title,
    IconData icon,
    double cardPadding,
    double titleFontSize,
    BuildContext context,
    String tooltipMessage,
    Widget navigationScreen,
  ) {
    return Tooltip(
      margin: const EdgeInsets.only(top: 20),
      message: tooltipMessage,
      child: Semantics(
        button: true,
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
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => navigationScreen,
                        ),
                      );
                    },
                    icon: Icon(icon, size: 50, color: Colors.blueAccent),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => navigationScreen,
                        ),
                      );
                    },
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
