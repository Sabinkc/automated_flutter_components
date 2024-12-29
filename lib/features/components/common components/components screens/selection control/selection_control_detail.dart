import 'package:components_automation/core/constants.dart';

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:flutter/cupertino.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({super.key});

  @override
  State<CheckboxScreen> createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  // List of items for the checkbox selection
  final List<Map<String, dynamic>> _items = [
    {"name": "Option 1", "isChecked": false},
    {"name": "Option 2", "isChecked": false},
    {"name": "Option 3", "isChecked": false},
    {"name": "Option 4", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkbox selection",
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
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(_items[index]['name']),
              value: _items[index]['isChecked'],
              onChanged: (value) {
                setState(() {
                  _items[index]['isChecked'] = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Get selected items
            final selectedItems = _items
                .where((item) => item['isChecked'])
                .map((item) => item['name'])
                .toList();

            // Display selected items in a dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Selected Items"),
                content: Text(
                  selectedItems.isNotEmpty
                      ? selectedItems.join(", ")
                      : "No items selected.",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          },
          child: const Text("Show Selected Items"),
        ),
      ),
    );
  }
}

class RadioButtonScreen extends StatefulWidget {
  const RadioButtonScreen({super.key});

  @override
  State<RadioButtonScreen> createState() => _RadioButtonScreenState();
}

class _RadioButtonScreenState extends State<RadioButtonScreen> {
  // List of items for the radio button selection
  final List<String> _options = [
    "Option 1",
    "Option 2",
    "Option 3",
    "Option 4"
  ];

  // Variable to store the currently selected option
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radio Button Selection",
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
        child: ListView.builder(
          itemCount: _options.length,
          itemBuilder: (context, index) {
            return RadioListTile<String>(
              title: Text(_options[index]),
              value: _options[index],
              groupValue: _selectedOption,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Display the selected option in a dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Selected Option"),
                content: Text(
                  _selectedOption != null
                      ? "You selected: $_selectedOption"
                      : "No option selected.",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          },
          child: const Text("Show Selected Option"),
        ),
      ),
    );
  }
}

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  // List of items for the switch toggle
  final List<Map<String, dynamic>> _items = [
    {"name": "Switch 1", "isOn": false},
    {"name": "Switch 2", "isOn": false},
    {"name": "Switch 3", "isOn": false},
    {"name": "Switch 4", "isOn": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch Toggle Demo",
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
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return SwitchListTile(
              title: Text(_items[index]['name']),
              value: _items[index]['isOn'],
              onChanged: (value) {
                setState(() {
                  _items[index]['isOn'] = value;
                });
              },
              secondary: const Icon(Icons.power_settings_new),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Get the status of each switch
            final switchesStatus = _items
                .map(
                    (item) => "${item['name']}: ${item['isOn'] ? "On" : "Off"}")
                .toList()
                .join("\n");

            // Display the switches' status in a dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Switch Status"),
                content: Text(switchesStatus),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          },
          child: const Text("Show Switch Status"),
        ),
      ),
    );
  }
}

class RangeSliderScreen extends StatefulWidget {
  const RangeSliderScreen({super.key});

  @override
  State<RangeSliderScreen> createState() => _RangeSliderScreenState();
}

class _RangeSliderScreenState extends State<RangeSliderScreen> {
  // Initial range values
  RangeValues _currentRange = const RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Range Slider Demo",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Adjust the range slider below:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            RangeSlider(
              values: _currentRange,
              min: 0,
              max: 100,
              divisions: 20,
              labels: RangeLabels(
                _currentRange.start.round().toString(),
                _currentRange.end.round().toString(),
              ),
              onChanged: (RangeValues newRange) {
                setState(() {
                  _currentRange = newRange;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              "Selected Range: ${_currentRange.start.round()} - ${_currentRange.end.round()}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Display selected range in a dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Selected Range"),
                content: Text(
                  "You selected a range from ${_currentRange.start.round()} to ${_currentRange.end.round()}",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          },
          child: const Text("Show Selected Range"),
        ),
      ),
    );
  }
}

