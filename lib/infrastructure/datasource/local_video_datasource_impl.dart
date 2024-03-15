
import 'package:tik_tok_app/domain/datasource/video_post_datasource.dart';
import 'package:tik_tok_app/domain/entities/video_post.dart';
import 'package:tik_tok_app/infrastructure/models/local_video_model.dart';
import 'package:tik_tok_app/shared/data/local_video_post.dart';

class LocalVideoDataSourceImpl implements VideoPostDataSource {

  @override
  Future<List<VideoPost>> getFavoriteVideoByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getVideosByPage(int page) async {
    await Future.delayed( const Duration(seconds: 1));

    final List<VideoPost> listVideoPost = videoPosts.map(
      (video) => LocalVideoModel.fromJson(video).toVideoPostEntitie()) // toVideoPostEntitie para castear a VideoPost
      .toList();
      
    return listVideoPost;
  }

}

