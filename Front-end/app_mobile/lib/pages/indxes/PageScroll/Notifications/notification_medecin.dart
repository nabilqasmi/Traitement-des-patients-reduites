import 'package:app_mobile/pages/indxes/PageScroll/Notifications/rendezvous.dart';
import 'package:flutter/material.dart';

import 'medpatient.dart';

class NotificationMedcin extends StatefulWidget {
  const NotificationMedcin ({super.key});

  @override
  State<NotificationMedcin> createState() => _NotificationMedcinState();
}

class _NotificationMedcinState extends State<NotificationMedcin> {
  int _selectedIndex = 0;
  PageController _controller=PageController();


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: ImageIcon(
                  AssetImage("assets/images/appMedecine.png"),
                  color: Colors.green,
                ),
              ),
              Tab(
                child: ImageIcon(
                  AssetImage("assets/images/notMed.png"),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
        /*body: TabBarView(
          children: [

          ],
        ),*/
      ),
    );
  }
}




