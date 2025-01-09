// import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:components_automation/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:io';
// import 'package:video_player/video_player.dart';

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
  //   // Use the asset video instead of a network URL
  //   _controller = VideoPlayerController.asset('assets/bee.mp4');
  //   _initializeVideoPlayerFuture = _controller.initialize();
  //   _controller.setLooping(true); // Set the video to loop, if desired
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  File? _selectedMedia;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickMedia(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedMedia = File(pickedFile.path);
      });
    }
  }

  // AudioPlayer _audioPlayer = AudioPlayer();
  // bool _isPlaying = false;

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
      // case 'Video Player':
      //   mediaWidget = _buildVideoPlayer();
      //   break;
      // case 'Audio Player':
      //   mediaWidget = _buildAudioPlayer();
      //   break;
      case 'Media Picker':
        mediaWidget = _buildMediaPicker();
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
      'assets/asset_image.jpg',
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
    return PhotoView(
        imageProvider: const AssetImage("assets/static_image.jpg"));
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
      'assets/static_image.jpg',
      'assets/static_image.jpg',
      'assets/static_image.jpg',
      'assets/static_image.jpg',
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

  // Widget _buildVideoPlayer() {
  //   return const Text("Failed to load video");
  // }

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

  // Widget _buildAudioPlayer() {
  //   return Container(
  //     height: 100,
  //     color: Colors.blueAccent,
  //     child: const Center(child: Text('Audio Player Placeholder')),
  //   );
  // }

  // Widget _buildAudioPlayer() {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       Container(
  //         height: 100,
  //         color: Colors.blueAccent,
  //         child: const Center(child: Text('Audio Player')),
  //       ),
  //       const SizedBox(height: 20),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           ElevatedButton(
  //             onPressed: () async {
  //               if (!_isPlaying) {
  //                 await _audioPlayer.play(AssetSource('assets/audio.mp3'));
  //                 setState(() {
  //                   _isPlaying = true;
  //                 });
  //               }
  //             },
  //             child: const Text('Play'),
  //           ),
  //           const SizedBox(width: 10),
  //           ElevatedButton(
  //             onPressed: () async {
  //               await _audioPlayer.stop();
  //               setState(() {
  //                 _isPlaying = false;
  //               });
  //             },
  //             child: const Text('Stop'),
  //           ),
  //           const SizedBox(width: 10),
  //           ElevatedButton(
  //             onPressed: () async {
  //               await _audioPlayer.resume();
  //               setState(() {
  //                 _isPlaying = true;
  //               });
  //             },
  //             child: const Text('Restart'),
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }

  Widget _buildMediaPicker() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (_selectedMedia != null)
          Image.file(
            _selectedMedia!,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          )
        else
          const Text(
            'No media selected',
            style: TextStyle(fontSize: 16),
          ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => _pickMedia(ImageSource.camera),
              icon: const Icon(Icons.camera_alt),
              label: const Text('Camera'),
            ),
            const SizedBox(width: 10),
            ElevatedButton.icon(
              onPressed: () => _pickMedia(ImageSource.gallery),
              icon: const Icon(Icons.photo_library),
              label: const Text('Gallery'),
            ),
          ],
        ),
      ],
    );
  }
}
