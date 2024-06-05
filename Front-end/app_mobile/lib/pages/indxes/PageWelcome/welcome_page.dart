import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../scresWelcome/page1.dart';
import '../../scresWelcome/page2.dart';
import '../../scresWelcome/page3.dart';
import '../PageLoginSignUp/login_sign_up.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  final PageController _controller=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: const [
              Page1(),
              Page2(),
              Page3(),
            ],
          ),
          Container(
              alignment: const Alignment(0,-0.8),
              child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    dotWidth: (50)
                  ),
              ),
          ),
          Container(
            alignment: const Alignment(0,0.8),
            child: TextButton( // Use ElevatedButton for a raised button effect
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return const LSU();
                  }
                ));
                //_controller.jumpTo(3);
              },
                child: const Text("Skip",style: TextStyle(color: Colors.green),) // Set the button text
            ),
          ),
          Container(
            alignment: const Alignment(0,0.66),
              child: ElevatedButton( // Use ElevatedButton for a raised button effect
                onPressed: () {
                  if(_controller.page ==2){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return const LSU();
                        }
                    ));
                  }else{
                    _controller.nextPage(duration: const Duration(microseconds: 500), curve: Curves.easeIn);
                  }

                },
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(300, 40)),
                    backgroundColor: MaterialStateProperty.all(Colors.green)
                ),
                child: const Text("Next",style: TextStyle(color: Colors.white),),
                // Set the button text
              ),
          )
        ],
      ),
    );
  }

}
