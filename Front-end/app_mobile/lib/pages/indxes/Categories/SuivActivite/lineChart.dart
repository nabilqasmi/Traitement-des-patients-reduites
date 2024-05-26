import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'PricePoints.dart';

class LinecHART extends StatelessWidget {

  final List<PricePoint> points;
  const LinecHART(this.points,{Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(LineChartData(
        lineBarsData: [LineChartBarData(
          spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
          isCurved: false,
          dotData: FlDotData(
            show: true
          )
        )],
        baselineX: BorderSide.strokeAlignInside,
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                String text = '';
                switch (value.toInt()) {
                  case 0:
                    text ='Lundi';
                    break;
                  case 1:
                    text='Mardi';
                    break;
                  case 2:
                    text='Mercredi';
                    break;
                  case 3:
                    text='Jeudi';
                    break;
                  case 4:
                    text='Vendredi';
                    break;
                  case 5:
                    text='Samedi';
                    break;
                  case 6:
                    text='Dimanche';
                    break;
                }
                return Text(
                  text,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                );
              },

            ),
          )
        )
      )),

    );
  }
}
