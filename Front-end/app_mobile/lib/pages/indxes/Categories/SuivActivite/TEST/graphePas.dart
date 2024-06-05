import 'package:app_mobile/pages/MVC/Controller/Controller.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../MVC/models/PasParJour.dart';
import '../../../../MVC/models/Patient.dart';
import '../../../../MVC/models/PatientData.dart';
class Graphepas extends StatefulWidget {
  const Graphepas({super.key});

  @override
  State<Graphepas> createState() => _testState();
}

class _testState extends State<Graphepas> {

  Patient patient = PatientData().patient;
  TooltipBehavior? _tooltipBehavior;
  @override
  void initState(){
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Programme de la course/marche"),
      ),
        body: Column(
            children: [
              Container(
                      padding: const EdgeInsets.only(bottom: 100,left: 20,right: 20,top: 10),
                      child: SfCartesianChart(
                          primaryXAxis: const CategoryAxis(),
                          // Chart title
                          // Enable legend
                          legend: const Legend(isVisible: true),
                          // Enable tooltip
                          tooltipBehavior: _tooltipBehavior,
                          series: <LineSeries<PasParJourData, String>>[
                            LineSeries<PasParJourData, String>(
                              name: 'Pas Par Jour',
                                dataSource:  <PasParJourData>[PasParJourData('Lu',DataDict()[1]),
                                  PasParJourData('Mar', DataDict()[2]),
                                  PasParJourData('Mer', DataDict()[3]),
                                  PasParJourData('Jeu', DataDict()[4]),
                                  PasParJourData('Ven', DataDict()[5]),
                                  PasParJourData('Sam', DataDict()[6]),
                                  PasParJourData('Dim', DataDict()[7])
                                ],
                                xValueMapper: (PasParJourData Pas, _) => Pas.day,
                                yValueMapper: (PasParJourData Pas, _) => Pas.pasJour,
                                // Enable data label
                                dataLabelSettings: const DataLabelSettings(isVisible: true)
                            )
                          ]
                      )
                  ),
                Container(child: Text('Votre poids est ${patient.poids}')),
                Container(
                        child: FutureBuilder<int>(future:Age(patient.nomutilisateur) ,
                        builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                          if(snapshot.hasData){
                                      return Text('Votre age est ${snapshot.data}');
                               }
                          else{
                            return Text("Null");
                          }
                            },),),
                Container(child: const Text("Cher patient, ce graphique montre les objectifs",style: TextStyle(fontWeight: FontWeight.bold),),),
              Container(child: const Text("quotidiens de pas à atteindre pour rester en bonne",style: TextStyle(fontWeight: FontWeight.bold),),),
                Container(child: const Text(" santé. Suivez ces recommandations pour ",style: TextStyle(fontWeight: FontWeight.bold),),),
                Container(child: const Text("maintenir votre forme physique !",style: TextStyle(fontWeight: FontWeight.bold),),),
            ],
        )

    );
  }
}

class PasParJourData {
  PasParJourData(this.day, this.pasJour);
  final String day;
  final double pasJour;
}

List<double> DataDict(){
  List<double> tabl=[0];
  Map<String,int> dict = PasParJour().dict;
  print(dict);
  Iterable<int> valeurs = dict.values;
  if(dict.keys is !int){
    for (int valeur in valeurs) {
      tabl.add(double.parse('$valeur'));
    }
  }
  for (int valeur in valeurs) {
    tabl.add(double.parse('$valeur'));
  }
  return tabl;
}


Future<int> Age(String nomu) async{

  int valeur=await Agee(nomu);
  return valeur;
}

