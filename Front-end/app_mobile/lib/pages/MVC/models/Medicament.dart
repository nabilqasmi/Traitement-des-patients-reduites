class Medicament{
  String nom='';
  int dose=0;
  String temps='00:00';

  Medicament(){}

  set setnom(String nom){
    nom=nom;
  }

  set setdose(int dose){
    dose=dose;
  }

  set settemps(String temps){
    temps=temps;
  }

  get getnom{
    return nom;
  }

  get getdose{
    return dose;
  }

  get gettemps{
    return temps;
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'dose':dose,
      'temps':temps
    };
  }
}