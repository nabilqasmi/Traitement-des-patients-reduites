import mysql.connector as mysql
from models import Patients , Medicament
con=mysql.connect(
    host="34.122.67.28",
    user='root',
    passwd='nabil123!',
    database='hemophelie',
    port='3306',
    charset="utf8mb4"
  )
cur=con.cursor()


class DAOpatients:

    @staticmethod
    def newPatients(patient:Patients):
        cur.execute('INSERT INTO Patient (Nom, Prenom, DateNaissance, Email, Telephone, Adresse, Motedepasse, image, Groupesanguin, Taille, Poids, Sexe, AntecedeantMere, AntecedeantPere) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)',(patient.nom,patient.prenom, patient.Date_Naissance,patient.email,patient.num_tel,patient.adresse,patient.mdp,patient.image,patient.GR_S,patient.taille,patient.poids,patient.sexe,patient.antecedant_mere,patient.antecedant_pere))
        con.commit()
    
    @staticmethod
    def deletePatient(id:int):
        cur.execute("DELETE FROM Patients where id=%s",(id,))
        con.commit()


    @staticmethod
    def updatePatient(nom:str,mdp:str):
        cur.execute("UPDATE Patients SET mdp=%s WHERE nom=%s", ( mdp ,nom,))
        con.commit()

    @staticmethod
    def logIn(nom:str,mdp:str):
        cur.execute("select * from Patient where Nom=%s and Motedepasse=%s",(nom,mdp,))  
        result=cur.fetchall() 
        return result 
    

    #print(DAOpatients.logOut("123","Email"))
    @staticmethod 
    def logOut(gmail:str,mdp:str):
        cur.execute("select * from Patient where Email=%s and Motedepasse=%s",(gmail,mdp,))  
        result=cur.fetchall() 
        return result


    @staticmethod
    def search(id:int):
        cur.execute("select * from Patients where id=%s",(id,))
        result=cur.fetchall()  
        return result
    

    @staticmethod
    def patient_age(nom : str):
        cur.execute("SELECT DateNaissance FROM Patient where Nom=%s",(nom,))
        result = cur.fetchall()
        return result
    
class DAOmedicament:   
    @staticmethod
    def newMedicament(medicament: Medicament):
        #             str        int         str          int
        #Medicament(nom='nom', dose=100, temps='00:00', idPatient=8)
        cur.execute('INSERT INTO medicament ( nom , dose , temps ,Id)VALUES (%s,%s,%s,%s)',(medicament.nom,medicament.dose,medicament.temps,medicament.idPatient))
        con.commit()
    @staticmethod
    def deletemedicament(medi:Medicament):
        cur.execute("DELETE FROM medicament where nom=%s",(medi.nom,))
        con.commit()
    @staticmethod
    def search(nom:str):
        cur.execute("select * from medicament where nom=%s",(nom,))
        result=cur.fetchall()  
        if result:
            print(result)
            Med=Medicament(result[0][1],result[0][2],result[0][3],result[0][4])
            return Med
        return result
    

if __name__=='__main__':
    #patient=Patients("nom","prenom","2024-05-25","Email","image.png","0621870090","Adresse","123","","","","","","")
    """DAOpatients.newPatients(patient)"""
    medicament=Medicament("nom",100,"temps",8)
    #DAOmedicament.newMedicament(medicament)
    #DAOmedicament.deletemedicament(medicament)
    #print(DAOmedicament.search("nom"))
    #print(DAOpatients.logOut("Email","123"))
