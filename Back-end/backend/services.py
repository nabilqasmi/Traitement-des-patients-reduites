from dal import DAOpatients,DAOmedicament
from models import Patients,Medicament
from datetime import datetime
from test import decision

class patientServices:
    @staticmethod
    def addPatients(patients:Patients):
        return DAOpatients.newPatients(patients)
    
    @staticmethod
    def deletePatients(id:int):
        return DAOpatients.deletePatient(id)   
    
    @staticmethod
    def LogIn(nom:str,mdp:str):
        result=DAOpatients.logIn(nom,mdp)
        patient=Patients(result[0][0],result[0][1],result[0][2],result[0][3],result[0][4],result[0][5],result[0][6],result[0][7],result[0][8],result[0][9],result[0][10],result[0][11],result[0][12],result[0][13],result[0][14])
        return patient
    
    @staticmethod 
    def ModifyPatients(nom:str,mdp:str):
        return DAOpatients.updatePatient(nom,mdp)
    

    @staticmethod
    def patient_age1(nom: str):
        result = DAOpatients.patient_age1(nom)
        date_naissance = result
        return date_naissance

    @staticmethod
    def pasParJours(age):
        dict={}
        JoursPatient=[]
        JoursPasPatient=[]
        if int(age) <= 3:
            JoursPatient=["Pas de recommandation spécifique pour les enfants de moins de 3 ans"]
            JoursPasPatient=[0]

        elif 3 < int(age) <= 5:
            jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
            pas_jour = [50, 40, 30, 40, 20, 10, 30]
            JoursPatient=jours
            JoursPasPatient=pas_jour

        elif 6 <= int(age) <= 10:
            jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
            pas_jour = [10000, 11000, 14000, 9000, 10000, 13000, 11000]
            JoursPatient=jours
            JoursPasPatient=pas_jour
        elif 10 < int(age) <= 20:
            jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
            pas_jour = [10000, 11000, 11500, 12000, 11000, 12000, 13000]
            JoursPatient=jours
            JoursPasPatient=pas_jour
        elif 20 < int(age) <= 60:
            jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
            pas_jour = [7000, 9000, 10000, 8500, 7500, 9500, 10000]
            JoursPatient=jours
            JoursPasPatient=pas_jour
        elif int(age) > 60 and int(age) <= 80:
            jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
            pas_jour = [8000, 7500, 6500, 6000, 7900, 6800, 8200]
            JoursPatient=jours
            JoursPasPatient=pas_jour
        elif int(age) >= 80 and int(age) <= 100:
            jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
            pas_jour = [100, 80, 60, 70, 20, 60, 40]
            JoursPatient=jours
            JoursPasPatient=pas_jour
        else:
            JoursPatient=["Age invalide"]
            JoursPasPatient=[0]
        
        for i,j in zip(JoursPatient,JoursPasPatient):
            dict[i]=j
        return dict


    @staticmethod
    def checkAge(age:int):
        if(age<=3 or age>=101):
            return False
        return True
        
    @staticmethod
    def calculate_age(birth_date):
        if isinstance(birth_date, str):
            birth_date = datetime.strptime(birth_date, '%Y-%m-%d')
        today = datetime.today()
        return today.year - birth_date.year - ((today.month, today.day) < (birth_date.month, birth_date.day))
    
    @staticmethod
    def LogOut(gmail:str,mdp:str):
        result=DAOpatients.logOut(gmail,mdp)
        patient=Patients(result[0][0],result[0][1],result[0][2],result[0][3],result[0][4],result[0][5],result[0][6],result[0][7],result[0][8],result[0][9],result[0][10],result[0][11],result[0][12],result[0][13],result[0][14])
        return patient

    
    @staticmethod
    def patient_age2(DateNaissance:str):
        result =DAOpatients.patient_age2(DateNaissance)
        return result

    @staticmethod
    def DecisinoPatient(id:int):
        return decision(id)
    
    @staticmethod 
    def search(id:int):
        return DAOpatients.search(id)
    
    @staticmethod
    def lastPatient():
        result=DAOpatients.lastPatient()
        patient=Patients(result[0][0],result[0][1],result[0][2],result[0][3],result[0][4],result[0][5],result[0][6],result[0][7],result[0][8],result[0][9],result[0][10],result[0][11],result[0][12],result[0][13],result[0][14])
        return patient
    
class MedicamentService:
    @staticmethod
    def ajouterMedicament(medicament:Medicament):
        return DAOmedicament.newMedicament(medicament)
       
    @staticmethod
    def deletemedicament(medi:Medicament):
        return DAOmedicament.deletemedicament(medi)   
    
    @staticmethod
    def searchMed(nom:str):
        return DAOmedicament.search(nom)      
    
if __name__=="__main__":
    #patient=Patients(1,"nabil","kella","10/04/2003","nabil.kella@gmail.com","0000000","image.jpg","A",1.80,77,"Homme","adresse","000","oui","non")
    #patientServices.addPatients(patient)
    #patientServices.deletePatients(1)
    #patientServices.ModifyPatients(patients.nom,"000")
    #print(patientServices.LogIn(patient.nom,patient.mdp))
    #print(patientServices.DecisinoPatient(1))
    """medicament=Medicament("nom",100,"temps",8)
    MedicamentService.ajouterMedicament(medicament)"""
    #print(patientServices.LogOut("Email","123"))
    #print(patientServices.checkAge(patientServices.calculate_age(patientServices.patient_age("2003-04-10"))))
    #patientServices.pasParJours(patientServices.calculate_age(patientServices.patient_age(nomutilisateur)))
    #print(patientServices.pasParJours(patientServices.calculate_age(patientServices.patient_age1("oth123"))))
    #print((()))
    #print(patientServices.checkAge(patientServices.calculate_age("2020-05-28")))
    #print(patientServices.DecisinoPatient(23))
    #print(patientServices.lastPatient())