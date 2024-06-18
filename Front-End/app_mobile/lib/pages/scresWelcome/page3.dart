import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
                padding: const EdgeInsets.only(right: 0,top: 90),
                child: const Center(
                  child:
                  Text("Welcome to\nHemoEspoir",

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
