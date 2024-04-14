import 'package:app_mobile/pages/indxes/sign_up.dart';
import 'package:flutter/material.dart';

import 'log_in.dart';

class  LSU extends StatelessWidget {
  const  LSU({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        /*decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/HemoEspoir.jpeg"),
            fit: BoxFit.cover,
          ),
        ),*/
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 700,
            ),
            Container(
              alignment: Alignment(0,0.8),
              child: TextButton( // Use ElevatedButton for a raised button effect
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return SignUp();
                        }
                    ));
                    //_controller.jumpTo(3);
                  },
                child: Text("Sign Up",style: TextStyle(color: Colors.white),),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(300, 40)),
                    backgroundColor: MaterialStateProperty.all(Colors.green)
                ), // Set the button text
              ),
            ),
            Container(

              child: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return LogIn();
                      }
                  ));
                },
                  child: Text("Log In",style: TextStyle(color: Colors.green),)
              ),
            )
          ],
        ),
      ),
    );
  }
}
