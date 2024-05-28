import 'package:flutter/material.dart';

import '../../../MVC/models/Patient.dart';
import '../../../MVC/models/PatientData.dart';
import 'TEST/graphePas.dart';


class SuiAct extends StatefulWidget {
  const SuiAct({super.key});

  @override
  State<SuiAct> createState() => _SuiActState();
}

class _SuiActState extends State<SuiAct> {
  Patient patient = PatientData().patient;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Suivie d'activité"),),
      body: Padding(
        padding: const EdgeInsets.only(top:100),
        child: Container(
          child: content(),
        ),
      ),
    );
  }

  Widget content(){
    return Container(
      child: Graphepas(),
    );
  }
}
