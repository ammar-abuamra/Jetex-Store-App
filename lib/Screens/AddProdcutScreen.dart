import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/Widget/AddProdcutScreen%5DDilog.dart';
import 'package:jettaexstores/widget.dart';

class AddProdcut extends StatefulWidget {

  @override
  _AddProdcutState createState() => _AddProdcutState();
}

class _AddProdcutState extends State<AddProdcut> {

  int NavIcon = 0;

  void s1(int index) {
    setState(() {

      NavIcon = index;
    });
  }
  final AlertDialog alert = AlertDialog(
    content: AddProdcutdilog(),
  );
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: cbuildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: appBar,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom) /
                  3.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius:BorderRadius.circular(30)
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_enhance,color: Colors.white,size: 45,),
                      Text('Add Product Photo',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ),)
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius:BorderRadius.circular(30)
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_enhance,color: Colors.white,size: 45,),
                      Text('Add Product Photo',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold ),)
                    ],
                  ),
                ),


              ],
                ),
            ),
          ),
          Container( width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom) /
                  2.8,
              child:Column(
                children: [
                  CategoresContinaer('Product Category'),
                  CategoresContinaer('Sub Category'),
                  CategoresContinaer('Product Title'),
                  CategoresContinaer('Product Price'),
                  CategoresContinaer('Product Descrption'),

                ],
              ),),


        ],
      ),
    );
  }

  Container CategoresContinaer(String st) {
    return Container(

                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius:BorderRadius.circular(5)
                  ),
                  child: ListTile(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext ctx) {
                              return alert;
                            });
                      },
                    title: Text(st,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold )),
                    trailing: Icon(Icons.arrow_forward,color: Colors.white,),

                  ),
                );
  }
}




FloatingActionButton cbuildFloatingActionButton() {
  return FloatingActionButton(
    backgroundColor: Colors.black,
    onPressed: null,
    child: Icon(
      Icons.home,
    ),
  );
}