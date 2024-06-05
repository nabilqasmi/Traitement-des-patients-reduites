

import 'package:app_mobile/pages/MVC/models/Medicament.dart';
import 'package:app_mobile/pages/indxes/Categories/rappel_medica/rapp_med.dart';
import 'package:flutter/material.dart';

import '../../../MVC/Controller/Controller.dart';
import '../../../MVC/models/Patient.dart';
import '../../../MVC/models/PatientData.dart';
import '../../PageScroll/home.dart';
import '../../PageScroll/scroll_page.dart';

class Validerr extends StatefulWidget {
  final TextEditingController nomController;
  final TextEditingController doseController;
  final TextEditingController date;
  final TextEditingController time;

  const Validerr({
    super.key,
    required this.nomController,
    required this.doseController,
    required this.date,
    required this.time
  });

  @override
  State<Validerr> createState() => _ValiderrState();
}

class _ValiderrState extends State<Validerr> {
  Patient patient = PatientData().patient;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        Medicament medicament=Medicament();
        medicament.nom=widget.nomController.text;
        medicament.dose=int.parse(widget.doseController.text);
        medicament.date=widget.date.text;
        medicament.time=widget.time.text;
        medicament.idPatient=patient.id;
        //print(medicament.idPatient);
        //print('${patient.id}');
        print(medicament.nom);
        print(medicament.dose);
        print(medicament.date);
        print(medicament.time);
        DataMedicament(medicament);
        //print(patient.id);
        //med= await allMedicaments(patient.id);
        //print(patient.id);
        /*List<Medicament?> med;
        med= await allMedicaments(patient.id);*/
        Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return ScrollPage();
            }
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
          color: Colors.green,
        ),
        child: const Center(
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