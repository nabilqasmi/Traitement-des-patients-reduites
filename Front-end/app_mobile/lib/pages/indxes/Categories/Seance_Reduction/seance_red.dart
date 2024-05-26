
import 'package:app_mobile/pages/indxes/Categories/Seance_Reduction/ytVideoPlayerPage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

import 'listVideos.dart';

class SeanceRed extends StatefulWidget {
  const SeanceRed({super.key});

  @override
  State<SeanceRed> createState() => _SeanceRedState();
}

class _SeanceRedState extends State<SeanceRed> {

  ListvIdeos list= new ListvIdeos();
  YoutubePlayerController _ytconrol=YoutubePlayerController(
      initialVideoId: "K0LS_pYjrDw",
      flags: YoutubePlayerFlags(autoPlay: false,mute:true)
  );

  /*Future<List<VideoDataModel>> readJsonData() async {

    final jsonData = await rootBundle.loadString('assets/JsonFile/listVideos.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => VideoDataModel.fromJson(e)).toList();

  }*/
  /*
  * final user = jsonDecode(jsonString) as Map<String, dynamic>;

print('Howdy, ${user['name']}!');
print('We sent the verification link to ${user['email']}.');
  *
  * */
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(list.getList()[0])!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }
  String? valueChoose;
  List listItem=[
    "Item 1", "Item 2","Item 3"
  ];

  var item;
  String SelectVideo(String value){
      return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Seance de reduction')
        ),
        body: Center(
          child: Stack(
            children: [
              Container(
                alignment: Alignment(0.8,-1),
                child: Container(
                  child: DropdownButton(
                    value: valueChoose,
                    onChanged: (newValue){
                      setState(() {
                        valueChoose=newValue;
                      });
                    },
                    items: list.getList().map((valueItem){
                      return DropdownMenuItem(
                        value: valueItem,
                        onTap: (){
                          item=valueItem;
                          print("item: "+item);
                          Navigator.push(context, MaterialPageRoute(builder: (builder)=>Yt(yturl: valueItem)));
                        },
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  child: YoutubePlayer(
                    controller: _controller
                    ),
                  )
                ),
            ],
          ),
        )
    );
  }
}
