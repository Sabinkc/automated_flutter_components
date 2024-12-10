import 'package:carousel_slider/carousel_slider.dart';
import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:video_player/video_player.dart';

class ImageAndMediaDetailScreen extends StatefulWidget {
  final String title;
  final IconData icon;
  // final String videoUrl =
  //     "https://archive.org/details/ssscap.net-download-43/ssscap.net_download+(44).mp4";

  const ImageAndMediaDetailScreen(
      {super.key, required this.title, required this.icon});

  @override
  State<ImageAndMediaDetailScreen> createState() =>
      _ImageAndMediaDetailScreenState();
}

class _ImageAndMediaDetailScreenState extends State<ImageAndMediaDetailScreen> {
  // late VideoPlayerController _controller;
  // late Future<void> _initializeVideoPlayerFuture;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.networkUrl(Uri.parse(
  //       "https://archive.org/details/ssscap.net-download-43/ssscap.net_download+(44).mp4"));
  //   _initializeVideoPlayerFuture = _controller.initialize();
  //   _controller.setLooping(true); // Set the video to loop, if desired
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    Widget mediaWidget;

    // Render the appropriate chart or media widget based on the title
    switch (widget.title) {
      case 'Static Image':
        mediaWidget = _buildStaticImage();
        break;
      case 'Asset Image':
        mediaWidget = _buildAssetImage();
        break;
      case 'Network Image':
        mediaWidget = _buildNetworkImage();
        break;
      case 'Image with Lazy Loading':
        mediaWidget = _buildLazyLoadingImage();
        break;
      case 'Lightbox Viewer':
        mediaWidget = _buildLightboxViewer();
        break;
      case 'Image Gallery':
        mediaWidget = _buildImageGallery();
        break;
      case 'Carousel Slider':
        mediaWidget = _buildCarouselSlider();
        break;
      case 'Video Player':
        mediaWidget = _buildVideoPlayer();
        break;
      case 'Audio Player':
        mediaWidget = _buildAudioPlayer();
        break;
      case 'Media Picker':
        mediaWidget = _buildMediaPicker();
        break;
      case 'Draggable Image Viewer':
        mediaWidget = _buildDraggableImageViewer();
        break;
      case 'Panoramic Image':
        mediaWidget = _buildPanoramicImage();
        break;
      default:
        mediaWidget = const Text('Media not available.');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
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
          child: mediaWidget,
        ),
      ),
    );
  }

  // Static Image Widget with error handling
  Widget _buildStaticImage() {
    return Image.asset(
      'assets/static_image.jpg',
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Text('Failed to load static image.'));
      },
    );
  }

  // Asset Image Widget with error handling
  Widget _buildAssetImage() {
    return Image.asset(
      'assets/static_image.jpg',
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Text('Failed to load asset image.'));
      },
    );
  }

  // Network Image Widget with error handling
  Widget _buildNetworkImage() {
    return Image.network(
      'https://images.unsplash.com/photo-1728327511538-e9624254ed84?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyMnx8fGVufDB8fHx8fA%3D%3D',
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Text('Failed to load network image.'));
      },
    );
  }

  Widget _buildLazyLoadingImage() {
    // List of 20 asset image paths for lazy loading
    final List<String> imagePaths = List.generate(
      20,
      (index) =>
          'assets/static_image.jpg', // Assuming you have asset images named asset_image0.jpg, asset_image1.jpg, etc.
    );

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust the number of columns in the grid
        crossAxisSpacing: 8.0, // Spacing between columns
        mainAxisSpacing: 8.0, // Spacing between rows
      ),
      itemCount: imagePaths.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            // Simulate lazy loading with a delay (for demonstration purposes)
            future: Future.delayed(
                const Duration(milliseconds: 800), () => imagePaths[index]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child:
                        CircularProgressIndicator()); // Show a loading spinner
              } else if (snapshot.hasError) {
                return const Center(child: Text('Failed to load image.'));
              } else {
                return Image.asset(
                  snapshot.data as String,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Text('Failed to load image.'));
                  },
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildLightboxViewer() {
    return PhotoView(imageProvider: const AssetImage("Assets/static_image.jpg"));
  }

  Widget _buildImageGallery() {
    // List of asset image paths
    final List<String> imagePaths = List.generate(
      20,
      (index) => 'assets/static_image.jpg', // Asset image paths
    );

    return Builder(builder: (context) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600
              ? 5
              : 2, // Number of images per row
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePaths[index],
              fit: BoxFit.cover, // Fit the image within the grid cell
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Text('Failed to load image.'));
              },
            ),
          );
        },
      );
    });
  }

  Widget _buildCarouselSlider() {
    // List of asset image paths for the carousel slider
    final List<String> imageUrls = [
      'Assets/static_image.jpg',
      'Assets/static_image.jpg',
      'Assets/static_image.jpg',
      'Assets/static_image.jpg',
      // Add more image paths here
    ];

    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      itemBuilder: (context, index, realIndex) {
        return Image.asset(
          imageUrls[index],
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Text('Failed to load carousel image.'));
          },
        );
      },
      options: CarouselOptions(
        height: 400.0, // Set the height of the carousel
        autoPlay: true, // Enable auto-play
        enlargeCenterPage: true, // Enlarge the center page for effect
        aspectRatio: 16 / 9, // Aspect ratio of the carousel images
        viewportFraction:
            0.7, // Adjusted to show half of the previous and next images
        enableInfiniteScroll: true, // Allow infinite scrolling
      ),
    );
  }

  Widget _buildVideoPlayer() {
    return const Text("Failed to load video");
  }

  // Widget _buildVideoPlayer() {
  //   return Center(
  //     child: FutureBuilder(
  //       future: _initializeVideoPlayerFuture,
  //       builder: (context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.done) {
  //           // Once the video is initialized, display it
  //           return AspectRatio(
  //             aspectRatio: _controller.value.aspectRatio,
  //             child: VideoPlayer(_controller),
  //           );
  //         } else if (snapshot.hasError) {
  //           // Show an error message if initialization failed
  //           return Center(
  //               child: Text('Failed to load video: ${snapshot.error}'));
  //         } else {
  //           // While loading, display a loading spinner
  //           return const Center(child: CircularProgressIndicator());
  //         }
  //       },
  //     ),
  //   );
  // }

  Widget _buildAudioPlayer() {
    return Container(
      height: 100,
      color: Colors.blueAccent,
      child: const Center(child: Text('Audio Player Placeholder')),
    );
  }

  // Media Picker with error handling
  Widget _buildMediaPicker() {
    return const Column(
      children: [
        Text('Select Media Placeholder'),
        Icon(Icons.add_a_photo),
      ],
    );
  }

  Widget _buildDraggableImageViewer() {
    double xPosition = 0.0;
    double yPosition = 0.0;

    return GestureDetector(
      onPanUpdate: (details) {
        // Update position with drag delta
        xPosition += details.primaryDelta!; // For mobile and web dragging
        yPosition += details.primaryDelta!; // For mobile and web dragging
      },
      child: MouseRegion(
        onEnter: (_) {
          print("Mouse Entered");
        },
        child: Stack(
          children: [
            Positioned(
              left: xPosition,
              top: yPosition,
              child: Image.network(
                'https://images.unsplash.com/photo-1728327511538-e9624254ed84?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyMnx8fGVufDB8fHx8fA%3D%3D',
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                      child: Text('Failed to load draggable image.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Panoramic Image Viewer with error handling
  Widget _buildPanoramicImage() {
    return Image.network(
      'https://images.unsplash.com/photo-1728327511538-e9624254ed84?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyMnx8fGVufDB8fHx8fA%3D%3D',
      errorBuilder: (context, error, stackTrace) {
        return const Center(child: Text('Failed to load panoramic image.'));
      },
    );
  }
}
