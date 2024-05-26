import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'email.dart';

class MotPassOublie extends StatelessWidget {
  const MotPassOublie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 200,),
                  Icon(
                    Icons.password,
                    size: 100,
                  ),

                  Text("Changer mot passe",style: TextStyle(fontSize: 30),),
                  SizedBox(height: 25,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Votre Gmail",
                          hintText: "Gamil",
                          border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                        ),
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return "Tu dois completer ce texte";
                          }
                          return null;
                        }
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(height: 10,),
                  SizedBox(height: 20,),
                  SizedBox(height: 10,),
                  Email(),
                ],
              ),
            ),
          ),
        )
    );
  }
}





