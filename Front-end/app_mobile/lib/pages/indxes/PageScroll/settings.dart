import 'dart:io';

import 'package:flutter/material.dart';

import '../../MVC/models/Patient.dart';
import '../../MVC/models/PatientData.dart';
import '../../scresSettings/mot_pass_oublie.dart';
import '../../scresSettings/sign_out.dart';
import '../../scresSettings/terms_conditions.dart';
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}



class _SettingsState extends State<Settings> {

  Patient patient = PatientData().patient;

  var settingsList=[
    "Change Password",
    "Terms and Conditions",
    "Signout"
  ];

  var settingsListIcon=[
    Icons.lock,
    Icons.note,
    Icons.logout
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(top: 50,left: 10),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
            radius: 25,
              backgroundImage: FileImage(File(patient.image)),
            ),
                  title:  Text('${patient.nomutilisateur}'),
                  subtitle:  Text('${patient.Email}'),

                ),
                const Divider(),
                const SizedBox(height: 20,),
                ListView(
                  shrinkWrap: true,
                  children:
                      [
                        Row(
                          children: [
                            const SizedBox(width: 20,),
                            Icon(settingsListIcon[0]),
                            Container(

                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context){
                                        return const MotPassOublie();
                                      }
                                  ));
                                },
                                child:Text(settingsList[0]),),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            const SizedBox(width: 20,),
                            Icon(settingsListIcon[1]),
                            Container(

                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context){
                                        return const TermsCondition();
                                      }
                                  ));
                                },
                                child:Text(settingsList[1]),),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 20,),
                            Icon(settingsListIcon[2]),
                            Container(

                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context){
                                        return const Signut();
                                      }
                                  ));
                                },
                                child:Text(settingsList[2]),),
                            ),
                          ],
                        ),
                      ]

                )
              ],
            ),
          ),
    );
  }
}

