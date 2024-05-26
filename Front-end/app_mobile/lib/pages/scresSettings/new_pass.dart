import 'package:flutter/material.dart';

import '../indxes/PageLoginSignUp/login_sign_up.dart';

class NewPass extends StatefulWidget {
  NewPass({super.key});

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  @override
  bool _obscureText = true;
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

                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Votre Nouveau mot de passe',
                        hintText: 'mot passe',
                        border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(

                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Confirmer votre mot de passe',
                      hintText: 'mot passe',
                      border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(height: 10,),
                  SizedBox(height: 20,),
                  SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return LSU();
                      }
                  ));
                },
                child: Container(
                  padding: EdgeInsets.all(25),
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      "Connecter",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                      ),
                    ),
                  ),
                ),
              )
                ],
              ),
            ),
          ),
        )
    );
  }
}





