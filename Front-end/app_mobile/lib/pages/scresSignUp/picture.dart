import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';



class  Picture extends StatefulWidget {
  const Picture({super.key});

  @override
  State<Picture> createState() => _State();
}

class _State extends State<Picture> {
  /*Uint8List? _image;
  File? selectedIMage;*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                /*_image != null ?
                 CircleAvatar(
                  radius: 64,
                  backgroundImage: MemoryImage(_image!),
                ):*/
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: AssetImage("assets/images/photo.png"),
                ),
                Positioned(
                    child: IconButton(onPressed: (){/*_pickImageFromGallery();*/},icon: Icon(Icons.add_a_photo),),
                  bottom: -10,
                  left: 80,
                )
              ],
            )
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
