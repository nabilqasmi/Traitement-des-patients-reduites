import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/image5.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 500,
                padding: EdgeInsets.only(right: 0,top: 90),
                child: Center(
                  child:
                  Text("HemoEspoir",

                    style: TextStyle(
                        fontSize: 40
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
