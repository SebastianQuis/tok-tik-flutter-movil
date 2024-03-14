import 'package:flutter/material.dart';
import 'package:tik_tok_app/domain/entities/video_post.dart';
import 'package:tik_tok_app/infrastructure/models/local_video_model.dart';
import 'package:tik_tok_app/shared/data/local_video_post.dart';

class DiscoverProvider extends ChangeNotifier {

  bool initialLoading = true;
  List<VideoPost> listVideos = [];


  // TODO: REPOSITORY, DATASOURCE
  Future<void> loadNextPage() async {
    await Future.delayed( const Duration(seconds: 2));
    final List<VideoPost> listVideoPost = videoPosts.map(
      (video) => LocalVideoModel.fromJson(video).toVideoPostEntitie()) // toVideoPostEntitie para castear a VideoPost
      .toList();

    listVideos.addAll(listVideoPost);
    initialLoading = false;
    notifyListeners();
  }






}

