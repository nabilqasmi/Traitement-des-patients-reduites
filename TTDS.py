import numpy as np
import matplotlib as plt
import pandas as pd

import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn import metrics
from sklearn.metrics import classification_report, confusion_matrix

data = pd.read_excel("D:\\3emeAnnee\\PFA\\processus\\Back-End\\dataSetNumbers.xlsx",sheet_name=1)



X = data.drop(['hemophilie','Individues'], axis=1)
Y = data.drop(['Individues','Sexe','genetique','mode recessif(heriditaire)','Transmission genetique','Facteurs environnemntaux'],axis=1)

#train_test_split=la manipulation de données dans l'apprentissage automatique
#test_size=0.2 c'est pour les donne de test et 0.8 c'est pour les donnes d'entrainement
X_train, X_test, y_train, y_test = train_test_split(X, Y.values.ravel(), test_size=0.2, random_state=101)
model = GaussianNB()

model.fit(X_train, y_train)
prediction = model.predict(X_test)

print("Test and Train de DataSet est: ",metrics.accuracy_score(prediction, y_test) * 100)