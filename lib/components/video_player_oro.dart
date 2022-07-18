import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../utils/tools.dart';

class VideoPlayerOro extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  const VideoPlayerOro({Key? key, required this.videoPlayerController}) : super(key: key);

  @override
  State<VideoPlayerOro> createState() => _VideoPlayerOroState();
}

class _VideoPlayerOroState extends State<VideoPlayerOro> {
   bool isShowPlaying = false;



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.videoPlayerController.value.isPlaying
              ? widget.videoPlayerController.pause()
              : widget.videoPlayerController.play();
        });
      },
      child: SizedBox(
        height: Tools.getDeviceHeight(context) *
            (Tools.isTablet(context) ? 0.3 : 0.2),
        width: double.infinity,
        child: Stack(
          children: [
            VideoPlayer(widget.videoPlayerController),
            widget.videoPlayerController.value.isPlaying
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
