/*import 'dart:convert';

import 'package:app_mobile/pages/indxes/Categories/Seance_Reduction/videoDataModel.dart';
import 'package:app_mobile/pages/indxes/Categories/Seance_Reduction/ytVideoPlayerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class VideosList extends StatelessWidget {
  const VideosList({super.key});

  // Improved error handling with specific message
  Future<List<VideoDataModel>> readJsonData() async {

      final jsonData = await rootBundle.loadString('assets/JsonFile/listVideos.json');
      final list = json.decode(jsonData) as List<dynamic>;
      return list.map((e) => VideoDataModel.fromJson(e)).toList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: readJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text(
                "Error loading videos: ${data.error}",
              ),
            );
          } else if (data.hasData) {
            var items =data.data as List <VideoDataModel>;
            return ListView.builder(
              itemCount: items==null ? 0 :items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>Yt(yturl: '${items[index].videoUrl.toString()}')));
                  },
                  child: Text("Video Player"),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}*/