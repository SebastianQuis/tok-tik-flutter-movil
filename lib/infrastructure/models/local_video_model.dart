import 'dart:convert';

import 'package:tik_tok_app/domain/entities/video_post.dart';

class LocalVideoModel {
    final String name;
    final String videoUrl;
    final int likes;
    final int views;

    LocalVideoModel({
        required this.name,
        required this.videoUrl,
        this.likes = 0,
        this.views = 0,
    });

    factory LocalVideoModel.fromRawJson(String str) => LocalVideoModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    // LOGICA DE NEGOCIO, EVALUAR CADA INGRESO
    factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
        name: json["name"] ?? 'Sin título',
        videoUrl: json["videoUrl"],
        likes: json["likes"],
        views: json["views"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "videoUrl": videoUrl,
        "likes": likes,
        "views": views,
    };

  // VideoPost -- CONVERSIÓN DE DATOS -- MAPPER
  VideoPost toVideoPostEntitie() => VideoPost(
    name: name, 
    videoUrl: videoUrl,
    likes: likes,
    views: views
  );

}
