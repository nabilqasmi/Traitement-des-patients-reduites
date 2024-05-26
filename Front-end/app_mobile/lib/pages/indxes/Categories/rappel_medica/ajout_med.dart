import 'package:flutter/material.dart';
import 'package:app_mobile/pages/indxes/Categories/rappel_medica/valider.dart';

class AjoutMed extends StatefulWidget {
  const AjoutMed({super.key});

  @override
  State<AjoutMed> createState() => _AjoutMedState();
}

class _AjoutMedState extends State<AjoutMed> {
  final nomMed = TextEditingController();
  final dose = TextEditingController();
  final temps = TextEditingController();

  @override
  void dispose() {
    nomMed.dispose();
    dose.dispose();
    temps.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 150),
                      child: Column(
                        children: [
                          Text(
                            "Les informations ",
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          ),
                          Text(
                            "sur l'ajout",
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          ),
                          Text(
                            "de medicament",
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 240),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 40),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nom de medicament',
                          hintText: 'medicament',
                          prefixIcon: Icon(Icons.medical_information),
                          border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                        ),
                        controller: nomMed,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'La dose à prendre',
                          hintText: 'La dose',
                          prefixIcon: Icon(Icons.medication_liquid),
                          border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                        ),
                        controller: dose,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Temps à prendre',
                          hintText: 'Temps',
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                        ),
                        controller: temps,
                      ),
                    ),
                    SizedBox(height: 20),
                    Validerr(
                      nomController: nomMed,
                      doseController: dose,
                      tempsController: temps,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}