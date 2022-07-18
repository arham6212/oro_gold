import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../utils/tools.dart';

class VideoPlayerOro extends StatefulWidget {
  const VideoPlayerOro({Key? key}) : super(key: key);

  @override
  State<VideoPlayerOro> createState() => _VideoPlayerOroState();
}

class _VideoPlayerOroState extends State<VideoPlayerOro> {
  late VideoPlayerController _videoPlayerController;
  bool isShowPlaying = false;


  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }
  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/sample.mp4')
          ..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _videoPlayerController.value.isPlaying
              ? _videoPlayerController.pause()
              : _videoPlayerController.play();
        });
      },
      child: SizedBox(
        height: Tools.getDeviceHeight(context) *
            (Tools.isTablet(context) ? 0.3 : 0.2),
        width: double.infinity,
        child: Stack(
          children: [
            VideoPlayer(_videoPlayerController),
            _videoPlayerController.value.isPlaying
                ? const Offstage()
                : Center(
                    child: Icon(
                      Icons.play_arrow,
                      size: 80,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
