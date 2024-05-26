import 'package:app_mobile/pages/MVC/models/Medicament.dart';
import 'package:app_mobile/pages/MVC/models/Patient.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> DataPatient(Patient patient) async {
  var url = Uri.parse('http://10.0.2.2:5000/AddPatients');

  // Convertissez l'objet patient en JSON
  var patientJson = jsonEncode(patient.toJson());

  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: patientJson,
    );
  } catch (e) {
    print('Erreur lors de la connexion au serveur: $e');
  }
}

Future<void> DataMedicament(Medicament medi) async {
  var url = Uri.parse('http://10.0.2.2:5000/AddMedicament');

  // Convertissez l'objet patient en JSON
  var medicamentJson = jsonEncode(medi.toJson());
  print(medicamentJson);
  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: medicamentJson,
    );
  } catch (e) {
    print('Erreur lors de la connexion au serveur: $e');
  }
}

Future<Patient?> DataLogin(String nom, String mdp) async {
  var url = Uri.parse('http://10.0.2.2:5000/LogIn');

  // Créez un objet JSON avec les données de connexion
  var loginData = jsonEncode({
    'nom': nom,
    'mdp': mdp,
  });

  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: loginData,
    );
    final patientjson = jsonDecode(response.body);
    return Patient.fromJson(patientjson);
  } catch (e) {
    print('Erreur lors de la connexion au serveur: $e');
  }
  return null;
}


Future<Patient?> DataLogOut(String gmail, String mdp) async {
  var url = Uri.parse('http://10.0.2.2:5000/LogOut');

  // Créez un objet JSON avec les données de connexion
  var logOutData = jsonEncode({
    'gmail': gmail,
    'mdp': mdp,
  });

  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: logOutData,
    );

    final patientjson = jsonDecode(response.body);
    return Patient.fromJson(patientjson);
  } catch (e) {
    print('Erreur lors de la connexion au serveur: $e');
    return null; // Retourne null en cas d'erreur
  }
}


Future<Map<String, int>?> DataSuiveActivite(String nom) async {
  var url = Uri.parse('http://10.0.2.2:5000/PasParJourS');

  // Créez un objet JSON avec les données de connexion
  var logOutData = jsonEncode({
    'nom': nom,
  });

  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: logOutData,
    );

    if (response.statusCode == 200) {
      // Décoder le corps de la réponse JSON en Map
      Map<String, dynamic> data = jsonDecode(response.body);
      // Convertir les valeurs en int
      Map<String, int> nombreDePas = data.map((key, value) => MapEntry(key, value as int));
      return nombreDePas;
    } else {
      print('Erreur de réponse du serveur: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Erreur lors de la connexion au serveur: $e');
    return null; // Retourne null en cas d'erreur
  }
}