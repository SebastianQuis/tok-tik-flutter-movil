import 'package:tik_tok_app/domain/entities/video_post.dart';

abstract class VideoPostDataSource {

  Future<List<VideoPost>> getFavoriteVideoByUser( String userId );


  Future<List<VideoPost>> getVideosByPage( int page );


  // ALGUN METOODO ADICIONAL
}