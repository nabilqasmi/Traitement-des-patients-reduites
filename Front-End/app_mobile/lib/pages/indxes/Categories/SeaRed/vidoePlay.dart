import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Session de soins"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(right: 20,left: 20,bottom:150,top: 40),
            child: Center(
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                onReady: () {
                  _controller.addListener(() {});
                },
              ),
            ),
          ),
          //
          Container(child: const Text("Cher patient, Cette vidéo est conçue pour vous",style: TextStyle(fontWeight: FontWeight.bold),),),
          Container(child: const Text("aider à réduire la douleur dans votre corps grâce",style: TextStyle(fontWeight: FontWeight.bold),),),
          Container(child: const Text(" à des exercices et des techniques de ",style: TextStyle(fontWeight: FontWeight.bold),),),
          Container(child: const Text("  rééducation spécifiques !",style: TextStyle(fontWeight: FontWeight.bold),),),
        ],
      ),
    );
  }
}