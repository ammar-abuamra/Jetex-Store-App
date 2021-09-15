import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/widget.dart';

class ProdcutScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: SecondryColor,

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryContinaer('Category num 1',context),
            CategoryContinaer('Category num 2',context),
            CategoryContinaer('Category num 3',context),
            CategoryContinaer('Category num 4',context),
            CategoryContinaer('Category num 5',context),
          ],
        ),
      ),
    );
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
        Navigator.pushNamed(context, 'SubCategory');
      },
      title: Text( getLang(context, "Category"),style: CategoryTextStyle),
      trailing: Icon(Icons.arrow_forward,color: SecondryColor,),

    ),
  );
}
