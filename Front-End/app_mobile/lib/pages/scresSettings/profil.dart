import 'package:flutter/material.dart';

import '../MVC/models/Patient.dart';
import '../MVC/models/PatientData.dart';

class PatientInfoPage extends StatefulWidget {
  @override
  _PatientInfoPageState createState() => _PatientInfoPageState();
}

class _PatientInfoPageState extends State<PatientInfoPage> {
  Patient patient = PatientData().patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      "Nom d'utilisateur",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
                Text(
                  patient.nomutilisateur,
                  style: TextStyle(fontSize: 16),
                ),
                Divider(),
                Row(
                  children: [
                    Icon(Icons.person_outline, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Nom Complet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  patient.Nomcomplet,
                  style: TextStyle(fontSize: 16),
                ),
                Divider(),
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  patient.Email,
                  style: TextStyle(fontSize: 16),
                ),
                Divider(),
                Row(
                  children: [
                    Icon(Icons.lock, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      'Mot de passe',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  patient.motpasse,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
