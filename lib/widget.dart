import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/alertdilog.dart';
import 'package:jettaexstores/config/Constant.dart';


Widget ProdcutsBoxs(context, String boxname,String rout) {
  return GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, rout);},
    child: Container(
      margin: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width / 2.3,
      decoration: BoxDecoration(
          color: Color(0xffedb54f),
          borderRadius: BorderRadius.circular(30)),
      child: Center(
          child: Text(
            boxname,
            style: TitlesTextStyle,
          )),
    ),
  );
} //Product's container

final CbottomNavigationBar = BottomAppBar(

  child: Container(
    padding: EdgeInsets.all(5),
    //height: 56,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.wb_incandescent_rounded,
        ),
        Icon(
          Icons.chat,
        ),
        Icon(
          Icons.phone,
        ),
        Icon(
          Icons.settings,
        ),
      ],
    ),
  ),
);

final appBar = AppBar(

  title: Text(
    'JETTAEX Store',style: TextStyle(color: SecondryColor),
  ),
);

Widget Editbutton({double radios, onTap}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: onTap,

      child: CircleAvatar(
        radius: radios,
        child: Icon(
          Icons.edit,
          color: SecondryColor,size: 18,
        ),
        backgroundColor: Color(0xffedb54f)
      ),
    ),
  );
}



