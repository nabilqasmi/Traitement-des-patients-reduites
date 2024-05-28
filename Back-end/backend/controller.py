from flask import Flask,request,jsonify
from services import patientServices,MedicamentService
from models import Patients,Medicament

app=Flask(__name__)


#Les routes

#Avoir une page qui sa form method=POST la methode POST
@app.route('/AddPatients', methods=['POST'])
def addPatients():
  patient_data = request.get_json()
  print(patient_data)
  patient = Patients(id=0,nomutilisateur=patient_data['nomutilisateur'],Nomcomplet=patient_data['Nomcomplet'],Date_Naissance=patient_data['Date_Naissance'],email=patient_data['email'],num_tel=patient_data['num_tel'],adresse=patient_data['adresse'],mdp=patient_data['mdp'],image=patient_data['image'],GR_S=patient_data['GR_S'],taille=patient_data['taille'],poids=patient_data['poids'],sexe=patient_data['sexe'],antecedant_mere=patient_data['antecedant_mere'],antecedant_pere=patient_data['antecedant_pere'])
  return patientServices.addPatients(patient)
  

#Avoir une page qui sa form method=DELETE la methode DELETE
@app.route('/DeletePatients/<id>',methods=['DELETE'])
def DeletePatients(id:int):
  return patientServices.deletePatients(id)


#Avoir une page qui sa form method=POST la methode POST
@app.route('/ModifyPatients/<nom>/',methods=['POST'])
def ModifyPatients(nom:str,mdp:str):
    return patientServices.ModifyPatients(nom,mdp)

@app.route('/LogIn', methods=['POST'])
def LogIn():
    data = request.get_json()
    print(data)
    nomutilisateur = data.get('nomutilisateur')
    mdp = data.get('mdp')
    print(nomutilisateur)
    print(mdp)
    patient=patientServices.LogIn(nomutilisateur, mdp)
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
  print(data)
  nomutilisateur=data.get('nomutilisateur')
  return patientServices.pasParJours(patientServices.calculate_age(patientServices.patient_age1(nomutilisateur)))
 


@app.route('/checkAge',methods=['POST'])
def checkAge():
  data=request.get_json()
  dateNaissance=data.get('dateNaissance')
  if not dateNaissance:
        return jsonify({'error': 'Date de naissance est requise'}), 400

  age = patientServices.calculate_age(dateNaissance)
  is_valid = patientServices.checkAge(age)
  return jsonify({'age': age, 'valid': is_valid})
  

@app.route('/lastPatient',methods=['POST'])
def lastPatient():
  patient=patientServices.lastPatient()
  return jsonify(patient.to_dict())

@app.route('/DecisinoPatient',methods=['POST'])
def DecisinoPatient():
  data=request.get_json()
  id=data.get('Id')
  #print(id)
  return patientServices.DecisinoPatient(id)

if __name__=='__main__':
  app.run(debug=True)