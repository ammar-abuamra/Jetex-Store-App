import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/Screens/LoginScreen.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/main.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TheDrawer extends StatelessWidget {
  var lang = sharedPreferences.getString("lang");

  @override
  Widget build(BuildContext context) {
    Future logout()async{
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove('e');
      pref.remove('p');
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()))  ;
    }
    return SafeArea(
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor:SecondryColor, //This will change the drawer background to blue.
          //other styles
        ),
        child: Drawer(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child:Center(
                  child: Text(getLang(context, "Jetexdrwerlogo"),style: TextStyle(
                      color: SecondryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),),
                ),
                height: MediaQuery.of(context).size.height * .3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft:Radius.circular(5) ),
                  color: PrimaryColor, ),
              ),
             // SizedBox(height:MediaQuery.of(context).size.height * .15 ,),
              // Container(
              //   margin: EdgeInsets.all(12),
              //   decoration: BoxDecoration(
              //     color: PrimaryColor,
              //     borderRadius: BorderRadius.circular(30)
              //   ),
              //
              //   child: ListTile(
              //     title: Text('Add Prodct',style: TextStyle(color: SecondryColor),),
              //     leading: Icon(
              //       Icons.add,
              //       color: SecondryColor,
              //     ),
              //     onTap: () {
              //       Navigator.pushNamed(context, 'AddProdcut');
              //     },
              //   ),
              // ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 12,vertical: 35),
                decoration: BoxDecoration(
                    color: PrimaryColor,
                    borderRadius: BorderRadius.circular(30)
                ),

                child: ListTile(
                  title: Text(getLang(context, "Logout"),style: TextStyle(color: SecondryColor),),
                  leading: Icon(
                    Icons.logout,
                    color: SecondryColor,
                  ),
                  onTap: () {

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }


}
