import 'dart:io';
import 'package:app_mobile/pages/MVC/models/Patient.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../indxes/PageLoginSignUp/login_sign_up.dart';
import 'formulaire.dart';

class Picture1 extends StatefulWidget {
  final Patient patient;
  const Picture1({super.key, required this.patient});

  @override
  State<Picture1> createState() => _State(patient);
}

class _State extends State<Picture1> {
  File? _imageFile;

  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {

        _imageFile = File(result.files.single.path!);
      });
    } else {
      print('No file selected');
    }
  }

  _State(Patient patient);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo de Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                _imageFile != null
                    ? Container(
                  alignment: Alignment.center,
                      child: CircleAvatar(
                                        radius: 64,
                                        backgroundImage: FileImage(_imageFile!),
                                      ),
                    ) //
                    : Text(''),
                Container(
                  child: TextButton(
                    onPressed: pickImage,
                    child: _imageFile == null
                        ? Icon(
                      Icons.add_a_photo,
                      size: 70,
                      color: Colors.green,
                    )
                        : Container(), // Container vide si l'image est chargée
                  ),
                  ),
              ],
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 300, left: 50),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LSU()),
                        );
                      },
                      child: const Text(
                        "Go Out",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 300, left: 100),
                    child: ElevatedButton(
                      onPressed: () {
                        if(_imageFile==null){
                          widget.patient.image="assets/images/in.jpg";
                        }else{
                          widget.patient.image = '${_imageFile!.path}';
                          print(widget.patient.image);
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Formulaire(patient: widget.patient),
                          ),
                        );
                      },
                      style: ButtonStyle(
                        minimumSize:
                        MaterialStateProperty.all(const Size(150, 60)),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        backgroundColor:
                        MaterialStateProperty.all(Colors.black12),
                      ),
                      child: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
