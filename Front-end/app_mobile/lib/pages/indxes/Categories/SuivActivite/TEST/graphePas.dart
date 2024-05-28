import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../MVC/models/PasParJour.dart';
class Graphepas extends StatefulWidget {
  const Graphepas({super.key});

  @override
  State<Graphepas> createState() => _testState();
}

class _testState extends State<Graphepas> {

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
        title: Text("Programme de la course/marche"),
      ),
        body: Column(
            children: [
              Container(
                      padding: EdgeInsets.only(bottom: 100,left: 20,right: 20,top: 10),
                      child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          // Chart title
                          // Enable legend
                          legend: Legend(isVisible: true),
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
                                dataLabelSettings: DataLabelSettings(isVisible: true)
                            )
                          ]
                      )
                  ),
                //  '
                Container(child: Text("Cher patient, ce graphique montre les objectifs",style: TextStyle(fontWeight: FontWeight.bold),),),
              Container(child: Text("quotidiens de pas à atteindre pour rester en bonne",style: TextStyle(fontWeight: FontWeight.bold),),),
                Container(child: Text(" santé. Suivez ces recommandations pour ",style: TextStyle(fontWeight: FontWeight.bold),),),
                Container(child: Text("maintenir votre forme physique !",style: TextStyle(fontWeight: FontWeight.bold),),),
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
  for (int valeur in valeurs) {
    tabl.add(double.parse('$valeur'));
  }
  return tabl;
}

