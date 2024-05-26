
import 'package:app_mobile/pages/scresSignUp/sign_up2.dart';
import 'package:flutter/material.dart';

import '../MVC/models/Patient.dart';


class SignUpp extends StatefulWidget {
  const SignUpp({super.key});

  @override
  State<SignUpp> createState() => _SignUpWizardState();
}

class _SignUpWizardState extends State<SignUpp> {

  void _coordonnate(PointerEvent details){
    double x=details.position.dx;
    double y=details.position.dy;

    print(x);
    print(y);
  }

  final PageController _controller = PageController(initialPage: 0);
  final _formKey = GlobalKey<FormState>();
  Patient patient=new Patient();

  final  date = TextEditingController();
  final  nom=TextEditingController();
  final prenom=TextEditingController();
  final Email=TextEditingController();
  var name="";
  var pr="";
  var dat="";
  var ema="";

  @override
  void dispose() {
    nom.dispose();
    prenom.dispose();
    Email.dispose();
    date.dispose();
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
                    children: <Widget>[

                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Votre nom',
                              hintText: 'nom',
                              border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                            ),
                              controller: nom,
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
                            controller: Email,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [

                            Container(
                              padding: EdgeInsets.only(top: 100,left: 50),
                              child: TextButton(
                                onPressed: (){},
                                child: Text("Go Back",style: TextStyle(color: Colors.green),),
                              ),
                            ),

                            Container(
                              padding: EdgeInsets.only(top: 100,left: 100),
                              child:ElevatedButton(
                                      onPressed: () {
                                        if(_formKey.currentState!.validate()){

                                          name=nom.text;
                                          patient.nom=name;

                                          pr=prenom.text;
                                          patient.prenom=pr;

                                          dat=date.text;
                                          patient.dateNaissance=dat;

                                          ema=Email.text;
                                          patient.Email=ema;

                                          /*print(name);
                                          print(pr);
                                          print(dat);
                                          print(ema);*/
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>  SignUpp2(
                                                patient:patient
                                              ),
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
                      )
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