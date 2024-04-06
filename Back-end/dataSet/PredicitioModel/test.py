import pandas as pd

from sklearn.model_selection import train_test_split
import time
from sklearn.neighbors import KNeighborsClassifier


data = pd.read_excel("D:\\3emeAnnee\\PFA\\processus\\dataSetNumbers.xlsx",sheet_name=1)


features=['age','Sexe','Transmission genetique','mode recessif(heriditaire)']

X=data[features]
Y=data['hemophilie']


X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.1, random_state=101)
#print(X_test)
dtree = KNeighborsClassifier()
dtree = dtree.fit(X, Y)

#Contrainte  [2,4,-6,-7] [2,-3,6,7]

"""print(dtree.predict(test_x))

print("[1] means 'malade'")
print("[0] means 'no malade'")"""

def decision():

    print('Your name:')
    name= input()

    print('Enter your Sexe:')
    Sexe= input()
    
    print("What's your age:")
    age= input()

    print('DO you have a chromosome MP heridite from your mother:')
    MP= input()

    print('DO you have a chromosome X heridite from your father:')
    modeRecessif= input()

    

    SexeNumber=2 if Sexe.upper()=='HOMME' else -2


    modeRecessifNumber=-6 if modeRecessif.upper()=='NO' else 6 

    MPNumber=-7 if MP.upper()=='NO' else 7
    
    #EnvironnementsNumber=8 if Environnements.upper()=='YES' else -8

    listOfInformation=[age,SexeNumber,MPNumber,modeRecessifNumber]

    test_x = pd.DataFrame([listOfInformation], columns=['age','Sexe','Transmission genetique','mode recessif(heriditaire)'])
    print("wait...")
    time.sleep(5)
    if dtree.predict(test_x)==[1]:
        print("la resultat est: vous etes malade")
    else:
        print("la resultat est: vous n'etes pas malade")
    
    #print(dtree.predict(test_x))
    
if __name__=='__main__':
    decision()