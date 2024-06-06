import 'package:flutter/material.dart';

import '../../../MVC/Controller/Controller.dart';
import '../../../MVC/models/Medicament.dart';
import '../../../MVC/models/PatientData.dart';

class MedPatient extends StatefulWidget {
  const MedPatient({super.key});

  @override
  State<MedPatient> createState() => _MedPatientState();
}

class _MedPatientState extends State<MedPatient> {
  final patient = PatientData().patient;
  late Future<List<Medicament?>> med;

  @override
  void initState() {
    super.initState();
    med = allMedicaments(patient.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<Medicament?>>(
          future: med,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Aucun médicament trouvé.'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final medicament = snapshot.data![index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.medication_liquid),
                      title: Text(medicament!.nom,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      subtitle: Text('${medicament.dose.toString()}ml -- ${medicament.date}'),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
