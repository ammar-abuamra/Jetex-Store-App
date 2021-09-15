import 'dart:ui';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/homepage.dart';
import 'package:jettaexstores/widget.dart';

class InfoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final AlertDialog PhoneEdit = AlertDialog(
      content: buildContainer(context),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: SecondryColor,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .35,
            width: MediaQuery.of(context).size.width,
            child: Carousel(
              images: [
                Image.network(
                    'https://images-na.ssl-images-amazon.com/images/I/513CiKyzUWL.jpg',
                    fit: BoxFit.cover),
                Image.network(
                  'https://images-na.ssl-images-amazon.com/images/I/513CiKyzUWL.jpg',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://images-na.ssl-images-amazon.com/images/I/513CiKyzUWL.jpg',
                  fit: BoxFit.cover,
                )
              ],
              dotSize: 4.0,
              dotIncreasedColor: PrimaryColor,
              dotSpacing: 15.0,
              dotColor: SecondryColor,
              indicatorBgPadding: 5.0,
              dotBgColor: SecondryColor.withOpacity(0.5),
              borderRadius: true,
              noRadiusForIndicator: true,
            ),
          ),
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext ctx) {
                      return PhoneEdit;
                    });
              },
              child: DetailCon('Call us on    079992992', Icons.phone)  ),
          DetailCon('Contact us on  Jettaex@gmail.com ', Icons.email),
          DetailCon('Our Location     Amman - Alrabea - Mka St', Icons.location_on)

        ],
      ),
    );
  }

  static buildContainer(context) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      width: MediaQuery.of(context).size.width * .7,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Edit Phone Number',
              labelStyle: TextStyle(
                color: PrimaryColor

              ),




            ),
          ),

          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: MediaQuery.of(context).size.height*.05,
              width:MediaQuery.of(context).size.width *.4,
              decoration: BoxDecoration(
                  color: SecondryColor,
                  borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: Center(child: Text('Save',style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,fontSize: 15),)),

            ),
          )

        ],
      ),

    );
  }
}












Container DetailCon(String st, IconData icon) {
  return Container(

    padding: EdgeInsets.all(5),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
        color: Color(0xffedb54f),
        borderRadius:BorderRadius.circular(5)
    ),
    child: ListTile(

      title: Text(st,style: CategoryTextStyle,textAlign: TextAlign.center,),
      leading: Icon(icon,color: SecondryColor,),

    ),
  );
}
