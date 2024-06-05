/*
* FutureBuilder<List<Medecin?>>(
              future: meds,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Aucun médecin trouvé.'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final med = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          leading:Image.asset(med!.image),
                          title: Text(med!.nom,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          subtitle: Text('${med.spe}'),
                        ),
                      );
                    },
                  );
                }
              },
            ),
*
* */















/*
*
* /*FutureBuilder<List<Medicament?>>(
              future: med,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Aucun médicament trouvé.'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final medicament = snapshot.data![index];
                      return Card(
                        child: ListTile(
                          leading: Icon(Icons.medication_liquid),
                          title: Text(medicament!.nom,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          subtitle: Text('${medicament.dose.toString()}ml -- ${medicament.date}'),
                        ),
                      );
                    },
                  );
                }
              },
            ),*/
*
* */