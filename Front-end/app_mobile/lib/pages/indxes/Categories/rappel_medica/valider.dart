

import 'package:app_mobile/pages/MVC/models/Medicament.dart';
import 'package:flutter/material.dart';
import 'package:app_mobile/pages/indxes/Categories/rappel_medica/rapp_med.dart';

import '../../../MVC/Controller/Controller.dart';

class Validerr extends StatelessWidget {
  final TextEditingController nomController;
  final TextEditingController doseController;
  final TextEditingController tempsController;

  const Validerr({
    super.key,
    required this.nomController,
    required this.doseController,
    required this.tempsController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Medicament medicament=new Medicament();
        medicament.nom=nomController.text;
        medicament.dose=int.parse(doseController.text);
        medicament.temps=tempsController.text;
        DataMedicament(medicament);
        /*Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return RappMed();
            }
        ));*/
      },
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.green,
        ),
        child: Center(
          child: Text(
            "Ajout",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ),
    );
  }
}