class DropdownScreen extends StatefulWidget {
  const DropdownScreen({super.key});

  @override
  State<DropdownScreen> createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  // Initial selected value
  String _selectedValue = 'Option 1';

  // List of dropdown items
  final List<String> _dropdownItems = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown Selection Demo",
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select an option from the dropdown:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: _selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue = newValue!;
                  });
                },
                items: _dropdownItems
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Text(
                "Selected Option: $_selectedValue",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Display selected option in a dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Selected Option"),
                content: Text(
                  "You selected: $_selectedValue",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          },
          child: const Text("Show Selected Option"),
        ),
      ),
    );
  }
}

class MultiSelectDropdownScreen extends StatefulWidget {
  const MultiSelectDropdownScreen({super.key});

  @override
  State<MultiSelectDropdownScreen> createState() =>
      _MultiSelectDropdownScreenState();
}

class _MultiSelectDropdownScreenState extends State<MultiSelectDropdownScreen> {
  // List of items for the multi-select dropdown
  final List<String> _dropdownItems = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5'
  ];

  // List to hold selected values
  List<String> _selectedValues = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MultiSelect Dropdown Demo",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Select multiple options from the dropdown:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            MultiSelectDialogField(
              items: _dropdownItems
                  .map((item) => MultiSelectItem<String>(item, item))
                  .toList(),
              title: const Text("Select Options"),
              selectedColor: Colors.teal,
              buttonText: const Text("Select Options"),
              onConfirm: (values) {
                setState(() {
                  _selectedValues = values.cast<String>();
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              "Selected Options: ${_selectedValues.join(', ')}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Display selected options in a dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Selected Options"),
                content: Text(
                  "You selected: ${_selectedValues.join(', ')}",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          },
          child: const Text("Show Selected Options"),
        ),
      ),
    );
  }
}

class SegmentedControlScreen extends StatefulWidget {
  const SegmentedControlScreen({super.key});

  @override
  State<SegmentedControlScreen> createState() => _SegmentedControlScreenState();
}

class _SegmentedControlScreenState extends State<SegmentedControlScreen> {
  // Selected value for segmented control
  int _selectedIndex = 0;

  // List of segments
  final Map<int, Widget> _segments = {
    0: const Text('Segment 1'),
    1: const Text('Segment 2'),
    2: const Text('Segment 3'),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segmented Control Demo",
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select a segment below:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              CupertinoSegmentedControl<int>(
                padding: const EdgeInsets.all(10),
                children: _segments,
                onValueChanged: (int value) {
                  setState(() {
                    _selectedIndex = value;
                  });
                },
                groupValue: _selectedIndex,
              ),
              const SizedBox(height: 20),
              Text(
                "Selected Segment: Segment ${_selectedIndex + 1}",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Display selected segment in a dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Selected Segment"),
                content: Text(
                  "You selected: Segment ${_selectedIndex + 1}",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          },
          child: const Text("Show Selected Segment"),
        ),
      ),
    );
  }
}

class ChipSelectionScreen extends StatefulWidget {
  const ChipSelectionScreen({super.key});

  @override
  State<ChipSelectionScreen> createState() => _ChipSelectionScreenState();
}

class _ChipSelectionScreenState extends State<ChipSelectionScreen> {
  // List to store selected chips
  List<String> _selectedChips = [];

