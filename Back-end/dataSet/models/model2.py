import pandas as pd
from sklearn.tree import DecisionTreeClassifier
from sklearn.model_selection import train_test_split
from sklearn import metrics
from sklearn.model_selection import cross_val_score,KFold
data = pd.read_excel("D:\\3emeAnnee\\PFA\\processus\\dataSetNumbers.xlsx",sheet_name=1)


features=['age','Sexe','hemorragie','Transmission genetique','mode recessif(heriditaire)']
X=data[features]
Y = data['hemophilie']

X_train, X_test, y_train, y_test = train_test_split(X, Y.values.ravel(), test_size=0.1, random_state=101)


dtree = DecisionTreeClassifier()

#CROSS_VALIDATION
cv=KFold(5,random_state=0,shuffle=True)
print("Cross Validation: ",cross_val_score(dtree,X_train,y_train,cv=cv,scoring='accuracy').mean())
dtree = dtree.fit(X, Y)

prediction = dtree.predict(X_test)

print("Test and Train de DataSet est: ",metrics.accuracy_score(prediction, y_test) * 100)