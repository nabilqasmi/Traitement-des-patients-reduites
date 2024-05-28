import 'package:app_mobile/pages/MVC/models/Patient.dart';
import 'package:app_mobile/pages/scresSignUp/picture.dart';
import 'package:flutter/material.dart';

import '../indxes/PageLoginSignUp/login_sign_up.dart';


class SignUpp2 extends StatefulWidget {
  final Patient patient;

  const  SignUpp2({Key? key, required this.patient}) : super(key: key);
  @override
  State<SignUpp2> createState() => _SignUpWizardState(this.patient);
}

class _SignUpWizardState extends State<SignUpp2> {

  final PageController _controller = PageController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  _SignUpWizardState(Patient patient);
  final  tele = TextEditingController();
  final  adresse=TextEditingController();
  final motpasse=TextEditingController();
  final motpasse2=TextEditingController();
  var tel="";
  var adr="";
  var mot1="";

  @override
  void dispose() {
    tele.dispose();
    adresse.dispose();
    motpasse.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
                child: Center(
                  child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 100),
                        child: Column(
                          children: [
                            Text("On aimerez bien savoir",style: TextStyle(color: Colors.green,fontSize: 20),),
                            Text("d'autres informations sur vous",style: TextStyle(color: Colors.green,fontSize: 20),)
                          ],
                        ),

                      ),
                    ],
                  ),
                )
            ),
            Container(
              padding: EdgeInsets.only(top:240),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Votre numero de telehpne',
                              hintText: 'numero de telehpne',
                              prefixIcon: Icon(Icons.add_call),
                              border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                            ),
                            controller: tele,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "Erreur...";
                              }
                              return null;
                            }
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                            onChanged: (value){

                            },
                            decoration: const InputDecoration(
                              labelText: 'Votre Adresse',
                              hintText: 'Adresse',
                              prefixIcon: Icon(Icons.home),
                              border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                            ),
                            controller: adresse,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "Erreur...";
                              }
                              return null;
                            }
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                          onChanged: (value){

                          },
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Votre mot de passe',
                            hintText: 'mot passe',
                            border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          controller: motpasse,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "Erreur...";
                              }
                              return null;
                            }
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(

                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Confirmer votre mot de passe',
                            hintText: 'mot passe',
                            border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          controller: motpasse2,
                            validator: (value){
                              if(value!=motpasse.text || value==Null || value!.isEmpty){
                                return "Erreur...";
                              }
                              return null;
                            }
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [

                            Container(
                              padding: EdgeInsets.only(top: 100,left: 50),
                              child: TextButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  LSU()
                                    ),
                                  );

                                },
                                child: Text("Go Out",style: TextStyle(color: Colors.green),),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(top: 100,left: 100),
                              child:ElevatedButton(
                                onPressed: () {
                                  if(_formKey.currentState!.validate()){

                                    tel=tele.text;
                                    widget.patient.numTele=tel;

                                    adr=adresse.text;
                                    widget.patient.adresse=adr;

                                    mot1=motpasse.text;
                                    widget.patient.motpasse=mot1;

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>  Picture1(patient: widget.patient,),
                                      ),
                                    );
                                  }
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
                  )),
            ),
          ],
        ),
      ),
    );
  }

}