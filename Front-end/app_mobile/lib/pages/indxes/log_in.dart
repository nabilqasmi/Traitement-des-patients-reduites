import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../scresLogIn/no_login.dart';
import '../scresLogIn/valider.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Icon(
                Icons.medical_services_sharp,
                size: 100,
              ),

              Text("Bon retour",style: TextStyle(fontSize: 30),),
              Text("Tu nous as manqué",style: TextStyle(fontSize: 30),),
              SizedBox(height: 25,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Votre nom d'utilisateur",
                      hintText: "nom d'utilisateur",
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                    decoration: InputDecoration(
                    labelText: 'Votre mot de passe',
                      hintText: 'mot de passe',
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
              SizedBox(height: 10,),
              GestureDetector(
                onTap: (){print("mot de passe oublie");},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Mot de passe oublié",style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Valider(),
              SizedBox(height: 10,),
              NoLogin()
            ],
          ),
        ),
      )
    );
  }
}
