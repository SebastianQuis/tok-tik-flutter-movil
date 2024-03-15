import 'package:flutter/material.dart';

import 'package:tik_tok_app/domain/entities/video_post.dart';
import 'package:tik_tok_app/infrastructure/repositories/videopost_repository_impl.dart';

class DiscoverProvider extends ChangeNotifier {

  final VideoPostRepositoryImpl videoRepository;

  bool initialLoading = true;
  List<VideoPost> listVideos = [];

  DiscoverProvider({
    required this.videoRepository
  });


  // TODO: REPOSITORY, DATASOURCE
  Future<void> loadNextPage() async {
    // await Future.delayed( const Duration(seconds: 2));
    // final List<VideoPost> listVideoPost = videoPosts.map(
    //   (video) => LocalVideoModel.fromJson(video).toVideoPostEntitie()) // toVideoPostEntitie para castear a VideoPost
    //   .toList();
    final List<VideoPost> listVideoPost = await videoRepository.getVideosByPage(1);

    listVideos.addAll(listVideoPost);
    initialLoading = false;
    notifyListeners();
  }






}

