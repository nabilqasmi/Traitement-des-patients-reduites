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
                  const SizedBox(height: 200,),
                  const Icon(
                    Icons.password,
                    size: 100,
                  ),

                  const Text("Changer mot passe",style: TextStyle(fontSize: 30),),
                  const SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                        decoration: const InputDecoration(
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
                  const SizedBox(height: 20,),
                  const SizedBox(height: 10,),
                  const SizedBox(height: 20,),
                  const SizedBox(height: 10,),
                  const Email(),
                ],
              ),
            ),
          ),
        )
    );
  }
}





