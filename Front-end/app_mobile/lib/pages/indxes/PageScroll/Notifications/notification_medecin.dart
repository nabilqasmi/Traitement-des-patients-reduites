import 'package:flutter/material.dart';

import '../../../MVC/Controller/Controller.dart';
import '../../../MVC/models/Medecin.dart';
import '../../../MVC/models/Medicament.dart';
import '../../../MVC/models/PatientData.dart';
import 'medRv.dart';
import 'medipatient.dart';

class NotificationMedcin extends StatefulWidget {
  const NotificationMedcin ({super.key});

  @override
  State<NotificationMedcin> createState() => _NotificationMedcinState();
}

class _NotificationMedcinState extends State<NotificationMedcin> {
  /*final patient = PatientData().patient;
  late Future<List<Medicament?>> med;
  late Future<List<Medecin?>> meds;
  @override
  void initState() {
    super.initState();
    //med = allMedicaments(patient.id);
    meds=allMedecin(patient.id);
  }*/

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                child: ImageIcon(
                  AssetImage("assets/images/appMedecine.png"),
                  color: Colors.green,
                ),
              ),
              Tab(
                child: ImageIcon(
                  AssetImage("assets/images/notMed.png"),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Premier onglet
            medRv(),
            // Deuxième onglet
            MedPatient(),
          ],
        ),
      ),
    );
  }
}
