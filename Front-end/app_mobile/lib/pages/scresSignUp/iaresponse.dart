import 'package:flutter/material.dart';

import '../MVC/Controller/Controller.dart';
import '../MVC/models/Patient.dart';
import '../indxes/PageLoginSignUp/login_sign_up.dart';

class IaResponse extends StatefulWidget {
  const IaResponse({super.key});

  @override
  State<IaResponse> createState() => _IaResponseState();
}

class _IaResponseState extends State<IaResponse> {

  //Patient patient = PatientData().patient;

  void CheckPatient(){
    //String ok=DataCheckPatient(patient.id) as String;
    showDialog(
        context: context,
        builder: (BuildContext context){
          return const AlertDialog(
            title: Text("Erreur"),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/ai3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child:Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 750,
                  padding: const EdgeInsets.only(right: 0,top: 90),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 25,left: 20),
                  child:TextButton(
                    onPressed: ()async{
                      Patient? patient= await DataLastPatient() as Patient;
                      //print("nom d'utilisateur: "+patient.nomutilisateur);
                      //PatientData().setPatient(patient);
                      String valeur=await DataCheckPatient(patient.id);
                      /*print(patient.id);
                      print(valeur);*/
                      //print(valeur);
                      if(valeur=="malade"){
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                title: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset('assets/images/robot.png',width: 40,height: 40,),
                                        const Text("  Vous etes Malade",style: TextStyle(fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                    const Text("         Ne vous inquiétez"),
                                    const Text("   pas nous vous\n   soignerons"),
                                    //Text("")
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>  const LSU()
                                          ),
                                        );
                                      },
                                      child: const Text("Ok"))
                                ],
                              );
                            }
                        );
                      }
                      else{
                        showDialog(
                            context: context,
                            builder: (BuildContext context){
                              return AlertDialog(
                                title: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset('assets/images/robot.png',width: 40,height: 40,),
                                        const Text("  Vous êtes en bonne"),
                                      ],
                                    ),
                                    const Text("         santé pas besoin\n         d'utiliser l'application"),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>  const LSU()
                                          ),
                                        );
                                      },
                                      child: const Text("Ok"))
                                ],
                              );
                            }
                        );
                      }
                                        },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(const Size(250, 60)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),

                    ),
                    child: const Text("Resultat"),
                  ),
                )
              ],
            ),
          ]
        )
      ),
    );
  }
}
