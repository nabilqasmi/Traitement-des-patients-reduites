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

  @override
  void dispose() {
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
                      controller: nomutilisateur,
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
                    controller: mdp,
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
                GestureDetector(
              onTap: ()async{
                Nm=nomutilisateur.text;
                Mp=mdp.text;
                /*print(Nm);
                print(Mp);*/
                Patient? patient= await DataLogin(Nm, Mp) as Patient;
                if(patient==null){
                  print("ERROR");
                }else{
                  PatientData().setPatient(patient);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context){
                        return ScrollPage();
                      }
                  ));
                  /*print(patient.id);
                  print(patient.nom);
                  print(patient.prenom);
                  print(patient.dateNaissance);
                  print(patient.Email);
                  print(patient.numTele);
                  print(patient.adresse);
                  print(patient.motpasse);
                  print(patient.image);
                  print(patient.GroupeSangin);
                  print(patient.taille);
                  print(patient.poids);
                  print(patient.sexe);
                  print(patient.anteHemomere);
                  print(patient.anteHemopere);*/
                }
                    {
                    }
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
            ),
                SizedBox(height: 10,),
                NoLogin(),
                SizedBox(height: 40,),
                Text("Veuillez vous connecter à un réseau Wi-Fi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.red),)
              ],
            ),
          ),
        ),
      )
    );
  }
}





