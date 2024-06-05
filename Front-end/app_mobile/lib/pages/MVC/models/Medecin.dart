class Medecin{
  String nom='';
  String spe='';
  String image='';
  int idPatient=0;

  Medecin();

  set setnom(String nom){
    nom=nom;
  }

  get getnom{
    return nom;
  }

  get getidPatient{
    return idPatient;
  }
  set setidPatient(int idPatient){
     idPatient=idPatient;
  }

  get getimage{
    return image;
  }
  set setimage(String image){
     image=image;
  }
  get getspe{
    return spe;
  }
  set setspe(String spe){
     spe=spe;
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'spe':spe,
      'image':image,
      'idpatient':idPatient
    };
  }
//{IdP: 91, image: assets/imagesDoctor/2.jpg, nom: Arlando Torres, specialite: spécialiste en orthopédie}
  factory Medecin.fromJson(Map<String, dynamic> json) {
    print(json);
    Medecin medecin = Medecin();
    medecin.idPatient=json['IdP'] ?? 0;
    medecin.image=json['image'] ?? '';
    medecin.nom=json['nom'] ?? '';
    medecin.spe=json['specialite'] ?? '';
    return medecin;
  }


  /*@override
  String toString() {
    // TODO: implement toString
    return "nom de medicament: ${this.nom} la dose: ${this.dose} la date: ${this.date}le time:${this.time}";
  }*/
}