class DayEvent{
   Map<String, List<String>> EventDay={
     "Lundi":[
           "Med 1",
           "dose 100ml",
           "10:40"
     ],
     "Mardi":[
       "Med 2",
       "dose 50ml",
       "17:40"
     ],
     "Mercredi":[
       "Med 3",
       "dose 10ml",
       "20:05"
     ],
   };


   DayEvent(){
     EventDay;
   }

   Map<String, List<String>> getEvetDay(){
     return EventDay;
   }
}