import 'dart:developer';

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
  final date = TextEditingController();
  final time=TextEditingController();

  @override
  void dispose() {
    nomMed.dispose();
    dose.dispose();
    date.dispose();
    time.dispose();
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
                      padding: const EdgeInsets.only(top: 150),
                      child: const Column(
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
              padding: const EdgeInsets.only(top: 240),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Nom de medicament',
                          hintText: 'medicament',
                          prefixIcon: Icon(Icons.medical_information),
                          border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                        ),
                        controller: nomMed,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'La dose à prendre',
                          hintText: 'La dose',
                          prefixIcon: Icon(Icons.medication_liquid),
                          border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                        ),
                        controller: dose,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'date à prendre',
                          hintText: 'yyyy-mm-jj',
                          prefixIcon: Icon(Icons.date_range),
                          border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                        ),
                        controller:date,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'time à prendre',
                          hintText: 'HH:MM:SS',
                          prefixIcon: Icon(Icons.timer_outlined),
                          border: OutlineInputBorder(borderSide: BorderSide(width: 10)),
                        ),
                        controller:time,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Validerr(
                      nomController: nomMed,
                      doseController: dose,
                      date: date,
                      time: time,
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