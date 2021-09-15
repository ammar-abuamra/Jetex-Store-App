
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Widget/NavBar.dart';
import 'package:jettaexstores/config/Constant.dart';



class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: PrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              height: MediaQuery.of(context).size.height*.4,
              width:MediaQuery.of(context).size.width ,
              decoration: BoxDecoration(
                  color: SecondryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50),),
                  image: DecorationImage(
                      image: AssetImage('assets/image/jetta-04.png')
                  )
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome Again',style: TextStyle(fontSize: 35,color: SecondryColor,fontWeight: FontWeight.bold),),
                  Text('Log In Into Store',style: TextStyle(fontSize: 20,color: SecondryColor,fontWeight: FontWeight.bold))
                ],),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: MediaQuery.of(context).size.height*.09,
              width:MediaQuery.of(context).size.width *1,
              child: TextField(textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: SecondryColor),
                      borderRadius: BorderRadius.circular(60)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: SecondryColor),
                      borderRadius: BorderRadius.circular(60)
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 80,vertical: 40),
                  labelText: 'Store Name ' ,
                  labelStyle: TextStyle(color: SecondryColor,letterSpacing: 0,) ,
                ),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: MediaQuery.of(context).size.height*.09,
              width:MediaQuery.of(context).size.width *1,
              child: TextField(textAlign: TextAlign.center,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: SecondryColor),
                      borderRadius: BorderRadius.circular(60)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2,color: SecondryColor),
                      borderRadius: BorderRadius.circular(60)
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 80,vertical: 40),
                  labelText: 'Store Passowrd ' ,
                  labelStyle: TextStyle(color: SecondryColor,letterSpacing: 0,) ,
                ),),
            ),
            SizedBox(height: 10,),

            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => Home()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                height: MediaQuery.of(context).size.height*.05,
                width:MediaQuery.of(context).size.width *.4,
                decoration: BoxDecoration(
                    color: SecondryColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Center(child: Text('Log IN',style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,fontSize: 15),)),

              ),
            )
          ],
        ),
      ),
    );
  }
}
