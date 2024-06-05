  import 'package:app_mobile/pages/indxes/PageLoginSignUp/login_sign_up.dart';
  import 'package:app_mobile/pages/scresSignUp/sign_up2.dart';
  import 'package:flutter/material.dart';

  import '../MVC/Controller/Controller.dart';
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
    Patient patient=Patient();

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
                          padding: const EdgeInsets.only(top: 100),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 0),
                                  child:  const Text("Veuillez vous connecter à un réseau Wi-Fi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.red),)
                              ),
                              const Text("Bonjour et bienvenue sur",style: TextStyle(color: Colors.green,fontSize: 20),),
                              const Text("HemoConnect ! Nous sommes ravis",style: TextStyle(color: Colors.green,fontSize: 20),),
                              const Text("de vous accueillir",style: TextStyle(color: Colors.green,fontSize: 20),)
                            ],
                          ),

                        ),
                      ],
                    ),
                  )
              ),
              Container(
                padding: const EdgeInsets.only(top:240),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Votre nom d'utilisateur",
                                hintText: 'Nom utilisateur',
                                border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                              ),
                                controller: nom,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "Erreur...";
                                }
                                return null;
                              }
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Votre nom complet',
                                hintText: 'Nom complet',
                                border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                              ),
                              controller: prenom,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "Erreur...";
                                }
                                return null;
                              }
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: TextFormField(
                            controller: date,
                            decoration: const InputDecoration(
                              labelText: 'Votre Date de Naissance',
                              hintText: 'Date de Naissance',
                              prefixIcon: Icon(Icons.calendar_today),
                              border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                            ),
                            readOnly: true,
                            onTap: (){
                              _selectedDate();
                            },
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "Erreur...";
                                }
                                return null;
                              }
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          padding: const EdgeInsets.only(left: 10,right: 10),
                          child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Votre Email',
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                              ),
                              controller: Email,
                              validator: (value){
                                if(value==null || value.isEmpty){
                                  return "Erreur...";
                                }
                                return null;
                              }
                          ),
                        ),
                        //SizedBox(height: 40,),
                        /*Container(
                          //padding: EdgeInsets.only(top: 10),
                          child: Text("Veuillez vous connecter à un réseau Wi-Fi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.red),)
                        ),*/
                        Container(
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(top: 100,left: 50),
                                child: TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>  const LSU()
                                      ),
                                    );
                                  },
                                  child: const Text("Go Out",style: TextStyle(color: Colors.green),),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(top: 100,left: 100),
                                child:ElevatedButton(
                                        onPressed: () async{
                                          if(_formKey.currentState!.validate()){

                                            name=nom.text;
                                            patient.nomutilisateur=name;

                                            pr=prenom.text;
                                            patient.Nomcomplet=pr;

                                            dat=date.text;
                                            patient.dateNaissance=dat;
                                            String valeur=await DataCheckAge(dat);
                                            ema=Email.text;
                                            patient.Email=ema;

                                            print(valeur.split(":")[2]);
                                            print("true");
                                            if(valeur.split(":")[2]==" true"){
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>  SignUpp2(
                                                      patient:patient
                                                  ),
                                                ),
                                              );
                                            }
                                            else{
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context){
                                                    return const AlertDialog(
                                                      title: Text("Votre âge est inadapté."),
                                                    );
                                                  }
                                              );
                                            }
                                          }
                                        },
                                          style: ButtonStyle(
                                          minimumSize: MaterialStateProperty.all(const Size(150, 60)),
                                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                                          backgroundColor: MaterialStateProperty.all(Colors.black12),

                                          ),
                                        child: const Text("Next",style: TextStyle(color: Colors.white),),
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