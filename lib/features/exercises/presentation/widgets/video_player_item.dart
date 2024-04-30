import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  const VideoPlayerItem({super.key, required this.videoAssets});
  final String videoAssets;

  @override
  VideoPlayerItemState createState() => VideoPlayerItemState();
}

class VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAssets)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : const CircularProgressIndicator(),
        ),
        Positioned(
          left: 150,
          bottom: 65,
          child: AnimatedOpacity(
            opacity: _isPlaying ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: Center(
              child: Material(
                type: MaterialType.transparency,
                child: IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 80.0,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPlaying = !_isPlaying;
                      if (_isPlaying) {
                        _controller.play();
                      } else {
                        _controller.pause();
                      }
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
