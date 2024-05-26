import pandas as pd
from sklearn.model_selection import train_test_split
import time
from sklearn.neighbors import KNeighborsClassifier
from models import Patients
import datetime
from dal import DAOpatients

def decision(id:int):

    list=DAOpatients.search(id)
    patient=Patients(list[0][0],list[0][1],list[0][2],list[0][3],list[0][4],list[0][5],list[0][6],list[0][7],list[0][8],list[0][9],list[0][10],list[0][11],list[0][12],list[0][13],list[0][14])

    data = pd.read_excel("C:\\Users\\kella\\Desktop\\Traitement-des-patients-reduites\\Back-end\\dataSet\\dataSetNumbers.xlsx",sheet_name=1)

    features=['age','Sexe','Transmission genetique','mode recessif(heriditaire)']

    X=data[features]
    Y=data['hemophilie']


    dtree = KNeighborsClassifier()#KNN
    dtree = dtree.fit(X, Y)

    name= patient.nom

    Sexe= patient.sexe
    
    today = datetime.date.today()
    birthdate = datetime.datetime.strptime(patient.Date_Naissance,"%d/%m/%Y")

    print("today: ",today)
    print("birthdate: ",birthdate)
    age= today - birthdate.date()
    age_trs=int(round(age.days/365))
    print(age_trs)
    
    MP= patient.antecedant_mere

    modeRecessif= patient.antecedant_pere

    SexeNumber = {
        'HOMME': 2,
        'FEMME': -2
        }.get(Sexe.upper(), None)

    modeRecessifNumber = {
        'NON': -6,
        'OUI': 6,
        }.get(modeRecessif.upper(), None)

    MPNumber = {
        'NON': -7,
        'OUI': 7,
        } .get(MP.upper(), None)
    

    listOfInformation=[age_trs,SexeNumber,MPNumber,modeRecessifNumber]

    test_x = pd.DataFrame([listOfInformation], columns=['age','Sexe','Transmission genetique','mode recessif(heriditaire)'])
    print("Attendez pour votre resultat...")
    time.sleep(5)
    try:
        if dtree.predict(test_x)==[1]:
            return "la resultat est: vous etes malade"
        else:
            return "la resultat est: vous n'etes pas malade"
    except Exception:
        return "Error information"