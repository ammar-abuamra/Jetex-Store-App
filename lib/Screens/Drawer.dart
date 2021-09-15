import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/main.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class TheDrawer extends StatelessWidget {
  var lang = sharedPreferences.getString("lang");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: SecondryColor,
                borderRadius: BorderRadius.circular(30)
              ),

              child: ListTile(
                title: Text('Add Prodct',style: TextStyle(color: PrimaryColor),),
                leading: Icon(
                  Icons.add,
                  color: Color(0xffedb54f),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'AddProdcut');
                },
              ),
            ),
            // ListTile(
            //     leading: Icon(Icons.language,color: Color(0xffedb54f),),
            //     title: Text('English',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            //     onTap: () {
            //       if (lang.toString() == "en") {
            //         MyApp.setLocale(context, Locale("en", ""));
            //       } else {
            //         MyApp.setLocale(context, Locale("en", ""));
            //       }
            //       Navigator.pop(context);
            //
            //     }),
            // ListTile(
            //     leading: Icon(Icons.language,color: Color(0xffedb54f),),
            //     title: Text('العربية',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
            //     onTap: () {
            //       if (lang.toString() != "ar") {
            //         MyApp.setLocale(context, Locale("ar", ""));
            //       } else {
            //         MyApp.setLocale(context, Locale("ar", ""));
            //       }
            //       Navigator.pop(context);
            //
            //     }),
          ],
        ),
      ),
    );
  }
}
