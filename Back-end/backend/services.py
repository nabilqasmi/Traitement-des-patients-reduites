from dal import DAOpatients,DAOmedicament,DAOmedecin
from models import Patients,Medicament,medecin
from datetime import datetime
from test import decision
import matplotlib.pyplot as plt


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
    def pasParJours(age, weight):
        dict = {}
        JoursPatient = []
        JoursPasPatient = []


        if int(weight) < 20 or int(weight) >= 100:
            JoursPatient = ["Anomalie : veuillez consulter un médecin le plus tôt possible"]
            JoursPasPatient = [0]
        else:
            if 3 < int(age) <= 5:
                jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
                pas_jour = [50, 40, 30, 40, 20, 10, 30]
                JoursPatient = jours
                JoursPasPatient = pas_jour
            elif 6 <= int(age) <= 10:
                jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
                pas_jour = [10000, 11000, 14000, 9000, 10000, 13000, 11000]
                JoursPatient = jours
                JoursPasPatient = pas_jour
            elif 10 < int(age) <= 20:
                jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
                pas_jour = [10000, 11000, 11500, 12000, 11000, 12000, 13000]
                JoursPatient = jours
                JoursPasPatient = pas_jour
            elif 20 < int(age) <= 60:
                jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
                pas_jour = [7000, 9000, 10000, 8500, 7500, 9500, 10000]
                JoursPatient = jours
                JoursPasPatient = pas_jour
            elif 60 < int(age) <= 70:
                jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
                pas_jour = [8000, 7500, 6500, 6000, 7900, 6800, 8200]
                JoursPatient = jours
                JoursPasPatient = pas_jour
            elif 70 < int(age) <= 80:
                jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
                pas_jour = [3000, 3000, 3000, 3000, 3000, 3000, 3000]
                JoursPatient = jours
                JoursPasPatient = pas_jour
            elif 80 < int(age) <= 100:
                jours = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
                pas_jour = [100, 80, 60, 70, 20, 60, 40]
                JoursPatient = jours
                JoursPasPatient = pas_jour


            if int(weight) > 90 and int(weight) < 100:
                JoursPasPatient = [int(steps * 0.5) for steps in JoursPasPatient] 

        for i, j in zip(JoursPatient, JoursPasPatient):
            dict[i] = j
        return dict
        


    @staticmethod
    def checkAge(age:int):
        if(age<=3 or age>=101):
            return False
        return True
        
    @staticmethod
    def checkPoids(poids:int):
        if(int(poids)==0):
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
        #print(result)
        patient=Patients(result[0][0],result[0][1],result[0][2],result[0][3],result[0][4],result[0][5],result[0][6],result[0][7],result[0][8],result[0][9],result[0][10],result[0][11],result[0][12],result[0][13],result[0][14])
        return patient
    
    @staticmethod
    def patient_poid(nom:str):
        result=DAOpatients.patient_poid(nom)
        for i in result:
            return i[0]
        
    @staticmethod
    def generate_steps_plot(age, weight):
        steps_data = patientServices.pasParJours(age, weight)
        days = list(steps_data.keys())
        steps = list(steps_data.values())

        plt.figure(figsize=(12, 7))
        if int(weight) < 20 or int(weight) >= 95:
            plt.text(0.5, 0.5, "Anomalie : veuillez consulter un médecin le plus tôt possible",
                     horizontalalignment='center', verticalalignment='center', fontsize=15, color='red', transform=plt.gca().transAxes)
            plt.axis('off')
        else:
            plt.bar(days, steps, color='royalblue', edgecolor='black')
            plt.title(f'Nombre de pas par jour pour un patient de {age} ans et {weight} kg', fontsize=15, fontweight='bold')
            plt.xlabel('Jour de la semaine', fontsize=12)
            plt.ylabel('Nombre de pas', fontsize=12)
            plt.xticks(rotation=45, fontsize=10)
            plt.yticks(fontsize=10)
            plt.grid(axis='y', linestyle='--', linewidth=0.7, alpha=0.7)
            for i, v in enumerate(steps):
                plt.text(i, v + 100, str(v), ha='center', fontsize=10, fontweight='bold')
            plt.tight_layout()
        plt.show()
        
