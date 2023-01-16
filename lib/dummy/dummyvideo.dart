import 'package:flutter/material.dart';
import 'package:native_video_view/native_video_view.dart';


class Nativevideoplay extends StatefulWidget {
  const Nativevideoplay({Key? key}) : super(key: key);

  @override
  _NativevideoplayState createState() => _NativevideoplayState();
}

class _NativevideoplayState extends State<Nativevideoplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: _buildVideoPlayerWidget(),
    );
  }

  Widget _buildVideoPlayerWidget() {
    return Container(
      alignment: Alignment.center,
      child: NativeVideoView(
        keepAspectRatio: true,
        showMediaController: true,
        enableVolumeControl: true,
        onCreated: (controller) {
          controller.setVideoSource(
            'https://www.overnightmountings.com/gemfind/library/Images_And_Videos/50774-E/50774-E.video.rose.mp4',
            sourceType: VideoSourceType.network,
            requestAudioFocus: true,
          );
        },
        onPrepared: (controller, info) {
          debugPrint('NativeVideoView: Video prepared');
          controller.play();
        },
        onError: (controller, what, extra, message) {
          debugPrint(
              'NativeVideoView: Player Error ($what | $extra | $message)');
        },
        onCompletion: (controller) {
          debugPrint('NativeVideoView: Video completed');
        },
      ),
    );
  }
}