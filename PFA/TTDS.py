import pandas as pd

# Charger le fichier CSV
df = pd.read_excel("D:\\3emeAnnee\\PFA\\processus\\Back-End\\dataSetNumbers.xlsx",sheet_name=1)

# Afficher les premières lignes du DataFrame pour vérifier
print(df.head())

# Liste des variables à utiliser pour l'entraînement
variables = ["Sexe", "genetique", "mode recessif(heriditaire)","Transmission genetique","Facteurs environnemntaux"]  # Ajoutez toutes les variables que vous souhaitez utiliser

# Code pour votre traitement sur ces variables
for variable in variables:
    
    moyenne = df[variable].mean()
    print(f"Moyenne de {variable}: {moyenne}")

    # Vous pouvez ajouter d'autres traitements ici selon vos besoins

# Exemple de traitement : tester le maximum de chaque variable
max_values = df[variables].max()
print("Maximum de chaque variable :")
print(max_values)


