import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../scresWelcome/page1.dart';
import '../scresWelcome/page2.dart';


// Consider renaming "SignUpp" to a more descriptive name (e.g., SignUpWizard)
class SignUpp extends StatefulWidget {
  const SignUpp({super.key});

  @override
  State<SignUpp> createState() => _SignUpWizardState();
}

class _SignUpWizardState extends State<SignUpp> {
  final PageController _controller = PageController(initialPage: 0);
  final _formKey = GlobalKey<FormState>();

  // Text editing controllers for form fields
  final TextEditingController nom = TextEditingController();
  final TextEditingController prenom = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController adresse = TextEditingController();



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
                            Text("Bonjour et bienvenue sur",style: TextStyle(color: Colors.green,fontSize: 20),),
                            Text("HemoConnect ! Nous sommes ravis",style: TextStyle(color: Colors.green,fontSize: 20),),
                            Text("de vous accueillir",style: TextStyle(color: Colors.green,fontSize: 20),)
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
                              labelText: 'Votre nom',
                              hintText: 'nom',
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
                            decoration: InputDecoration(
                              labelText: 'Votre prenom',
                              hintText: 'prenom',
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
                          controller: date,
                          decoration: InputDecoration(
                            labelText: 'Votre Date de Naissance',
                            hintText: 'Date de Naissance',
                            prefixIcon: Icon(Icons.calendar_today),
                            border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                          ),
                          readOnly: true,
                          onTap: (){
                            _selectedDate();
                          },

                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Votre Email',
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                            ),
                            controller:adresse,
                            validator: (value){
                              if(value==null || value.isEmpty){
                                return "Tu dois completer ce texte";
                              }
                              return null;
                            }
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