  // List of available chips
  final List<String> _chipOptions = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chip Selection Demo",
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select chips below:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Wrap(
                spacing: 10.0, // space between chips
                runSpacing: 10.0, // space between rows
                children: _chipOptions.map((chip) {
                  return ChoiceChip(
                    label: Text(chip),
                    selected: _selectedChips.contains(chip),
                    onSelected: (isSelected) {
                      setState(() {
                        if (isSelected) {
                          _selectedChips.add(chip);
                        } else {
                          _selectedChips.remove(chip);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Text(
                "Selected Chips: ${_selectedChips.join(', ')}",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Display selected chips in a dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Selected Chips"),
                content: Text(
                  "You selected: ${_selectedChips.join(', ')}",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          },
          child: const Text("Show Selected Chips"),
        ),
      ),
    );
  }
}

class StepperScreen extends StatefulWidget {
  const StepperScreen({super.key});

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  // Current step index
  int _currentStep = 0;

  // Steps content
  List<Step> _steps = [
    Step(
      title: const Text('Step 1: Personal Details'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Enter your name, email, and other personal details.'),
          // Add relevant form fields here
        ],
      ),
      isActive: true,
    ),
    Step(
      title: const Text('Step 2: Address'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Provide your address details.'),
          // Add address form fields here
        ],
      ),
      isActive: true,
    ),
    Step(
      title: const Text('Step 3: Confirmation'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Review your details and submit the form.'),
          // Add a review section or confirmation info here
        ],
      ),
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Stepper Demo", style: TextStyle(color: Colors.white)),
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
            const Text(
              "Step through the form below:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Stepper(
              currentStep: _currentStep,
              onStepTapped: (step) {
                setState(() {
                  _currentStep = step;
                });
              },
              onStepContinue: () {
                if (_currentStep < _steps.length - 1) {
                  setState(() {
                    _currentStep++;
                  });
                }
              },
              onStepCancel: () {
                if (_currentStep > 0) {
                  setState(() {
                    _currentStep--;
                  });
                }
              },
              steps: _steps,
            ),
            const SizedBox(height: 20),
            Text(
              "Current Step: ${_currentStep + 1}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Display the final step confirmation in a dialog
            if (_currentStep == _steps.length - 1) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Form Submitted"),
                  content: const Text("You have completed all the steps!"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            }
          },
          child: const Text("Submit Form"),
        ),
      ),
    );
  }
}

class PopMenuScreen extends StatefulWidget {
  const PopMenuScreen({super.key});

  @override
  State<PopMenuScreen> createState() => _PopMenuScreenState();
}

class _PopMenuScreenState extends State<PopMenuScreen> {
  String _selectedOption = 'None'; // Store selected option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popup Menu Demo",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (String value) {
              setState(() {
                _selectedOption = value; // Update the selected option
              });
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<String>(
                  value: 'Option 1',
                  child: Text('Option 1'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 2',
                  child: Text('Option 2'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 3',
                  child: Text('Option 3'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 4',
                  child: Text('Option 4'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Select an option from the menu:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                "Selected Option: $_selectedOption",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Display selected option in a dialog
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Selected Option"),
                content: Text(
                  "You selected: $_selectedOption",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("OK"),
                  ),
                ],
              ),
            );
          },
          child: const Text("Show Selected Option"),
        ),
      ),
    );
  }
}

class GestureSelectionScreen extends StatefulWidget {
  const GestureSelectionScreen({super.key});

  @override
  State<GestureSelectionScreen> createState() => _GestureSelectionScreenState();
}

class _GestureSelectionScreenState extends State<GestureSelectionScreen> {
  String _selectedGesture = 'None'; // Store selected gesture

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Selection Demo",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Use gestures to select an option:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedGesture = 'Tap';
                });
                _showSelectionDialog('Tap');
              },
              onDoubleTap: () {
                setState(() {
                  _selectedGesture = 'Double Tap';
                });
                _showSelectionDialog('Double Tap');
              },
              onLongPress: () {
                setState(() {
                  _selectedGesture = 'Long Press';
                });
                _showSelectionDialog('Long Press');
              },
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.teal, width: 2),
                ),
                child: Center(
                  child: Text(
                    "Perform a Gesture\n(Tap, Double Tap, Long Press)",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Selected Gesture: $_selectedGesture",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            _showSelectionDialog(_selectedGesture);
          },
          child: const Text("Show Selected Gesture"),
        ),
      ),
    );
  }

  void _showSelectionDialog(String gesture) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Selected Gesture"),
        content: Text(
          "You selected: $gesture",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
