import 'dart:ui';
import 'package:app_mobile/pages/scresSignUp/picture.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../scresSignUp/formulaire.dart';
import '../scresSignUp/sign_up1.dart';
import '../scresSignUp/sign_up2.dart';

import 'login_sign_up.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();

}

class _SignUpState extends State<SignUp> {
  final PageController _controller=PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: const [
              SignUpp(),
              SignUpp2(),
              Picture(),
              Formulaire()
            ],
          ),
          Container(

            alignment: Alignment(0,-0.85),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
              effect: WormEffect(
                  dotWidth: (50)
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 710,left: 230),
            child: ElevatedButton( // Use ElevatedButton for a raised button effect
              onPressed: () {
                if(_controller.page==3){
                Navigator.push(context, MaterialPageRoute(
                builder: (context){
                return LSU();
                }
                ));
                }
                _controller.nextPage(duration:Duration(microseconds: 500), curve: Curves.easeIn);
              },
              child: Text("Next",style: TextStyle(color: Colors.white),),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(150, 60)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(Colors.black12),

              ),
              // Set the button text
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 710,left: 60),
            child: TextButton(
              onPressed: (){
                if (_controller.page==0) {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LSU();
                      }
                  ));
                }
                else{
                  _controller.previousPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
                }

              },
              child: Text("Go Back",style: TextStyle(color: Colors.green),),
            ),
          )
        ],
      ),
    );
  }
}
