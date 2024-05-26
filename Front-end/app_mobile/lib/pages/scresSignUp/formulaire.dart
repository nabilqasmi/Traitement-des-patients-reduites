import 'package:flutter/material.dart';

import '../MVC/Controller/Controller.dart';
import '../MVC/models/Patient.dart';

class Formulaire extends StatefulWidget {
  final Patient patient;
  const Formulaire({super.key,required this.patient});

  @override
  State<Formulaire> createState() => _FormulaireState(this.patient);
}

class _FormulaireState extends State<Formulaire> {

  final  grpSang = TextEditingController();
  final  taille=TextEditingController();
  final Poids=TextEditingController();


  var gS="";
  var tE="";
  var pS="";
  var sE="";
  var aOM="";
  var aOP="";

  @override
  void dispose() {
    grpSang.dispose();
    taille.dispose();
    Poids.dispose();
  }


  _FormulaireState(Patient patient);
  bool ch1=false;
  bool ch2=false;

  bool ch3=false;
  bool ch4=false;

  bool ch5=false;
  bool ch6=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(

            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top:210),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/medcineQuestion.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top:220),
                  child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Votre Groupe Sanguin',
                        hintText: 'Groupe Sanguin',
                        border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                      ),
                      controller: grpSang,
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Tu dois completer ce texte";
                        }
                        return null;
                      }
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top:300),
                  child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Votre Taille',
                        hintText: 'Taille',
                        border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                      ),
                      controller: taille,
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Tu dois completer ce texte";
                        }
                        return null;
                      }
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top:380),
                  child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Votre Poids',
                        hintText: 'Poids',
                        border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                      ),
                      controller: Poids,
                      validator: (value){
                        if(value==null || value.isEmpty){
                          return "Tu dois completer ce texte";
                        }
                        return null;
                      }
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 460, left: 100),
                  child:
                  Row(
                    children: [
                      Icon(Icons.transgender), // Ajoutez l'icône ici
                      SizedBox(width: 10), // Espacement entre l'icône et le texte
                      Text("Sexe")
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 480, left: 120),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: ch1,
                            onChanged: (val){
                              setState(() {
                                ch1 = val ?? false;
                                if(val==true){
                                  ch2 = false;
                                  sE="Homme";
                                }
                              });
                            },
                          ),
                          Text("Homme")
                        ],
                      )
                      ,
                      Row(
                        children: [
                          Checkbox(value: ch2,
                            onChanged: (val){
                              setState(() {
                                ch2 = val ?? false;
                                if(val==true){
                                  ch1 = false;
                                  sE="Femme";
                                }
                              });
                            },
                          ),
                          Text("Femme")
                        ],
                      )
                    ],
                  ),
                ),
                    Column(
                       children: [
                         Container(
                           padding: EdgeInsets.only(top: 530,left: 70),
                           child:
                           Row(
                             children: [
                               Icon(Icons.family_restroom), // Ajoutez l'icône ici
                               SizedBox(width: 10), // Espacement entre l'icône et le texte
                               Text("Votre mère a-t-elle de l'hémophilie ?")
                             ],
                           ),
                         ),
                         Container(
                           padding: EdgeInsets.only(left: 130),
                           child: Row(
                             children: [
                               Row(
                                 children: [
                                   Container(
                                     child: Checkbox(

                                       value: ch3,
                                       onChanged: (val){
                                         setState(() {
                                           ch3 = val ?? false;
                                           if(val==true){
                                             aOM="Oui";
                                             ch4 = false;
                                           }
                                         });
                                       },
                                     ),
                                   ),
                                   Text("Oui")
                                 ],
                               )
                               ,
                               Row(
                                 children: [
                                   Checkbox(value: ch4,
                                     onChanged: (val){
                                       setState(() {
                                         ch4 = val ?? false;
                                         if(val==true){
                                           aOM="Non";
                                           ch3 = false;
                                         }
                                       });
                                     },
                                   ),
                                   Text("Non")
                                 ],
                               )
                             ],
                           ),
                         ),
                       ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 600,left: 70),
                          child:
                          Row(
                            children: [
                              Icon(Icons.family_restroom), // Ajoutez l'icône ici
                              SizedBox(width: 10), // Espacement entre l'icône et le texte
                              Text("Votre père a-t-il de l'hémophilie ?")
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 130),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Checkbox(

                                      value: ch5,
                                      onChanged: (val){
                                        setState(() {
                                          ch5 = val ?? false;
                                          if(val==true){
                                            aOP="Oui";
                                            ch6 = false;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  Text("Oui")
                                ],
                              )
                              ,
                              Row(
                                children: [
                                  Checkbox(value: ch6,
                                    onChanged: (val){
                                      setState(() {
                                        ch6 = val ?? false;
                                        if(val==true){
                                          aOP="Non";
                                          ch5 = false;
                                        }
                                      });
                                    },
                                  ),
                                  Text("Non")
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 660,left: 50),
                        child: TextButton(
                          onPressed: (){},
                          child: Text("Go Back",style: TextStyle(color: Colors.green),),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.only(top: 660,left: 100),
                        child:ElevatedButton(
                          onPressed: () {
                            widget.patient.image="image.png";

                            gS=grpSang.text;
                            tE=taille.text;
                            pS=Poids.text;
                            widget.patient.GroupeSangin=gS;
                            widget.patient.taille=tE;
                            widget.patient.poids=pS;
                            widget.patient.sexe=sE;
                            widget.patient.anteHemomere=aOM;
                            widget.patient.anteHemopere=aOP;

                            /*print("Nom: "+widget.patient.nom);
                            print("Prenom: "+widget.patient.prenom);
                            print("Date: "+widget.patient.dateNaissance);
                            print("Email: "+widget.patient.Email);
                            print("Numero de telephone: "+widget.patient.numTele);
                            print("Adresse: "+widget.patient.adresse);
                            print("Mot de passe: "+widget.patient.motpasse);
                            print("Image: "+widget.patient.image);
                            print("Groupe Sanguin: "+widget.patient.GroupeSangin);
                            print("Taille: "+widget.patient.taille);
                            print("Poids: "+widget.patient.poids);
                            print("Sexe: "+widget.patient.sexe);
                            print("Antecedent hemophilie Mere: "+widget.patient.anteHemomere);
                            widget.patient.anteHemopere=aOP;
                            print("Antecedent hemophilie Pere: "+widget.patient.anteHemopere);*/
                            DataPatient(widget.patient);
                          },
                          child: Text("Next",style: TextStyle(color: Colors.white),),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(150, 60)),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all(Colors.black12),

                          ),
                        ),
                        // Set the button text
                      ),
                    ],
                  ),
                ),
              ],
            )

        )
    );
  }
}

