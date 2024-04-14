import 'package:flutter/material.dart';

import '../indxes/scroll_page.dart';


class Valider extends StatelessWidget {
  const Valider({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return ScrollPage();
            }
        ));
      },
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: Center(
          child: Text(
            "Connecter",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        ),
      ),
    );
  }
}
