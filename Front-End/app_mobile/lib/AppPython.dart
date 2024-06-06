import 'package:flutter/material.dart';
import 'ApiFlask.dart';
import 'dart:convert';


void main() => runApp(const App());

class App extends StatefulWidget {
  const App({super.key});

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
          title: const Text('Python And Flutter'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    // Utilisez l'adresse IP spéciale pour les émulateurs Android
                    url = 'http://10.0.2.2:5000/api?Query=$value';
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
                    child: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(QueryText),
            ),
          ],
        ),
      ),
    );
  }
}