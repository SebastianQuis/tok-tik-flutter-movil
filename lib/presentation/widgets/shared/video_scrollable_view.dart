import 'package:flutter/material.dart';

import 'package:tik_tok_app/domain/entities/video_post.dart';
import 'package:tik_tok_app/presentation/widgets/shared/buttons_video.dart';
import 'package:tik_tok_app/presentation/widgets/video/fullscreen_background.dart';
import 'package:tik_tok_app/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> listVideos;
  const VideoScrollableView({super.key, required this.listVideos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: listVideos.length,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, index) {
        final videoPost = listVideos[index];

        return VideoBox( videoPost );
      },
    );
  }
}


class VideoBox extends StatelessWidget {
  final VideoPost videoPost;
  const VideoBox( this.videoPost, {super.key} );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        // VIDEO - GRADIENT
        SizedBox.expand(
          child: FullScreenPlayer(
            title: videoPost.name,
            videoUrl: videoPost.videoUrl,
          )
        ),

        const FullScreenBackground(),

        // BUTTONS
        Positioned(
          bottom: 20,
          right: 10,
          child: ButtonsVideo(videoPost: videoPost))

      ],
    );
  }
}