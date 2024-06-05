class Patient{
  int id=0;
  String nomutilisateur='';
  String Nomcomplet='';
  String dateNaissance='';
  String Email='';
  String image='';
  String numTele='';
  String adresse='';
  String motpasse='';
  String GroupeSangin='';
  String taille='';
  String poids='';
  String sexe='';
  String anteHemomere='';
  String anteHemopere='';
  Patient();



  set setanteHemopere(String anteHemopere){
    anteHemopere=anteHemopere;
  }
  set setanteHemomere(String anteHemomere){
    anteHemomere=anteHemomere;
  }
  set setsexe(String sexe){
    sexe=sexe;
  }
  set setpoids(String poids){
    poids=poids;
  }
  set settaille(String taille){
    taille=taille;
  }
  set setGrpSang(String grpSang){
    grpSang=GroupeSangin;
  }
  set setnomutilisateur(String nomutilisateur){
    nomutilisateur=nomutilisateur;
  }

  set setNomcomplet(String Nomcomplet){
    Nomcomplet=Nomcomplet;
  }

  set setdateNaissance(String dateNaissance){
    dateNaissance=dateNaissance;
  }

  set setEmail(String Email){
    Email=Email;
  }

  set setnumTele(String numTele){
    numTele=numTele;
  }

  set setadresse(String adresse){
    adresse=adresse;
  }

  set setmotpasse(String motpasse){
    motpasse=motpasse;
  }

  set setimage(String image){
    image=image;
  }


  String get getnomutilisateur { // Getter method
    return nomutilisateur;
  }

  String get getNomcomplet{
    return Nomcomplet;
  }

  String get getDateNaissance{
    return dateNaissance;
  }

  String get getEmail{
    return Email;
  }

  String get getImage{
    return image;
  }

  String get getNumTele{
    return numTele;
  }

  String get getAdresse{
    return adresse;
  }

  String get getmotpasse{
    return motpasse;
  }

  String get getGrSa{
    return GroupeSangin;
  }
  String get getTaille{
    return taille;
  }

  String get getPoids{
    return poids;
  }

  String get getsexe{
    return sexe;
  }

  String get getanteHemomere{
    return anteHemomere;
  }

  String get getanteHemopere{
    return anteHemopere;
  }

  Map<String, dynamic> toJson() {
    return {
      'nomutilisateur': nomutilisateur,
      'Nomcomplet': Nomcomplet,
      'Date_Naissance': dateNaissance, // Assurez-vous que cela correspond en Python
      'email': Email,
      'num_tel': numTele, // Assurez-vous que cela correspond en Python
      'adresse': adresse,
      'mdp': motpasse, // Assurez-vous que cela correspond en Python
      'image': image,
      'GR_S': GroupeSangin, // Assurez-vous que cela correspond en Python
      'taille': taille,
      'poids': poids,
      'sexe': sexe,
      'antecedant_mere': anteHemomere, // Assurez-vous que cela correspond en Python
      'antecedant_pere': anteHemopere // Assurez-vous que cela correspond en Python
    };
  }

  factory Patient.fromJson(Map<String, dynamic> json) {
    Patient patient = Patient();
    patient.id=json['id'] ?? 0;
    patient.nomutilisateur = json['nomutilisateur'] ?? '';
    patient.Nomcomplet=json['Nomcomplet'] ?? '';
    patient.dateNaissance=json['Date_Naissance'] ?? '';
    patient.Email=json['email'] ?? '';
    patient.numTele=json['num_tel'] ?? '';
    patient.adresse=json['adresse'] ?? '';
    patient.motpasse=json['mdp'] ?? '';
    patient.image=json['image'] ?? '';
    patient.GroupeSangin=json['GR_S'] ?? '';
    patient.taille=json['taille'] ?? '';
    patient.poids=json['poids'] ?? '';
    patient.sexe=json['sexe'] ?? '';
    patient.anteHemomere=json['antecedant_mere'] ?? '';
    patient.anteHemopere=json['antecedant_pere'] ?? '';
    return patient;
  }
}