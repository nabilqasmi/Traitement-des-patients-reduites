import 'package:http/http.dart' as http;

Getdate(String url)async{
  http.Response response= await http.get(Uri.parse(url));
  //recuperation des donnes
  return response.body;
}