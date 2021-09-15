import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/widget.dart';

class SubCategory extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SecondryColor,
      appBar: appBar,
      body: SingleChildScrollView(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryContinaer('Sub Category num 1', context),
        CategoryContinaer('Sub Category num2 ', context),
        CategoryContinaer('Sub Category num 3', context),
        CategoryContinaer('Sub Category num 4', context),
        CategoryContinaer('Sub Category num 5', context),

      ],

    ),));
  }
}



Container CategoryContinaer(String st, context) {
  return Container(

    padding: EdgeInsets.all(5),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Color(0xffedb54f),
        borderRadius:BorderRadius.circular(5)
    ),
    child: ListTile(
      onTap: () {
        Navigator.pushNamed(context, 'ProscutDitalScreen');
      },
      title: Text(getLang(context, "SubCategory"),style: CategoryTextStyle),
      trailing: Icon(Icons.arrow_forward,color: SecondryColor,),

    ),
  );
}
