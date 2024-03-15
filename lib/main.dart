import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:tik_tok_app/config/theme/app_theme.dart';
import 'package:tik_tok_app/infrastructure/datasource/local_video_datasource_impl.dart';
import 'package:tik_tok_app/infrastructure/repositories/videopost_repository_impl.dart';
import 'package:tik_tok_app/presentation/providers/discover_provider.dart';
import 'package:tik_tok_app/presentation/screens/discover/discover_screen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostRepositoryImpl(
      videoPostDataSource: LocalVideoDataSourceImpl()
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DiscoverProvider(videoRepository: videoPostRepository)..loadNextPage(), lazy: false,)
      ],
      child: MaterialApp(
        title: 'Tik Tok APP',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}