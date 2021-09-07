import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/Screens/Drawer.dart';
import 'package:jettaexstores/Screens/InfoScreen.dart';
import 'package:jettaexstores/Screens/ProdcutDitalScreen.dart';
import 'package:jettaexstores/Screens/ProdcutScreen.dart';
import 'package:jettaexstores/alertdilog.dart';
import 'package:jettaexstores/main.dart';
import 'package:jettaexstores/widget.dart';
import 'Provider/Localapp.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  final picker = ImagePicker();

  Future getImage(ImageSource src) async {
    final pickedFile = await picker.pickImage(source: src);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(pickedFile.path);
      } else {
        print('non');
      }
    });
  }

  List<Widget> NavScreen = [
    ProdcutScreen(),
    InfoScreen(),
    ProscutDitalScreen()
  ];

  int NavIcon = 0;

  void s1(int index) {
    setState(() {

      NavIcon = index;
    });
  }



  Widget buildContainer(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height * .7,
        width: MediaQuery.of(context).size.width * .7,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              child: Text(
                'Photo Edit',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor:Color(0xffedb54f),
              radius: 55,
            ),
            buildListTile(
                context, Icons.image, 'From Gallery', ImageSource.gallery),
            buildListTile(
                context, Icons.camera, 'From Camera', ImageSource.camera),
          ],
        ),
      ),
    );
  }


  var lang = sharedPreferences.getString("lang");

  Widget buildListTile(
      BuildContext context, IconData icon, String fname, ImageSource src) {
    return ListTile(
      onTap: () {
        getImage(src);
        // });
        Navigator.of(context).pop();
      },
      leading: Icon(icon),
      title: Text(fname),
    );
  }

  @override
  Widget build(BuildContext context) {
    final AlertDialog alert = AlertDialog(
      content: cad(),
    );
    final AlertDialog alertq = AlertDialog(
      content: buildContainer(context),
    );

    return Scaffold(
      floatingActionButton: cbuildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: TheDrawer(),
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top -
                        MediaQuery.of(context).padding.bottom) /
                        3.5,
                    child: _image == null
                        ? Image.network(
                      'https://wallpapercave.com/wp/wp7709742.jpg',
                      fit: BoxFit.cover,
                    )
                        : Image.file(
                      _image,
                      fit: BoxFit.cover,
                    )),
                Editbutton(
                    radios: 30,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext ctx) {
                          return alertq;
                        });
                  },),
                // Row(children: [
                //   ElevatedButton(onPressed: ()async{
                //     await Loca);
                //   }, child: Text('English')),
                //   ElevatedButton(onPressed: ()async{
                //     await context.setLocale(Locale('ar'));
                //   }, child: Text('العربيه'))
                // ],)
              ],
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return alert;
                  });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom) /
                  6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //للمسافات الي بين اسم المحل و الايقونات والييتختهن
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            getLang(context, "StoreName"),
                            style: TextStyle(
                              color: Color(0xffedb54f),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                wordSpacing: 4),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.phone),
                          Text(
                            getLang(context, "StorePhone"),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.add_location_rounded),
                          Text(
                            getLang(context, "StoreLocation"),
                          ),
                          Expanded(
                              child: SizedBox(
                                width: 0,
                              )),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top -
                MediaQuery.of(context).padding.bottom) /
                2.5,
            child: GridView(
              children: [
                ProdcutsBoxs(context, getLang(context, "ProductButton"),
                    'ProdcutScreen'),
                ProdcutsBoxs(
                    context, getLang(context, "OrderButton"), 'OrderScreen'),
                ProdcutsBoxs(context, getLang(context, "ReviewButton"),
                    'RevewiesScreen'),
                ProdcutsBoxs(
                    context, getLang(context, "InfoButton"), 'InfoScreen'),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.7,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffedb54f),
        unselectedItemColor: Colors.grey,
        currentIndex: NavIcon,
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
      ),
    );
  }

  FloatingActionButton cbuildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Color(0xffedb54f),
      onPressed: null,
      child: Icon(
        Icons.home,
      ),
    );
  }
}
