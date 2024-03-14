

class VideoPost {

  final String name;
  final String videoUrl;
  final int views;
  final int likes;

  VideoPost({ 
    required this.name,  
    required this.videoUrl,  
    this.views = 0,  
    this.likes = 0
  });


}

