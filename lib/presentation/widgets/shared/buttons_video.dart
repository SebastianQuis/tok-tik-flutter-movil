import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tik_tok_app/config/helpers/numbers_formats.dart';

import 'package:tik_tok_app/domain/entities/video_post.dart';

class ButtonsVideo extends StatelessWidget {
  final VideoPost videoPost;
  
  const ButtonsVideo({super.key, required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        IconButton(
          onPressed: (){}, 
          icon: const Icon(Icons.favorite, size: 30,),
        ),
        Text(NumbersFormats.numberReadble(videoPost.likes)),

        const SizedBox(height: 20,),

        const Icon(Icons.remove_red_eye, size: 30,),
        Text(NumbersFormats.numberReadble(videoPost.views)),
    
        const SizedBox(height: 20,),
        SpinPerfect(
          infinite: true,
          duration: const Duration(seconds: 3),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.play_circle_outline, size: 30,)
          )
        ),

      ],
    );
  }
}