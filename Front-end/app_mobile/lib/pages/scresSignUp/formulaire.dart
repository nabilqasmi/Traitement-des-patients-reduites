import 'package:flutter/material.dart';

class Formulaire extends StatefulWidget {
  const Formulaire({super.key});

  @override
  State<Formulaire> createState() => _FormulaireState();
}

class _FormulaireState extends State<Formulaire> {
  bool ch1=false;
  bool ch2=false;

  bool ch3=false;
  bool ch4=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(

            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top:250),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/medcineQuestion.jpg"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top:250),
                  child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Votre Groupe Sanguin',
                        hintText: 'Groupe Sanguin',
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
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top:330),
                  child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Votre Taille',
                        hintText: 'Taille',
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
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top:410),
                  child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Votre Poids',
                        hintText: 'Poids',
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
                Container(
                  padding: EdgeInsets.only(top: 500, left: 100),
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
                  padding: EdgeInsets.only(top: 520, left: 120),
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
                Container(
                  padding: EdgeInsets.only(top: 580, left: 100),
                  child:
                  Row(
                    children: [
                      Icon(Icons.family_restroom), // Ajoutez l'icône ici
                      SizedBox(width: 10), // Espacement entre l'icône et le texte
                      Text("Antecedant hemophilie")
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 600, left: 120),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: ch3,
                            onChanged: (val){
                              setState(() {
                                ch3 = val ?? false;
                                if(val==true){
                                  ch4 = false;
                                }
                              });
                            },
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
            )

        )
    );
  }
}

