import 'package:flutter/material.dart';

class RendezVous extends StatefulWidget {
  const RendezVous({super.key});

  @override
  State<RendezVous> createState() => _RendezVousState();
}

class _RendezVousState extends State<RendezVous> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prenez un rendez-vous avec nos Médecins",style: TextStyle(
            fontSize: 15
        ),),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  leading: Image.asset("assets/imagesDoctor/1.jpg"),
                  title: Text('Jacklin Frenando'),
                  subtitle: Text("spécialiste en hématologie"),
                  trailing: Icon(Icons.info),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/imagesDoctor/2.jpg"),
                  title: Text('Arlando Torres'),
                  subtitle: Text("spécialiste en orthopédie "),
                  trailing: Icon(Icons.info),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/imagesDoctor/3.jpg"),
                  title: Text('Kibaro bourrada'),
                  subtitle: Text("spécialiste en rééducation fonctionnelle"),
                  trailing: Icon(Icons.info),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/imagesDoctor/7.jpg"),
                  title: Text('Boito arne'),
                  subtitle: Text("spécialiste en hématologie pédiatrique"),
                  trailing: Icon(Icons.info),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/imagesDoctor/8.jpg"),
                  subtitle: Text("spécialiste en chirurgie orthopédique"),
                  title: Text('Stephane Albert'),
                  trailing: Icon(Icons.info),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/imagesDoctor/6.jpg"),
                    subtitle: Text("spécialiste en physiothérapie"),
                  title: Text('Jacob Brikado'),
                  trailing: Icon(Icons.info),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/imagesDoctor/5.jpg"),
                  subtitle: Text("spécialiste en radiologie interventionnelle"),
                  title: Text('Ayhan Miki'),
                  trailing: Icon(Icons.info),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/imagesDoctor/9.jpg"),
                  subtitle: Text("spécialiste en orthopédie"),
                  title: Text('Paoula Etou'),
                  trailing: Icon(Icons.info),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/imagesDoctor/10.jpg"),
                  subtitle: Text("spécialiste en psychologue clinicienne"),
                  title: Text('Andrei Khrinanto'),
                  trailing: Icon(Icons.info),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset("assets/imagesDoctor/11.jpg"),
                  subtitle: Text("spécialiste en thérapie génique"),
                  title: Text('Afayn Hansika'),
                  trailing: Icon(Icons.info),
                ),
              ),Card(
                child: ListTile(
                  leading: Image.asset("assets/imagesDoctor/12.jpg"),
                  subtitle: Text("spécialiste en médecine régénérative"),
                  title: Text('Lucia Alger'),
                  trailing: Icon(Icons.info),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
