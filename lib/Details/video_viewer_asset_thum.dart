import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

/// [VideoViewerAssetThum] which is a  use to mEMORY Image Viewer Network
/// [Uint8List] which is a memory
/// [Function] that a click event.
/// [double] that a mHeight of image
class VideoViewerAssetThum extends StatefulWidget {
  final String? url;

  //final Function? onPressed;
  final double mHeight;

  //final Function() playDone;
  final double mWidth;
  final bool isPlay;

  const VideoViewerAssetThum({
    Key? key,
    required this.mHeight,
    this.url,
    required this.isPlay,
    required this.mWidth,
  }) : super(key: key);

  @override
  State<VideoViewerAssetThum> createState() => _VideoViewerAssetThumState();
}

class _VideoViewerAssetThumState extends State<VideoViewerAssetThum> {
  late VideoPlayerController _controller;
  bool isInitialize = false;
  @override
  void initState() {
    print('widget.url--${widget.url}');
    try {
      _controller = VideoPlayerController.network(widget.url ?? '')
        ..initialize().then((_) {
          setState(() {
            isInitialize = true;
          });

          print('isInitialize--$isInitialize');
          _controller.addListener(() {
            //custom Listner
            setState(() {
              if (!_controller.value.isPlaying &&
                  _controller.value.isInitialized &&
                  (_controller.value.duration == _controller.value.position)) {
                //checking the duration and position every time
                //widget.playDone();
              }
            });
          });
        });
    } catch (e) {
      ///
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isInitialize
        ? Stack(
            alignment: Alignment.center,
            children: [

    //
    SizedBox.expand(
      child: Transform.scale(
        // alignment: Alignment.center,
        scale: 1,
        child: Container(
          color: Colors.cyanAccent,
          width: widget.mWidth,
          height: widget.mHeight,
          child: VideoPlayer(_controller),
        ),
      ),
    ),


              // SizedBox(
              //   height: widget.mHeight,
              //   width: widget.mWidth,
              //   child: VideoPlayer(_controller),
              // ),
              Opacity(
                opacity: 0.2,
                child: Container(
                  height: widget.isPlay ? 40 : 20,
                  alignment: Alignment.center,
                  child: FloatingActionButton(
                    onPressed: null,
                    // Display the correct icon depending on the state of the player.
                    child: Icon(_controller.value.isPlaying ? Icons.stop : Icons.play_arrow),
                  ),
                ),
              ),
            ],
          )
        : Center(
            child: Container(
                height: 60.0,
                width: double.infinity,
                alignment: Alignment.center,
                child: Lottie.asset('assets/images/lottie/ic_loading_lottie.json')));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
