
import 'package:tik_tok_app/domain/datasource/video_post_datasource.dart';
import 'package:tik_tok_app/domain/entities/video_post.dart';
import 'package:tik_tok_app/domain/repositories/video_post_repository.dart';

class VideoPostRepositoryImpl implements VideoPostRepository{
  
  final VideoPostDataSource videoPostDataSource;

  VideoPostRepositoryImpl({ required this.videoPostDataSource});
 
   
  @override
  Future<List<VideoPost>> getFavoriteVideoByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getVideosByPage(int page) {
    return videoPostDataSource.getVideosByPage(page);
  }

}

