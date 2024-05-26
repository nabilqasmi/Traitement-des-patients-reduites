import 'package:flutter/material.dart';
import 'ApiFlask.dart';
import 'dart:convert';


void main() => runApp(App());

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String url = "";
  var Data;
  String QueryText = 'ok';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Python And Flutter'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    // Utilisez l'adresse IP spéciale pour les émulateurs Android
                    url = 'http://10.0.2.2:5000/api?Query=' + value.toString();
                  });
                },
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: () async {
                          Data = await Getdate(url);
                          var DecodeData = jsonDecode(Data);
                          setState(() {
                            QueryText = DecodeData['Query'];
                          });
                    },
                    child: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(QueryText),
            ),
          ],
        ),
      ),
    );
  }
}