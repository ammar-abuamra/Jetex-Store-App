import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/Screens/LoginScreen.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/main.dart';

class SettingScreen extends StatelessWidget {
  var lang = sharedPreferences.getString("lang");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: SecondryColor,
        backgroundColor: PrimaryColor,
        title: Text(getLang(context, 'SettingsNav'),style: TextStyle(color: SecondryColor)),

      ),
      backgroundColor: PrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 8,
            ),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              color: SecondryColor,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Text(
                              'Language || اللغة ',
                              style: TextStyle(
                                fontSize: 20,
                                color: PrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              //   textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            if (lang.toString() == "en") {
                              MyApp.setLocale(context, Locale("en", ""));
                            } else {
                              MyApp.setLocale(context, Locale("en", ""));
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            height: MediaQuery.of(context).size.height * .05,
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                color: PrimaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(
                                child: Text(
                              'English',
                              style: TextStyle(
                                  color: SecondryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (lang.toString() != "ar") {
                              MyApp.setLocale(context, Locale("ar", ""));
                            } else {
                              MyApp.setLocale(context, Locale("ar", ""));
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            height: MediaQuery.of(context).size.height * .05,
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                color: PrimaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(
                                child: Text(
                              'العربية',
                              style: TextStyle(
                                  color: SecondryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8,),
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              color: SecondryColor,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Text(
                              'About Us || App ',
                              style: TextStyle(
                                fontSize: 20,
                                color: PrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            height: MediaQuery.of(context).size.height * .05,
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                color: PrimaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(
                                child: Text(
                              'App Devlopment',
                              style: TextStyle(
                                  color: SecondryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            height: MediaQuery.of(context).size.height * .05,
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                                color: PrimaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Center(
                                child: Text(
                              'Contact us',
                              style: TextStyle(
                                  color: SecondryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 100,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12,vertical: 35),
              decoration: BoxDecoration(
                  color: SecondryColor,
                  borderRadius: BorderRadius.circular(30)
              ),

              child: ListTile(
                title: Text(getLang(context, "Logout"),  style: TextStyle(
                  fontSize: 20,
                  color: PrimaryColor,
                  fontWeight: FontWeight.bold,
                ),textAlign: TextAlign.center,),
                leading: Icon(
                  Icons.logout,
                  color: PrimaryColor,
                ),
                onTap: () {

                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                },
              ),
            )
,
          ],
        ),
      ),
    );
  }
}

Widget SettingCard(
  String productitle,
  BuildContext context,
  String prodcutcategory,
) {
  return Column(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50),
          Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            color: SecondryColor,
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            prodcutcategory,
                            style: TextStyle(
                              fontSize: 18,
                              color: PrimaryColor,
                              fontWeight: FontWeight.bold,
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
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: MediaQuery.of(context).size.height * .05,
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              color: PrimaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                              child: Text(
                            'English',
                            style: TextStyle(
                                color: SecondryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          height: MediaQuery.of(context).size.height * .05,
                          width: MediaQuery.of(context).size.width * .4,
                          decoration: BoxDecoration(
                              color: PrimaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                              child: Text(
                            'العربية',
                            style: TextStyle(
                                color: SecondryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                        ),
                      )
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
