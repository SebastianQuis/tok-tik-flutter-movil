import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';


class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String title;

  const FullScreenPlayer({super.key, required this.videoUrl, required this.title});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset( widget.videoUrl )
      ..setVolume(50) // ESTABLECE VOLUMEN 0
      ..setLooping(true) // ESTABLECE QUE SE REPRODUZCA AUTOMATICAMENTE
      ..play(); // INMEDIATAMENTE DA EL PLAY

    // controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        
        if( snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2,),
          );
        }

        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            }

            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                
                VideoPlayer(controller),  
                
                Positioned(
                  bottom: 30,
                  left: 10,
                  child: VideoTitle( widget.title )),
              
              ],
            ),
          ),
        );
        
      },
    );
  }
}


class VideoTitle extends StatelessWidget {
  final String title;
  const VideoTitle( this.title, {super.key} );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final styleText = Theme.of(context).textTheme.bodyLarge;
    
    return SizedBox(
      width: size.width * 0.6,
      height: 50,
      child: Text( title, maxLines: 2, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20 ) ),
    );
  }
}