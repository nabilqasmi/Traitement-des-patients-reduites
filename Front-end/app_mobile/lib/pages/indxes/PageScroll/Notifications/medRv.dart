import 'package:flutter/material.dart';

import '../../../MVC/Controller/Controller.dart';
import '../../../MVC/models/Medecin.dart';
import '../../../MVC/models/PatientData.dart';

class medRv extends StatefulWidget {
  const medRv({super.key});

  @override
  State<medRv> createState() => _medRvState();
}

class _medRvState extends State<medRv> {
  final patient = PatientData().patient;
  late Future<List<Medecin?>> meds;


  @override
  void initState() {
    super.initState();
    meds=allMedecin(patient.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<List<Medecin?>>(
          future: meds,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('Aucun médecin trouvé.'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final med = snapshot.data![index];
                  return Card(
                    child: ListTile(
                      leading:Image.asset(med!.image),
                      title: Text(med!.nom,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      subtitle: Text('${med.spe}'),
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
