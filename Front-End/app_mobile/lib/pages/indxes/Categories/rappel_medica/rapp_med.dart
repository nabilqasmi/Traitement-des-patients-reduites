import 'dart:async';

import 'package:app_mobile/pages/MVC/models/Medicament.dart';
import 'package:app_mobile/pages/indxes/Categories/rappel_medica/EventDay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../MVC/Controller/Controller.dart';

import '../../PageScroll/scroll_page.dart';
import 'ajout_med.dart';


class RappMed extends StatefulWidget {
  final List<Medicament?> allMed;

  const RappMed({Key? key, required this.allMed}): super(key: key);

  @override
  State<RappMed> createState() => _RappMedState(allMed);
}

class _RappMedState extends State<RappMed> {

  DayEvent EventDay=DayEvent();
  final TextEditingController nomMed = TextEditingController();
  var ND='';

  @override
  void dispose() {
    nomMed.dispose();
    super.dispose();
  }
  _RappMedState(List<Medicament?> allMed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left:25,bottom: 25,top: 30),
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return  ScrollPage();
                            }
                        ));
                      },
                      child: Image.asset(
                        "assets/images/flesh.jpg",
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ),
                  SizedBox(width: 30,),
                  Container(
                    child: Text("Calendrier",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    SfCalendar(
                      dataSource: MeetingsDataSource(getallMedciament(widget.allMed)),
                      view: CalendarView.month,
                      cellBorderColor: Colors.transparent,
                      monthViewSettings: const MonthViewSettings(
                          appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                          showAgenda: true
                      ),
                      blackoutDates: [
                        DateTime.now().subtract(const Duration(hours: 48)),
                        DateTime.now().subtract(const Duration(hours: 24)),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    TextButton
                      (onPressed: (){
                        for(var i in widget.allMed){
                          print(i);
                        }
                        /*for (var i in med){
                          print(i?.nom);
                        }*/
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return const AjoutMed();
                          }
                      ));
                    },
                             style: const ButtonStyle(

                             ),
                        child: const Text(
                            "Ajouter un medicaments",style: TextStyle(color: Colors.green,fontSize: 15),)
                    ),
                    TextButton
                      (onPressed: () async {
                      String? result = await openDialog();
                      //print(widget.allMed[0]!.idPatient);
                      deleteMed(result!,widget.allMed[0]!.idPatient);
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return ScrollPage();
                          }
                      ));
                      /*Navigator.push(context, MaterialPageRoute(
                          builder: (context){
                            return const RappMed(allMed: []);
                          }
                      ));*/
                    },
                        child: const Text("Supprimer un medicaments",style: TextStyle(color: Colors.green,fontSize: 15),)),

                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  Future<String?> openDialog() {
    final Completer<String?> completer = Completer<String?>();

    showDialog<String?>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Suppression d'un medicament"),
        content: TextField(
          decoration: const InputDecoration(
              label: Text("Nom du medicament"),
              hintText: 'Medicament'
          ),
          controller: nomMed,
        ),
        actions: [
          TextButton(
              onPressed: () {
                //"2024-05-30T09:00:00"
                completer.complete(nomMed.text);
                Navigator.pop(context);
              },
              child: const Text("Ok")),
          TextButton(
              onPressed: () {
                completer.complete(null);
                Navigator.pop(context);
              },
              child: const Text("Annuler"))
        ],
      ),
    );

    return completer.future;
  }
}

List<Appointment> getallMedciament(List<Medicament?> meds) {
  List<Appointment> meetings = [];

  for (var med in meds) {

      final date = DateFormat("EEE, dd MMM yyyy").parse(med!.date);
      final dateTimeString = '${DateFormat('yyyy-MM-dd').format(date)}T${med!.time}';
      final dateTime = DateTime.parse(dateTimeString);
      /*print(dateTimeString);*/
      //print(dateTime);
      meetings.add(
        Appointment(
          startTime: DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute),
          endTime: DateTime(dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute),
          subject: "${med.nom} - ${med.dose}ml",
          color: Colors.green,
          recurrenceRule: 'FREQ=WEEKLY;INTERVAL=2;BYDAY=MO,WE,FR;COUNT=12',
        ),
      );
  }
  return meetings;
}

class MeetingsDataSource extends CalendarDataSource{
  MeetingsDataSource(List<Appointment> source){
    appointments=source;
  }
}

List<Medicament> allMed(){
  return allMed();
}

String date(String date){
  DateTime dateTime = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parse(date);
  final Date=DateFormat('yyyy-MM-dd').format(dateTime);
  return Date;
}