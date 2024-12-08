import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';

class ImagesAndMediaScreen extends StatefulWidget {
  const ImagesAndMediaScreen({super.key});

  @override
  _ImageAndMediaScreenState createState() => _ImageAndMediaScreenState();
}

class _ImageAndMediaScreenState extends State<ImagesAndMediaScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double cardPadding = width > 800 ? 6.0 : 12.0;
    double titleFontSize = width > 800 ? 18 : 16;

    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Image & Media", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: CommonColor.primaryColor ?? Colors.blueGrey,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade800, Colors.blueGrey.shade300],
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
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: width > 1000 ? 5 : (width > 600 ? 3 : 2),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 1,
                children: [
                  _buildMediaCard(
                    'Static Image',
                    Icons.image,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Displays a single static image without interaction.',
                  ),
                  _buildMediaCard(
                    'Asset Image',
                    Icons.image,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Displays a static image from the project assets.',
                  ),
                  _buildMediaCard(
                    'Network Image',
                    Icons.wifi,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Loads and displays an image from the internet.',
                  ),
                  _buildMediaCard(
                    'Image with Lazy Loading',
                    Icons.downloading,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Loads images on demand to save resources and improve performance.',
                  ),
                  _buildMediaCard(
                    'Lightbox Viewer',
                    Icons.lightbulb,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Opens images in a full-screen overlay with zoom and swipe capabilities.',
                  ),
                  _buildMediaCard(
                    'Image Gallery',
                    Icons.image,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Displays a collection of images in a grid format.',
                  ),
                  _buildMediaCard(
                    'Carousel Slider',
                    Icons.slideshow,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Displays a collection of images in a horizontally scrollable slider.',
                  ),
                  _buildMediaCard(
                    'Video Player',
                    Icons.videocam,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Plays videos with controls for play, pause, and volume.',
                  ),
                  _buildMediaCard(
                    'Audio Player',
                    Icons.audiotrack,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Plays audio files with support for playlists.',
                  ),
                  _buildMediaCard(
                    'Media Picker',
                    Icons.photo_library,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Selects images, videos, or audio from the device storage.',
                  ),
                  _buildMediaCard(
                    'Draggable Image Viewer',
                    Icons.open_with,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Allows users to drag, zoom, and rotate images interactively.',
                  ),
                  _buildMediaCard(
                    'Panoramic Image',
                    Icons.panorama_horizontal,
                    cardPadding,
                    titleFontSize,
                    context,
                    'Allows viewing a 360° panoramic image interactively.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build media cards with tooltips
  Widget _buildMediaCard(String title, IconData icon, double cardPadding,
      double titleFontSize, BuildContext context, String tooltipMessage) {
    return Tooltip(
      message: tooltipMessage, // Tooltip message explaining the media feature
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: InkWell(
          onTap: () {
            // Placeholder for navigation logic
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$title selected!')),
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
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
