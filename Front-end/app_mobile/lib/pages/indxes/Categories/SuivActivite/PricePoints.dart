import 'package:app_mobile/pages/MVC/models/PasParJour.dart';
import 'package:collection/collection.dart';

class PricePoint{
  final double x;
  final double y;
  PricePoint({required this.x,required this.y});
}

List<PricePoint> get pricePoints{
  Map<String,int> dict = PasParJour().dict;
  print(dict);
  Iterable<int> valeurs = dict.values;
  var data=<double>[];
  for (int valeur in valeurs) {
    data.add(double.parse('$valeur'));
  }

  return data.mapIndexed(((index,element)=>PricePoint(x: index.toDouble(), y: element))).toList();
}