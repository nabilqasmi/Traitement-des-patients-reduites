import 'package:flutter/material.dart';

import '../MVC/Controller/Controller.dart';
import '../MVC/models/Patient.dart';
import '../MVC/models/PatientData.dart';

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
          return AlertDialog(
            title: Text("Erreur"),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
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
                  padding: EdgeInsets.only(right: 0,top: 90),
                ),
                Container(
                  padding: EdgeInsets.only(top: 25,left: 20),
                  child:TextButton(
                    onPressed: ()async{

                      Patient? patient= await DataLastPatient() as Patient;
                      if(patient==null){
                        print("ERROR");
                      }else{
                        //PatientData().setPatient(patient);
                        String valeur=await DataCheckPatient(patient.id);
                        if(valeur=="vous etes malade"){
                          showDialog(
                              context: context,
                              builder: (BuildContext context){
                                return AlertDialog(
                                  title: Text("Vous etes Malade"),
                                );
                              }
                          );
                        }
                      }
                    },
                    child: Text("Resultat"),
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(250, 60)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),

                    ),
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
