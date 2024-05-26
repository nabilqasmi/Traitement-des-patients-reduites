import pandas as pd

def transform_data(df):

    sex_mapping = {2: "Male", -2: "Female"}
    genetique_mapping = {-3: "N", 4: "F8", 5: "F9"}
    mode_recessif_mapping = {-6: "absence", 6: "X"}
    transmission_genetique_mapping = {-7: "absence", 7: "mère porteuse"}
    facteurs_environnementaux_mapping = {-8: "No", 8: "Yes"}
    hemophilie_mapping = {0: "non malade", 1: "malade"}
    
    df['Sexe'] = df['Sexe'].map(sex_mapping)
    df['genetique'] = df['genetique'].map(genetique_mapping)
    df['mode recessif(heriditaire)'] = df['mode recessif(heriditaire)'].map(mode_recessif_mapping)
    df['Transmission genetique'] = df['Transmission genetique'].map(transmission_genetique_mapping)
    df['Facteurs environnementaux'] = df['Facteurs environnementaux'].map(facteurs_environnementaux_mapping)
    df['hemophilie'] = df['hemophilie'].map(hemophilie_mapping)
    
    return df
