import 'dart:io';

import 'package:app_mobile/pages/MVC/models/PasParJour.dart';
import 'package:app_mobile/pages/MVC/models/PatientData.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../MVC/Controller/Controller.dart';
import '../../MVC/models/Medicament.dart';
import '../../MVC/models/Patient.dart';
import '../Categories/SeaRed/video.dart';
import '../Categories/SuivActivite/TEST/graphePas.dart';
import '../Categories/rappel_medica/rapp_med.dart';
import '../Categories/RendezAvecDoctor/rendezvous.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController scrollController=ScrollController();


  Patient patient = PatientData().patient;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScroll= scrollController.position.minScrollExtent;
      double maxScroll=scrollController.position.maxScrollExtent;

      animateToMaxMin(maxScroll,minScroll,maxScroll,10,scrollController);

    });
  }

  animateToMaxMin(double max, double min, double direction,int seconds, ScrollController scrollController){
    scrollController.
    animateTo(direction, duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
          direction=direction==max ? min :max;
          animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    Patient patient = PatientData().patient;
    return Scaffold(
      body:Stack(
        children: [SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceBetween,
                          children:  <Widget>[
                            Text(
                                'Bonjour ${patient.nomutilisateur}',
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                             SizedBox(
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: FileImage(File(patient.image)),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 140,
                        child: ListView(
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          children: [
                            TextButton(
                                onPressed: (){},
                                child: const Text("Affrontez chaque \npas avec confiance")
                            ),
                            TextButton(
                                onPressed: (){},
                                child: const Text("Prenez soin \nde vous")
                            ),
                            TextButton(
                                onPressed: (){},
                                child: const Text("Nourrissez votre\n équilibre")
                            ),
                            TextButton(
                                onPressed: (){},
                                child: const Text("Continuez à\n gagner")
                            ),TextButton(
                                onPressed: (){},
                                child: const Text("tu es tres\n fort")
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          " Categories",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      child:TextButton(
                                        onPressed: ()async{
                                          List<Medicament?> med;
                                          med= await allMedicaments(patient.id);
                                          /*for(var i in med){

                                          }*/
                                          Navigator.push(context, MaterialPageRoute(
                                              builder: (context){
                                                return  RappMed(allMed: med);
                                              }
                                          ));
                                        },
                                        child: Image.asset(
                                            "assets/images/RappelMEed.jpg",
                                            height: 130,
                                            width: 170,
                                          ),
                                      ),
                                  ),
                                  const Text("Rappel de médicament",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                                ],
                              ),
                              //Text("Rappel de medicament"),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                        child: TextButton(
                                          onPressed: ()async{
                                            Map<String, int>? nombreDePas = await DataSuiveActivite(patient.nomutilisateur);
                                            PasParJour().setPasJour(nombreDePas!);
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context){
                                                  return const Graphepas();
                                                }
                                            ));
                                          },
                                          child: Image.asset(
                                              "assets/images/SuiveAct.jpg",
                                              height: 130,
                                              width: 170,
                                          ),
                                        )),
                                    const Text("Pas quotidienne",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30,),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    child:TextButton(
                                      onPressed: (){
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (context){
                                                    return Video();
                                                }
                                              ));
                                            },
                                      child: Image.asset(
                                        "assets/images/Reduction.jpg",
                                        height: 130,
                                        width: 170,
                                      ),
                                    ),
                                  ),
                                  const Text("Seance de réduction",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                        child: TextButton(
                                          onPressed: (){ Navigator.push(context, MaterialPageRoute(
                                              builder: (context){
                                                return  RendezVous();
                                              }
                                          ));
                                          },
                                          child: Image.asset(
                                            "assets/images/NoteMed.jpg",
                                            height: 130,
                                            width: 170,
                                          ),
                                        )),
                                    const Text("Rendez-vous avec Medecin",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              )
            ],
          ),
        ),
        ],
      )
    );
  }
}
