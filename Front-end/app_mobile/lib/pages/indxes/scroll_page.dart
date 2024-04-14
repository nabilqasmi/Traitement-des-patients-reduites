import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  child: Icon(Icons.home),
                onTap: (){print("home");},
              ),
              GestureDetector(
                child: Icon(Icons.notifications),
                onTap: (){print("notifications");},
              ),
              GestureDetector(
                child: Icon(Icons.settings),
                onTap: (){print("settings");},
              ),
            ],
          ),
        ),
      ),
    );
  }
}


