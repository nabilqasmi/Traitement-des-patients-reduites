import 'dart:typed_data';
import 'package:app_mobile/pages/MVC/models/Patient.dart';
import 'package:flutter/material.dart';
import '../indxes/PageLoginSignUp/login_sign_up.dart';
import 'formulaire.dart';

class  Picture1 extends StatefulWidget {
  final Patient patient;
  const Picture1({super.key,required this.patient});

  @override
  State<Picture1> createState() => _State(this.patient);
}

class _State extends State<Picture1> {
Uint8List? _image;
  /*void SelectedImage() async{
    Uint8List img=await pickImage(ImageSource.gallery);
    setState(() {
      _image=img;
    });
  }*/
  /*Uint8List? _image;
  File? selectedIMage;*/

  _State(Patient patient);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                _image != null ?
                 CircleAvatar(
                  radius: 64,
                  backgroundImage: MemoryImage(_image!),
                ):
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage("assets/images/photo.png"),
                ),
                Positioned(
                    child: IconButton(onPressed: /*SelectedImage*/(){},icon: Icon(Icons.add_a_photo),),
                  bottom: -10,
                  left: 80,
                ),
              ],

            ),
            Container(
              child: Row(
                children: [

                  Container(
                    padding: EdgeInsets.only(top: 400,left: 50),
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
                    padding: EdgeInsets.only(top: 400,left: 100),
                    child:ElevatedButton(
                      onPressed: () {
                        widget.patient.image="image.png";
                            /*print("Nom: "+widget.patient.nom);
                            print("Prenom: "+widget.patient.prenom);
                            print("Date: "+widget.patient.dateNaissance);
                            print("Email: "+widget.patient.Email);
                            print("Numero de telephone: "+widget.patient.numTele);
                            print("Adresse: "+widget.patient.adresse);
                            print("mot de passe: "+widget.patient.motpasse);*/
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  Formulaire(patient: widget.patient,),
                          ),
                        );
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
        ),
      ),
    );
  }
  /*Future _pickImageFromGallery()  async{
    final returnImage=
        await ImagePicker().pickImage(source: ImageSource.gallery);
        if(returnImage==null)return;
        setState(() {
          selectedIMage = File(returnImage.path);
          _image=File(returnImage.path).readAsBytesSync();
        });
  }*/
}
