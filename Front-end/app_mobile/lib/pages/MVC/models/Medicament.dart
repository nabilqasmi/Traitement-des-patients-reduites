class Medicament{
  int id=0;
  String nom='';
  int dose=0;
  String date='';
  String time='';
  int idPatient=0;

  Medicament();

  set setnom(String nom){
    nom=nom;
  }

  set setdose(int dose){
    dose=dose;
  }

  get getnom{
    return nom;
  }

  get getid{
    return id;
  }

  get getidPatient{
    return idPatient;
  }

  set setIdPatient(int idPatient) {
    idPatient=idPatient;
  }

  get getdose{
    return dose;
  }

  get getdate{
    return date;
  }

  get gettime{
    return time;
  }

  set settime(String time){
    time=time;
  }

  set setdate(String date){
    date=date;
  }
  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'dose':dose,
      'date':date,
      'time':time,
      'idpatient':idPatient
    };
  }

  factory Medicament.fromJson(Map<String, dynamic> json) {
    //print(json);
    Medicament medicament = Medicament();
    medicament.id=json['id'] ?? 0;
    medicament.dose=json['dose'] ?? '';
    medicament.idPatient=json['idPatient'] ?? '';
    medicament.nom=json['nom'] ?? '';
    medicament.date=json['Date'] ?? '';
    medicament.time=json['time'] ?? '';
    return medicament;
  }


  @override
  String toString() {
    // TODO: implement toString
    return "nom de medicament: ${this.nom} la dose: ${this.dose} la date: ${this.date}le time:${this.time}";
  }
}