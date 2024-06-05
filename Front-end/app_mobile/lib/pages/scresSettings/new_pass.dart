import 'package:flutter/material.dart';

import '../indxes/PageLoginSignUp/login_sign_up.dart';

class NewPass extends StatefulWidget {
  const NewPass({super.key});

  @override
  State<NewPass> createState() => _NewPassState();
}

class _NewPassState extends State<NewPass> {
  @override
  bool _obscureText = true;
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

                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Votre Nouveau mot de passe',
                        hintText: 'mot passe',
                        border: const OutlineInputBorder(borderSide: BorderSide(width: 10)),
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
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(

                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      labelText: 'Confirmer votre mot de passe',
                      hintText: 'mot passe',
                      border: const OutlineInputBorder(borderSide: BorderSide(width: 10)),
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
                  const SizedBox(height: 20,),
                  const SizedBox(height: 10,),
                  const SizedBox(height: 20,),
                  const SizedBox(height: 10,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return const LSU();
                      }
                  ));
                },
                child: Container(
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  ),
                  child: const Center(
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





