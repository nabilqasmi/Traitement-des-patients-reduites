import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../scresWelcome/page1.dart';
import '../scresWelcome/page2.dart';


// Consider renaming "SignUpp" to a more descriptive name (e.g., SignUpWizard)
class SignUpp2 extends StatefulWidget {
  const SignUpp2({super.key});

  @override
  State<SignUpp2> createState() => _SignUpWizardState();
}

class _SignUpWizardState extends State<SignUpp2> {
  final PageController _controller = PageController(initialPage: 0);
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers for form fields
  final TextEditingController nom = TextEditingController();
  final TextEditingController prenom = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController adresse = TextEditingController();
  bool _obscureText = true;


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
                            controller: nom,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "Tu dois completer ce texte";
                              }
                              return null;
                            }
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Votre Adresse',
                              hintText: 'Adresse',
                              prefixIcon: Icon(Icons.home),
                              border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                            ),
                            controller: prenom,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "Tu dois completer ce texte";
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
                            labelText: 'Votre mot passe',
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
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            labelText: 'Confirmer votre mot passe',
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

  Future<void> _selectedDate() async{
    DateTime? picked= await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if(picked !=null){
      setState(() {
        date.text=picked.toString().split(" ")[0];
      });
    }
  }
}