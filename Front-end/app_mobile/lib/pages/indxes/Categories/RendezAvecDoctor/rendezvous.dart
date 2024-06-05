import 'package:app_mobile/pages/MVC/models/Medecin.dart';
import 'package:flutter/material.dart';

import '../../../MVC/Controller/Controller.dart';
import '../../../MVC/models/Patient.dart';
import '../../../MVC/models/PatientData.dart';

class RendezVous extends StatefulWidget {
  const RendezVous({super.key});

  @override
  State<RendezVous> createState() => _RendezVousState();
}

class _RendezVousState extends State<RendezVous> {
  var image='';
  var nom='';
  var spe='';
  Patient patient = PatientData().patient;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prenez un rendez-vous avec nos Médecins",style: TextStyle(
            fontSize: 15
        ),),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              TextButton(
                onPressed:(){
                  nom= 'Jacklin Frenando';
                  spe='spécialiste en hématologie';
                  image='assets/imagesDoctor/1.jpg';
                  Medecin med=Medecin();
                  med.nom=nom;
                  med.spe=spe;
                  med.image=image;
                  med.idPatient=patient.id;
                  DataMedecin(med);
                  /*print(nom);
                  print(spe);
                  print(image);*/
              },
                child: Card(
                  child: ListTile(
                    leading: Image.asset("assets/imagesDoctor/1.jpg"),
                    title: const Text('Jacklin Frenando'),
                    subtitle: const Text("spécialiste en hématologie"),
                    trailing: const Icon(Icons.info),
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  nom= 'Arlando Torres';
                  spe='spécialiste en orthopédie';
                  image='assets/imagesDoctor/2.jpg';
                  Medecin med=Medecin();
                  med.nom=nom;
                  med.spe=spe;
                  med.image=image;
                  med.idPatient=patient.id;
                  DataMedecin(med);
                },
                child: Card(
                  child: ListTile(
                    leading: Image.asset("assets/imagesDoctor/2.jpg"),
                    title: const Text('Arlando Torres'),
                    subtitle: const Text("spécialiste en orthopédie "),
                    trailing: const Icon(Icons.info),
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  nom= 'Kibaro bourrada';
                  spe='spécialiste en rééducation fonctionnelle';
                  image='assets/imagesDoctor/3.jpg';
                  Medecin med=Medecin();
                  med.nom=nom;
                  med.spe=spe;
                  med.image=image;
                  med.idPatient=patient.id;
                  DataMedecin(med);
                },
                child: Card(
                  child: ListTile(
                    leading: Image.asset("assets/imagesDoctor/3.jpg"),
                    title: const Text('Kibaro bourrada'),
                    subtitle: const Text("spécialiste en rééducation fonctionnelle"),
                    trailing: const Icon(Icons.info),
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  nom= 'Boito arne';
                  spe='spécialiste en hématologie pédiatrique';
                  image='assets/imagesDoctor/7.jpg';
                  Medecin med=Medecin();
                  med.nom=nom;
                  med.spe=spe;
                  med.image=image;
                  med.idPatient=patient.id;
                  DataMedecin(med);
                },
                child: Card(
                  child: ListTile(
                    leading: Image.asset("assets/imagesDoctor/7.jpg"),
                    title: const Text('Boito arne'),
                    subtitle: const Text("spécialiste en hématologie pédiatrique"),
                    trailing: const Icon(Icons.info),
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  nom= 'Stephane Albert';
                  spe='spécialiste en chirurgie orthopédique';
                  image='assets/imagesDoctor/8.jpg';
                  Medecin med=Medecin();
                  med.nom=nom;
                  med.spe=spe;
                  med.image=image;
                  med.idPatient=patient.id;
                  DataMedecin(med);
                },
                child: Card(
                  child: ListTile(
                    leading: Image.asset("assets/imagesDoctor/8.jpg"),
                    subtitle: const Text("spécialiste en chirurgie orthopédique"),
                    title: const Text('Stephane Albert'),
                    trailing: const Icon(Icons.info),
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  nom= 'Jacob Brikado';
                  spe='spécialiste en physiothérapie';
                  image='assets/imagesDoctor/6.jpg';
                  Medecin med=Medecin();
                  med.nom=nom;
                  med.spe=spe;
                  med.image=image;
                  med.idPatient=patient.id;
                  DataMedecin(med);
                },
                child: Card(
                  child: ListTile(
                    leading: Image.asset("assets/imagesDoctor/6.jpg"),
                      subtitle: const Text("spécialiste en physiothérapie"),
                    title: const Text('Jacob Brikado'),
                    trailing: const Icon(Icons.info),
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  nom= 'Ayhan Miki';
                  spe='spécialiste en radiologie interventionnelle';
                  image='assets/imagesDoctor/5.jpg';
                  Medecin med=Medecin();
                  med.nom=nom;
                  med.spe=spe;
                  med.image=image;
                  med.idPatient=patient.id;
                  DataMedecin(med);
                },
                child: Card(
                  child: ListTile(
                    leading: Image.asset("assets/imagesDoctor/5.jpg"),
                    subtitle: const Text("spécialiste en radiologie interventionnelle"),
                    title: const Text('Ayhan Miki'),
                    trailing: const Icon(Icons.info),
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  nom= 'Paoula Etou';
                  spe='spécialiste en orthopédie';
                  image='assets/imagesDoctor/9.jpg';
                  Medecin med=Medecin();
                  med.nom=nom;
                  med.spe=spe;
                  med.image=image;
                  med.idPatient=patient.id;
                  DataMedecin(med);
                },
                child: Card(
                  child: ListTile(
                    leading: Image.asset("assets/imagesDoctor/9.jpg"),
                    subtitle: const Text("spécialiste en orthopédie"),
                    title: const Text('Paoula Etou'),
                    trailing: const Icon(Icons.info),
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  nom= 'Andrei Khrinanto';
                  spe='spécialiste en psychologue clinicienne';
                  image='assets/imagesDoctor/10.jpg';
                  Medecin med=Medecin();
                  med.nom=nom;
                  med.spe=spe;
                  med.image=image;
                  med.idPatient=patient.id;
                  DataMedecin(med);
                },
                child: Card(
                  child: ListTile(
                    leading: Image.asset("assets/imagesDoctor/10.jpg"),
                    subtitle: const Text("spécialiste en psychologue clinicienne"),
                    title: const Text('Andrei Khrinanto'),
                    trailing: const Icon(Icons.info),
                  ),
                ),
              ),
              TextButton(
                onPressed: (){
                  nom= 'Afayn Hansika';
                  spe='spécialiste en thérapie génique';
                  image='assets/imagesDoctor/11.jpg';
                  Medecin med=Medecin();
                  med.nom=nom;
                  med.spe=spe;
                  med.image=image;
                  med.idPatient=patient.id;
                  DataMedecin(med);
                },
                child: Card(
                  child: ListTile(
                    leading: Image.asset("assets/imagesDoctor/11.jpg"),
                    subtitle: const Text("spécialiste en thérapie génique"),
                    title: const Text('Afayn Hansika'),
                    trailing: const Icon(Icons.info),
                  ),
                ),
              ),TextButton(
                onPressed: (){
                  nom= 'Lucia Alger';
                  spe='spécialiste en médecine régénérative';
                  image='assets/imagesDoctor/12.jpg';
                  Medecin med=Medecin();
                  med.nom=nom;
                  med.spe=spe;
                  med.image=image;
                  med.idPatient=patient.id;
                  DataMedecin(med);
                },
                child: Card(
                  child: ListTile(
                    leading: Image.asset("assets/imagesDoctor/12.jpg"),
                    subtitle: const Text("spécialiste en médecine régénérative"),
                    title: const Text('Lucia Alger'),
                    trailing: const Icon(Icons.info),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
