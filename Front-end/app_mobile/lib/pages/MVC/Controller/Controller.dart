import 'package:app_mobile/pages/MVC/models/Medecin.dart';
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

Future<void> deleteMed(String nomMed,int idPatient) async {
  var url = Uri.parse('http://10.0.2.2:5000/suppMedicament');

  var deletepatient = jsonEncode({
    'nomMed': nomMed,
    'IdPatient': idPatient,
  });

  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: deletepatient,
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
    'nomutilisateur': nom,
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
  print(nom);
  // Créez un objet JSON avec les données de connexion
  var logOutData = jsonEncode({
    'nomutilisateur': nom,
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


Future<String> DataCheckAge(String dateNaissance) async {
  var url = Uri.parse('http://10.0.2.2:5000/checkAge');
  var checkAgeData = jsonEncode({'dateNaissance': dateNaissance});

  try {
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: checkAgeData,
    );

    if (response.statusCode == 200) {
      final check = jsonDecode(response.body);
      return 'Age: ${check['age']}, Valid: ${check['valid']}';
    } else {
      return 'Erreur: ${response.body}';
    }
  } catch (e) {
    print('Erreur lors de la connexion au serveur: $e');
    return "false";
  }
}


Future<String> DataCheckPatient(int id) async {
  var url = Uri.parse('http://10.0.2.2:5000/DecisinoPatient');
  var checkDataPatient = jsonEncode({'Id': id});

  try {
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: checkDataPatient,
    );

    //print(response.body);
    return response.body;
  } catch (e) {
    print('Erreur lors de la connexion au serveur: $e');
    return "false";
  }
}

Future<Patient?> DataLastPatient() async {
  var url = Uri.parse('http://10.0.2.2:5000/lastPatient');

  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );
    final patientjson = jsonDecode(response.body);
    Patient patient=Patient.fromJson(patientjson);
    //print(patient.id);
    return patient;
  } catch (e) {
    print('Erreur lors de la connexion au serveur: $e');
  }
  return Patient();
}


Future<List<Medicament?>> allMedicaments(int id) async {
  var url = Uri.parse('http://10.0.2.2:5000/allMedicaments');

  // Créez un objet JSON avec les données de connexion
  var AllMed = jsonEncode({
    'Id': id,
  });
  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: AllMed,
    );
    List<Medicament> allMedicaments= [];
    final  med= jsonDecode(response.body);
    for (var i in med){
      Medicament med=Medicament.fromJson(i);
      //print(med);
      allMedicaments.add(med);
    }
    return allMedicaments;
  } catch (e) {
    print('Erreur lors de la connexion au serveur: $e');
  }
  return [];
}


Future<String> DataCheckPoids(String poids) async {
  var url = Uri.parse('http://10.0.2.2:5000/checkPoids');
  var checkPoidsData = jsonEncode({'poids': poids});

  try {
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: checkPoidsData,
    );

    if (response.statusCode == 200) {
      final check = jsonDecode(response.body);
      return 'poids: ${check['poids']}, Valid: ${check['valid']}';
    } else {
      return 'Erreur: ${response.body}';
    }
  } catch (e) {
    print('Erreur lors de la connexion au serveur: $e');
    return "false";
  }
}

Future<int> Agee(String nomu) async {
  var url = Uri.parse('http://10.0.2.2:5000/Age');
  var checkPoidsData = jsonEncode({'nomUti': nomu});

  try {
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: checkPoidsData,
    );

    if (response.statusCode == 200) {
      final check=jsonDecode(response.body);
      int result=check['age'];
      return result;
    } else {
      return -1;
    }
  } catch (e) {
    print('Erreur lors de la connexion au serveur: $e');
    return -1;
  }
}

Future<void> DataMedecin(Medecin med) async {
  var url = Uri.parse('http://10.0.2.2:5000/addmedecin');

  // Convertissez l'objet patient en JSON
  var medJson = jsonEncode(med.toJson());
  print(medJson);
  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: medJson,
    );
  } catch (e) {
    print('Erreur lors de la connexion au serveur: $e');
  }
}


Future<List<Medecin?>> allMedecin(int id) async {
  var url = Uri.parse('http://10.0.2.2:5000/allmedecin');
  //print(id);
  // Créez un objet JSON avec les données de connexion
  var AllMed = jsonEncode({
    'Id': id,
  });
  try {
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: AllMed,
    );
    List<Medecin> allMed= [];
    final  med= jsonDecode(response.body);

    for (var i in med){
      //print(i);
      Medecin meed=Medecin.fromJson(i);
      print(meed);
      allMed.add(meed);
    }
    return allMed;
  } catch (e) {
    print('Erreur lors de la connexion au serveur: $e');
  }
  return [];
}