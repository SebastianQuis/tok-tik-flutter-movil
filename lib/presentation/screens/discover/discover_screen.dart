import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:tik_tok_app/presentation/providers/discover_provider.dart';
import 'package:tik_tok_app/presentation/widgets/shared/video_scrollable_view.dart';


class DiscoverScreen extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    // READ -- SOLO QUE RENDERICE EN CASO HAYA CAMBIOS - LISTEN: FALSE
    // WATCH -- SI EN CASO SE INGRESAN NUEVOS VIDEOS AL LISTADO, SE REQUIERE QUE SE REDIBUJE

    final discoverProvider = context.watch<DiscoverProvider>();
        
    return Scaffold(
      body: discoverProvider.initialLoading
        ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
        : VideoScrollableView(listVideos: discoverProvider.listVideos,),
    );
  }
}