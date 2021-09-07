import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/Screens/AddProdcutScreen.dart';
import 'package:jettaexstores/Screens/Drawer.dart';
import 'package:jettaexstores/Screens/InfoScreen.dart';
import 'package:jettaexstores/Screens/ProdcutDitalScreen.dart';
import 'package:jettaexstores/Screens/ProdcutScreen.dart';
import 'package:jettaexstores/widget.dart';

class NavHomeScreen extends StatefulWidget {


  @override
  _NavHomeScreenState createState() => _NavHomeScreenState();
}



int CurrentIndex = 0 ;
List<Widget> NavScreen = [
  ProdcutScreen(),
  InfoScreen(),
  ProscutDitalScreen()
];




class _NavHomeScreenState extends State<NavHomeScreen> {
  @override
  Widget build(BuildContext context) {
    void s1(int index) {
      setState(() {

        CurrentIndex = index;
      });
    }

    return Scaffold(
      floatingActionButton: cbuildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: TheDrawer(),
      appBar: appBar,
      body: NavScreen[CurrentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xffedb54f),
          unselectedItemColor: Colors.grey,
          currentIndex: CurrentIndex,
          onTap: s1,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.wb_incandescent_rounded),
                label: getLang(context, "NotificationNav")),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat), label: getLang(context, "ChatNav")),
            BottomNavigationBarItem(
                icon: Icon(Icons.phone), label: getLang(context, "CallNav")),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: getLang(context, "SettingsNav")),
          ],
        )
    );
  }
}
