import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../scresWelcome/page1.dart';
import '../scresWelcome/page2.dart';
import '../scresWelcome/page3.dart';
import 'login_sign_up.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  PageController _controller=PageController();

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
              alignment: Alignment(0,-0.8),
              child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                    dotWidth: (50)
                  ),
              ),
          ),
          Container(
            alignment: Alignment(0,0.8),
            child: TextButton( // Use ElevatedButton for a raised button effect
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return LSU();
                  }
                ));
                //_controller.jumpTo(3);
              },
                child: Text("Skip",style: TextStyle(color: Colors.green),) // Set the button text
            ),
          ),
          Container(
            alignment: Alignment(0,0.66),
              child: ElevatedButton( // Use ElevatedButton for a raised button effect
                onPressed: () {
                  if(_controller.page ==2){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return LSU();
                        }
                    ));
                  }else{
                    _controller.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
                  }

                },
                child: Text("Next",style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(300, 40)),
                    backgroundColor: MaterialStateProperty.all(Colors.green)
                ),
                // Set the button text
              ),
          )
        ],
      ),
    );
  }

}
