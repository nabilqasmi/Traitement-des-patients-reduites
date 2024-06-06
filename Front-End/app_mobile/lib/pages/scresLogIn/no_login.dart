import 'package:flutter/material.dart';


import '../scresSignUp/sign_up1.dart';

class NoLogin extends StatelessWidget {
  const NoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return const SignUpp();
            }
        ));
      },
      child: Container(
        child: Container(
          padding: const EdgeInsets.only(left : 25),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Vous n'avez pas de compte",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
