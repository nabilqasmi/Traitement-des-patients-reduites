from dataclasses import dataclass

@dataclass
class Patients:
    id:int
    nom : str
    prenom :str
    Date_Naissance :str
    email : str
    num_tel : str
    adresse :  str
    mdp : str
    image : str
    GR_S : str
    taille : str
    poids : str
    sexe :  str
    antecedant_mere :str
    antecedant_pere:str
  
    def to_dict(self):
        return {
            "id": self.id,
            "nom": self.nom,
            "prenom":self.prenom,
            "Date_Naissance":self.Date_Naissance,
            "email":self.email,
            "num_tel":self.num_tel,
            "adresse":self.adresse,
            "mdp": self.mdp,
            "image":self.image,
            "GR_S":self.GR_S,
            "taille":self.taille,
            "poids":self.poids,
            "sexe":self.sexe,
            "antecedant_mere":self.antecedant_mere,
            "antecedant_pere":self.antecedant_pere
        }



@dataclass
class Medicament:
    nom: str
    dose: int
    temps: str
    idPatient:int
