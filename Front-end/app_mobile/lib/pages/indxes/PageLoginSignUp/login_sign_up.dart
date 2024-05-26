import 'package:flutter/material.dart';

import '../../scresSignUp/sign_up1.dart';
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Hemo",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.orange
                        ),
                    ),
                    Text(
                        "Espoir",
                      style: TextStyle(
                          fontSize: 40,
                        color: Colors.green
                      ),
                    )
                  ],
                ),
            ),
            Container(
              alignment: Alignment(0,0.8),
              child: TextButton( // Use ElevatedButton for a raised button effect
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return SignUpp();
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
