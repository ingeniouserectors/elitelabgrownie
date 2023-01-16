import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:video_player/video_player.dart';

/// [VideoViewerAsset] which is a  use to mEMORY Image Viewer Network
/// [Uint8List] which is a memory
/// [Function] that a click event.
/// [double] that a mHeight of image
class VideoViewerAsset extends StatefulWidget {
  final String? url;

  //final Function? onPressed;
  final double mHeight;

  //final Function() playDone;
  final double mWidth;
  final bool isPlay;

  const VideoViewerAsset({
    Key? key,
    required this.mHeight,
    this.url,
    required this.isPlay,
    required this.mWidth,
    required VideoPlayerController controller,
  }) : super(key: key);

  @override
  State<VideoViewerAsset> createState() => _VideoViewerAssetState();
}

class _VideoViewerAssetState extends State<VideoViewerAsset> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    try {
      _controller = VideoPlayerController.network(widget.url ?? '')
        ..initialize().then((_) {
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
          setState(() {});
          if (widget.isPlay) {
            _controller.play();
          }
        });
    } catch (e) {
      ///
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: widget.mHeight,
                width: widget.mWidth,
                child: VideoPlayer(_controller),
              ),
              Opacity(
                opacity: 0.2,
                child: Container(
                  height: widget.isPlay ? 40 : 20,
                  alignment: Alignment.center,
                  child: FloatingActionButton(
                    onPressed: () {
                      if (widget.isPlay) {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      }
                      // _controller.pause();
                      //     // moveToFullScreen();
                    },
                    //   // Display the correct icon depending on the state of the player.
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
    ;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
