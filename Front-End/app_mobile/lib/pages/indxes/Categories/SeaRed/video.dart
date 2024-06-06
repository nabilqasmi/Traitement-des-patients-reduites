import 'dart:convert';
import 'package:app_mobile/AppPython.dart';
import 'package:app_mobile/pages/indxes/Categories/SeaRed/vidoePlay.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  List info = [];
  late YoutubePlayerController _controller;
  _initData() async {
    String data = await DefaultAssetBundle.of(context).loadString("assets/info.json");
    setState(() {
      info = json.decode(data);
    });
  }


  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(100, 100)),
            child: Container(
              padding: const EdgeInsets.only(top:210),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/health.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
              child:Container(
                padding: EdgeInsets.only(left: 10,top: 20),
                child: Column(
                  children: [
                    Expanded(
                        child:
                        ListView.builder(
                          itemCount: info.length,
                          itemBuilder: (_, int index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>VideoPlayerScreen(videoUrl: info[index]["videoUrl"],)
                                  )
                                );
                              },
                              child: Container(
                                height: 140,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.topRight,
                                              width: 90,
                                              height: 80,
                                              //child: Text("assets/Vid/1.jpg")
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: AssetImage("assets/Vid/${index+1}.jpg"),
                                                  fit: BoxFit.cover, // Vous pouvez ajouter d'autres paramètres ici si nécessaire
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 80,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFeaeefc),
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(info[index]["title"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
                                            Container(
                                              child: Text(info[index]["time"],style: TextStyle(color: Colors.grey[500]),),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                    )
                  ],
                ),
                ),
          )
        ],
      )/*,*/
    );
  }
}
