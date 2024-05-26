import 'package:flutter/material.dart';

import '../../scresSettings/mot_pass_oublie.dart';
import '../../scresSettings/sign_out.dart';
import '../../scresSettings/terms_conditions.dart';
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}



class _SettingsState extends State<Settings> {
  @override

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
  Widget build(BuildContext context) {
    return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: 50,left: 10),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(child: Image.asset("assets/images/photo.png"),),
                  title: Text("Username"),
                  subtitle: Text("user_email@gmailcom"),

                ),
                Divider(),
                SizedBox(height: 20,),
                ListView(
                  shrinkWrap: true,
                  children:
                      [
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Icon(settingsListIcon[0]),
                            Container(

                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context){
                                        return MotPassOublie();
                                      }
                                  ));
                                },
                                child:Text(settingsList[0]),),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Icon(settingsListIcon[1]),
                            Container(

                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context){
                                        return TermsCondition();
                                      }
                                  ));
                                },
                                child:Text(settingsList[1]),),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Icon(settingsListIcon[2]),
                            Container(

                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context){
                                        return Signut();
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

