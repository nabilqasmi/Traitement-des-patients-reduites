import 'package:app_mobile/pages/indxes/Categories/rappel_medica/EventDay.dart';
import 'package:app_mobile/pages/indxes/PageScroll/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'ajout_med.dart';

class RappMed extends StatefulWidget {
  const RappMed({super.key});

  @override
  State<RappMed> createState() => _RappMedState();
}

class _RappMedState extends State<RappMed> {

  DayEvent EventDay=new DayEvent();


   infoEvent(){
    List<CalendarDataSource>? ok;
    Map<String, List<String>> Events=EventDay.getEvetDay();
    print(Events);
  }

  /*CalendarDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[
      Appointment(
        startTime: DateTime.now().add(Duration(hours: 2)),
        endTime: DateTime.now().add(Duration(hours: 3)),
        subject: 'Réunion client',
        color: Colors.blue,
      ),
      Appointment(
        startTime: DateTime.now().add(Duration(days: 1)),
        endTime: DateTime.now().add(Duration(days: 1, hours: 1)),
        subject: 'Appel téléphonique',
        color: Colors.green,
      ),
      Appointment(
        startTime: DateTime.now().add(Duration(days: 3)),
        endTime: DateTime.now().add(Duration(days: 3, hours: 2)),
        subject: 'Présentation projet',
        color: Colors.orange,
      ),
    ];

    return CalendarDataSource(appointments: appointments);
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendrier"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Column(
            children: [
              SfCalendar(
                //dataSource: _getCalendarDataSource(),
                view: CalendarView.month,
                cellBorderColor: Colors.transparent,
                monthViewSettings: MonthViewSettings(
                    appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                    showAgenda: true
                ),
                blackoutDates: [
                  DateTime.now().subtract(Duration(hours: 48)),
                  DateTime.now().subtract(Duration(hours: 24)),
                ],
              ),
              SizedBox(height: 40,),
              TextButton
                (onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return AjoutMed();
                    }
                ));
              },
                  child: Text(
                      "Ajouter un medicaments",style: TextStyle(color: Colors.green,fontSize: 15),),
                       style: ButtonStyle(
        
                       )
              ),
              TextButton
                (onPressed: (){
                openDialog();
              },
                  child: Text("Supprimer un medicaments",style: TextStyle(color: Colors.green,fontSize: 15),)),
        
            ],
          ),
        ),
      )
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        title: Text("Sppression d'un medicaments"),
        content: TextField(
          decoration: InputDecoration(
            label: Text("Nom du medicaments"),
            hintText: 'Medicaments'
          ),
        ),actions: [
          TextButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return RappMed();
                    }
                ));
              },
              child: Text("Ok"))
      ],
      ));
}
