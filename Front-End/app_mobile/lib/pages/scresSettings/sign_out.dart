import 'package:flutter/material.dart';

import '../MVC/Controller/Controller.dart';
import '../MVC/models/Patient.dart';
import '../indxes/PageLoginSignUp/login_sign_up.dart';

class Signut extends StatefulWidget {


  const Signut({super.key});

  @override
  State<Signut> createState() => _SignutState();
}

class _SignutState extends State<Signut> {

  final _formKey = GlobalKey<FormState>();
  final Gmail=TextEditingController();
  final mdp=TextEditingController();
  bool ok=true;
  @override
  void dispose() {
    Gmail.dispose();
    mdp.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top:280),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/bye.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),

                  const Text("À bientôt, prenez soin!",style: TextStyle(fontSize: 30),),
                  const SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Votre Gmail",
                          hintText: "Gamil",
                          border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                        ),
                        controller: Gmail,
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return "Tu dois completer ce texte";
                          }
                          return null;
                        }
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Votre mot de passe',
                        hintText: 'Mot de passe',
                        border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                      ),
                      controller: mdp,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Tu dois compléter ce texte";
                        }
                        return null;
                      },
                    ),

                  ),
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){print("mot de passe oublie");},
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Mot de passe oublié",style: TextStyle(color: Colors.grey),),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: ()async{
                          Patient? patient= await DataLogOut(Gmail.text,mdp.text);
                          if(patient!=null){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context){
                                  return const LSU();
                                }
                            ));
                          }
                          else{
                            showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return const AlertDialog(
                                    title: Text("Erreur"),
                                  );
                                }
                            );
                          }

                    },
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                    child: const Center(
                      child: Text(
                        "Déconnecter",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                    ),
                  ),
            ),
                ],
              ),
            ),
          ),
        )
    );
  }
}