class MedicamentService:

    """
        <class 'str'>
        <class 'int'>
        <class 'str'>
        <class 'str'>
        <class 'int'>
    
    """
    @staticmethod
    def ajouterMedicament(medi:Medicament):
        print("medi",medi)
        return DAOmedicament.newMedicament(medi)
       
    @staticmethod
    def deletemedicament(medi:Medicament):
        return DAOmedicament.deletemedicament(medi)   
    
    @staticmethod
    def searchMed(nom:str,idPatient:int):
        #[(9, 'nom1', 65, 100, datetime.date(2024, 10, 4), '10:00:00')]
        result=DAOmedicament.search(nom,idPatient)    
        med=Medicament(result[0][0],result[0][1],result[0][2],result[0][3],result[0][4],result[0][5]) 
        return med 

    @staticmethod
    def allMedicament(id:int):
        allmedicaments=[]
        result=DAOmedicament.allMedicament(id)
        for i in result:
            med=Medicament(i[0],i[1],i[2],i[3],i[4],i[5])
            allmedicaments.append(med)
        return allmedicaments
    
class medecinservices:
    @staticmethod
    def addmedecins(nom:str,spe:str,id:int,image:str):
        return DAOmedecin.newMeddin(nom,spe,id,image)

    @staticmethod
    def deletemed(nom:str):
        return DAOmedecin.deletemedecin(nom)
    
    @staticmethod
    def searchmedecin(id:int):
        allmedecin=[]
        result=DAOmedecin.getall(id)
        #print(result)
        for i in result:
            #print(type(i))
            Med = medecin(i[0], i[1], i[3],i[2])
            allmedecin.append(Med)
        return allmedecin
    
if __name__=="__main__":
    """patient=Patients(1,"nabil","kella","10/04/2003","nabil.kella@gmail.com","0000000","image.jpg","A",1.80,77,"Homme","adresse","000","oui","non")
    patientServices.addPatients(patient)
    patientServices.deletePatients(1)
    patientServices.ModifyPatients(patients.nom,"000")
    print(patientServices.LogIn(patient.nom,patient.mdp))
    print(patientServices.DecisinoPatient(1))
    MedicamentService.ajouterMedicament(nom,dose,date,time,idPatient)
    MedicamentService.ajouterMedicament("nom4",80,"2021-01-02","10:00:00",65)
    MedicamentService.ajouterMedicament(medicament)
    print(patientServices.LogOut("Email","123"))
    print(patientServices.checkAge(patientServices.calculate_age(patientServices.patient_age("2003-04-10"))))
    patientServices.pasParJours(patientServices.calculate_age(patientServices.patient_age(nomutilisateur)))
    print(patientServices.pasParJours(patientServices.calculate_age(patientServices.patient_age1("oth123"))))
    print(patientServices.checkAge(patientServices.calculate_age("2020-05-28")))
    print(patientServices.DecisinoPatient(23))
    print(patientServices.lastPatient())
    print(MedicamentService.allMedicament(63))
    print(MedicamentService.searchMed('nom1',65))"""
    #medicament2=Medicament(0,"nom2",65,130,"2024-01-04","10")
    #DAOmedicament.newMedicament(medicament1)
    #MedicamentService.ajouterMedicament(medicament2)

    """poids=patientServices.patient_poid("nomm")
    age=patientServices.calculate_age(patientServices.patient_age1("nomm"))
    patientServices.generate_steps_plot(age,poids)"""
    #print(poids,age)
    #print(patientServices.pasParJours(14,19))
    #print(patientServices.checkPoids(patientServices.patient_poid("aze")))
    #medecinservices.addmedecins("nom","spe",91,"image")
    #print(medecinservices.searchmedecin(91))