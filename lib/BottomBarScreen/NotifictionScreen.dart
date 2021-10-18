import 'package:flutter/material.dart';
import 'package:jettaexstores/config/Constant.dart';


class NoteficationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: SecondryColor,
        backgroundColor: PrimaryColor,
        title: Text('Notification',style: TextStyle(color: SecondryColor)),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            ReveiweCard('Ahmad','Jettaex Store','https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260','How much it coast'),
            ReveiweCard('Lara','Safe Store','https://images.pexels.com/photos/7815357/pexels-photo-7815357.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260','Thanke you alot'),
            ReveiweCard('Raya','Pc Store','https://images.pexels.com/photos/8993561/pexels-photo-8993561.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 ',"I didnt recive the backeg"),
            ReveiweCard('Noah','booker Store','https://images.pexels.com/photos/2078265/pexels-photo-2078265.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 ','i have changed my location ! '),
          ]
        ),
      ),
    );
  }
}



Widget ReveiweCard(String productitle,String prodcutcategory,String ulrim,String noet) {
  return Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height:3),
          Card(

            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            color:SecondryColor,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: SecondryColor,

                        radius: 35,

                        backgroundImage:  NetworkImage(ulrim,),
                      ),
                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productitle,
                            style: TextStyle(
                              fontSize: 15,
                              color: PrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 5,),
                          Text(
                            prodcutcategory,
                            style: TextStyle(
                              fontSize: 15,
                              color:  PrimaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                            //textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),


                  Row(

                    children: <Widget>[
                      SizedBox(width: 80,),
                      Text(
                        ' Note : $noet',
                        style: TextStyle(
                          fontSize: 15,
                          color: PrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),

                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    ],
  );
}
