import 'package:flutter/material.dart';

class CardAndContainerScreen extends StatefulWidget {
  const CardAndContainerScreen({super.key});

  @override
  _CardsAndContainersScreenState createState() =>
      _CardsAndContainersScreenState();
}

class _CardsAndContainersScreenState extends State<CardAndContainerScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double iconSize = width > 800 ? height * 0.06 : height * 0.05;
    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards & Containers",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RawScrollbar(
            thumbColor: Colors.blueGrey,
            thumbVisibility: true,
            thickness: 4,
            radius: const Radius.circular(8),
            child: SingleChildScrollView(
              // Added SingleChildScrollView
              child: GridView.count(
                shrinkWrap: true, // Allow grid to take only required space
                crossAxisCount: width > 1000 ? 5 : (width > 600 ? 3 : 2),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1,
                children: [
                  _buildControlCard(
                    'Basic Card',
                    Tooltip(
                      message: 'A simple card with a title and content.',
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(cardPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Basic Card',
                                  style: TextStyle(fontSize: titleFontSize)),
                              const SizedBox(height: 10),
                              const Text('This is a basic card'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    iconSize,
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildControlCard(
                    'Expandable Card',
                    Tooltip(
                      message: 'Card that can expand to show more content.',
                      child: ExpandableCard(cardPadding: cardPadding),
                    ),
                    iconSize,
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildControlCard(
                    'Collapsible Card',
                    Tooltip(
                      message: 'Card that collapses to hide content.',
                      child: CollapsibleCard(cardPadding: cardPadding),
                    ),
                    iconSize,
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildControlCard(
                    'Image Card',
                    Tooltip(
                      message: 'Card with an image and title.',
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(cardPadding),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                    'https://via.placeholder.com/150'),
                              ),
                              const SizedBox(height: 10),
                              Text('Image Card',
                                  style: TextStyle(fontSize: titleFontSize)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    iconSize,
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildControlCard(
                    'Card with Actions',
                    Tooltip(
                      message: 'Card with actions like buttons.',
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(cardPadding),
                          child: Column(
                            children: [
                              Text('Card with Actions',
                                  style: TextStyle(fontSize: titleFontSize)),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Action 1'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Action 2'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    iconSize,
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildControlCard(
                    'Widget Container',
                    Tooltip(
                      message: 'A container holding widgets.',
                      child: Container(
                        color: Colors.blueAccent,
                        padding: EdgeInsets.all(cardPadding),
                        child: const Center(child: Text('Widget Container')),
                      ),
                    ),
                    iconSize,
                    cardPadding,
                    titleFontSize,
                  ),
                  _buildControlCard(
                    'Grid Container',
                    Tooltip(
                      message: 'Container with a grid layout.',
                      child: Center(
                        child: Container(
                            padding: EdgeInsets.all(cardPadding),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      color: Colors.blue,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 30,
                                      width: 30,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ),
                    iconSize,
                    cardPadding,
                    titleFontSize,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Generic function to build control cards
  Widget _buildControlCard(String title, Widget control, double iconSize,
      double cardPadding, double titleFontSize) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: titleFontSize, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            control,
          ],
        ),
      ),
    );
  }
}

// Expandable Card
class ExpandableCard extends StatefulWidget {
  final double cardPadding;

  const ExpandableCard({super.key, required this.cardPadding});

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.cardPadding),
        child: Column(
          children: [
            const Text('Expandable Card', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            _expanded
                ? const Text('This is the expanded content of the card.')
                : Container(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
              child: Text(_expanded ? 'Collapse' : 'Expand'),
            ),
          ],
        ),
      ),
    );
  }
}

// Collapsible Card
class CollapsibleCard extends StatefulWidget {
  final double cardPadding;

  const CollapsibleCard({super.key, required this.cardPadding});

  @override
  _CollapsibleCardState createState() => _CollapsibleCardState();
}

class _CollapsibleCardState extends State<CollapsibleCard> {
  bool _collapsed = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(widget.cardPadding),
        child: Column(
          children: [
            const Text('Collapsible Card', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            _collapsed
                ? const Text('This is the collapsed content of the card.')
                : Container(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _collapsed = !_collapsed;
                });
              },
              child: Text(_collapsed ? 'Show Content' : 'Hide Content'),
            ),
          ],
        ),
      ),
    );
  }
}
