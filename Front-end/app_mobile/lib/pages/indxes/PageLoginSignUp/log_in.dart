import 'package:flutter/material.dart';

import '../../MVC/Controller/Controller.dart';
import '../../MVC/models/Patient.dart';
import '../../MVC/models/PatientData.dart';
import '../../scresLogIn/no_login.dart';
import '../PageScroll/scroll_page.dart';

class LogIn extends StatefulWidget {


  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final  nomutilisateur = TextEditingController();
  final  mdp=TextEditingController();

  var Nm="";
  var Mp="";
  bool ok=false;
  @override
  void dispose() {
    super.dispose();
    nomutilisateur.dispose();
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
                const SizedBox(height: 100,),
                const Icon(
                  Icons.medical_services_sharp,
                  size: 100,
                ),

                const Text("Bon retour",style: TextStyle(fontSize: 30),),
                const Text("Tu nous as manqué",style: TextStyle(fontSize: 30),),
                const SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Votre nom d'utilisateur",
                        hintText: "nom d'utilisateur",
                        border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                      ),
                      controller: nomutilisateur,
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
                        hintText: 'mot de passe',
                        border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                      ),
                    controller: mdp,
                    validator: (value){
                      if(value==null || value.isEmpty){
                        return "Tu dois completer ce texte";
                      }
                      return null;
              }
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
                GestureDetector(
              onTap: ()async{
                Nm=nomutilisateur.text;
                Mp=mdp.text;
                /*print(Nm);
                print(Mp);*/
                Patient? patient= await DataLogin(Nm, Mp) as Patient?;
                if(patient==null){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return const AlertDialog(
                          title: Text("Erreur d'authentification"),
                        );
                      }
                  );
                }
                ok=true;
                PatientData().setPatient(patient!);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return const ScrollPage();
                    }
                ));
              
                    {
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
                    "Connecter",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                ),
              ),
            ),
                const SizedBox(height: 10,),
                const NoLogin(),
                const SizedBox(height: 40,),
                const Text("Veuillez vous connecter à un réseau Wi-Fi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.red),)
              ],
            ),
          ),
        ),
      )
    );
  }
}





