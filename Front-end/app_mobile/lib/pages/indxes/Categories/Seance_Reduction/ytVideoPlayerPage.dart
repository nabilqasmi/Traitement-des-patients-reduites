import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Yt extends StatefulWidget {
  String yturl;

   Yt({super.key,required this.yturl});

  @override
  State<Yt> createState() => _YtState();
}

class _YtState extends State<Yt> {
  YoutubePlayerController? _ytController;
  String? videoId;

  @override
  void initState() {
    super.initState();
    videoId=YoutubePlayer.convertUrlToId(widget.yturl);
    _ytController=YoutubePlayerController(
        initialVideoId: videoId!,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: YoutubePlayer(controller: _ytController!)
      ),
    );
  }
}
