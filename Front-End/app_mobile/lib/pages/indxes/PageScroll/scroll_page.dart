
import 'package:app_mobile/pages/indxes/PageLoginSignUp/login_sign_up.dart';
import 'package:app_mobile/pages/indxes/PageScroll/home.dart';
import 'package:app_mobile/pages/indxes/PageScroll/settings.dart';
import 'package:flutter/material.dart';
import 'Notifications/notification_medecin.dart';
import 'package:badges/badges.dart' as badges;

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  final PageController _controller=PageController();
  int _selectedIndex = 0;



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex==0){
        _controller.jumpToPage(0);
      }else if(_selectedIndex==1){
        _controller.jumpToPage(1);
      }else if(_selectedIndex==2){
        _controller.jumpToPage(2);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _controller,
        children: const [
          Home(),
          NotificationMedcin(),
          Settings()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}


