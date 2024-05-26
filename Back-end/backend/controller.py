from flask import Flask,session,request,redirect,url_for,render_template,jsonify
from services import patientServices,MedicamentService
from models import Patients,Medicament

app=Flask(__name__)


#Les routes

#Avoir une page qui sa form method=POST la methode POST
@app.route('/AddPatients', methods=['POST'])
def addPatients():
  patient_data = request.get_json()
  patient = Patients(id=0,nom=patient_data['nom'],prenom=patient_data['prenom'],Date_Naissance=patient_data['Date_Naissance'],email=patient_data['email'],num_tel=patient_data['num_tel'],adresse=patient_data['adresse'],mdp=patient_data['mdp'],image=patient_data['image'],GR_S=patient_data['GR_S'],taille=patient_data['taille'],poids=patient_data['poids'],sexe=patient_data['sexe'],antecedant_mere=patient_data['antecedant_mere'],antecedant_pere=patient_data['antecedant_pere'])
  return patientServices.addPatients(patient)

#Avoir une page qui sa form method=DELETE la methode DELETE
@app.route('/DeletePatients/<id>',methods=['DELETE'])
def DeletePatients(id:int):
  return patientServices.deletePatients(id)


#Avoir une page qui sa form method=POST la methode POST
@app.route('/ModifyPatients/<nom>/',methods=['POST'])
def ModifyPatients(nom:str,mdp:str):
  if request.method=='POST':
    return patientServices.ModifyPatients(nom,mdp)

@app.route('/LogIn', methods=['POST'])
def LogIn():
    data = request.get_json()
    nom = data.get('nom')
    mdp = data.get('mdp')
    patient=patientServices.LogIn(nom, mdp)
    return jsonify(patient.to_dict())


@app.route('/AddMedicament', methods=['POST'])
def addMedicament():
  Medicement_data = request.get_json()
  print(Medicement_data)
  medicament= Medicament(**Medicement_data)
  return MedicamentService.ajouterMedicament(medicament)


@app.route('/suppMedicament/<Nom>', methods=['delete'])
def deletemedicament(Nom: str):
  medicament=MedicamentService.searchMed(Nom)
  """Medicement_data = request.get_json()
  medicament= Medicament(**Medicement_data)"""
  return MedicamentService.deletemedicament(medicament)

@app.route('/LogOut',methods=['POST'])
def Logout():
  data=request.get_json()
  gmail=data.get('gmail')
  mdp=data.get('mdp')
  patient=patientServices.LogOut(gmail, mdp)
  return jsonify(patient.to_dict())


@app.route('/PasParJourS',methods=['POST'])
def PasParJourS():
  data=request.get_json()
  nom=data.get('nom')
  return patientServices.pasParJours(patientServices.calculate_age(patientServices.patient_age(nom)))
 

"""@app.route('/DecisinoPatient/<id>',methods=['GET'])
def DecisinoPatient(id:int):
  return patientServices.DecisinoPatient(id)"""

if __name__=='__main__':
  app.run(debug=True)