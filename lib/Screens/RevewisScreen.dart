import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/widget.dart';

class RevewiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        backgroundColor: SecondryColor,
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

            ReveiweCard('Ahmad','Jettaex Store','https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'),
                ReveiweCard('Lara','Safe Store','https://images.pexels.com/photos/7815357/pexels-photo-7815357.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260'),
                ReveiweCard('Raya','Pc Store','https://images.pexels.com/photos/8993561/pexels-photo-8993561.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 '),
                ReveiweCard('Noah','booker Store','https://images.pexels.com/photos/2078265/pexels-photo-2078265.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260 '),
          ]),
        ));
  }

  Widget ReveiweCard(String productitle,String prodcutcategory,String ulrim) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
           SizedBox(height:50),
            Card(

              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              color:PrimaryColor,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
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
                          children: [
                            Text(
                              productitle,
                              style: TextStyle(
                                fontSize: 15,
                                color: SecondryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              //textAlign: TextAlign.left,
                            ),
                            Text(
                              prodcutcategory,
                              style: TextStyle(
                                fontSize: 15,
                                color:  Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                              //textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          ' Rate',
                          style: TextStyle(
                            fontSize: 15,
                            color: SecondryColor,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),

                        Icon(
                          Icons.star,
                          color: Colors.white,
                        ), Icon(
                          Icons.star,
                          color: Colors.white,
                        ), Icon(
                          Icons.star,
                          color: Colors.white,
                        ), Icon(
                          Icons.star,
                          color: Colors.white,
                        ), Icon(
                          Icons.star,
                          color: Colors.white,
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
}
