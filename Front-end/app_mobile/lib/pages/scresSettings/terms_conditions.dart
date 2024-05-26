import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../indxes/PageScroll/scroll_page.dart';

class TermsCondition extends StatefulWidget {
  const TermsCondition({super.key});

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {

  bool valNotify1=false;
  bool valNotify2=false;


  bool ch1=false;
  bool ch2=false;

  bool ch3=false;
  bool ch4=false;
  onChangeFunction1(bool newValue1){
    setState(() {
      valNotify1=newValue1;
    });
  }

  onChangeFunction2(bool newValue2){
    setState(() {
      valNotify2=newValue2;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 100),
            child: Container(
                child: buildNotificationOption("Securisé votre donné",valNotify1,onChangeFunction1)
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
                child: buildNotificationOption("Partager votre compte",valNotify2,onChangeFunction2)
            ),
          ),
          SizedBox(height: 30,),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Text("j'ai compris et je suis d'accord"),
                    Text("sur les termes et les conditions"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
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
                          Text("Oui")
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
                          Text("Non")
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 200,),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 50),
                child: Column(
                  children: [
                    Text("Cette application se démarque par son excellence et sa "),
                    Text("sécurité inégalée. Avec une interface intuitive et des "),
                    Text("protocoles de sécurité avancés, elle offre une "),
                    Text("expérience utilisateur exceptionnelle."),
                  ],
                ),
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    //await UserSimplePreferences.setvalNotify1(valNotify1);
                    //await UserSimplePreferences.setvalNotify1(valNotify2);
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return ScrollPage();
                        }
                    ));
                  },
                  child: Text("Enregistrer",style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(150, 60)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    backgroundColor: MaterialStateProperty.all(Colors.black12),

                  ),
                ),
              ),

            ],
          )
        ],
      )
    );
  }
  Padding buildNotificationOption(String title, bool value,Function onchangedMethod){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.green,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue){
                onchangedMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }
}
