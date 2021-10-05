import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/Widget/NavBar.dart';
import 'package:jettaexstores/config/Api_Test.dart';
import 'package:jettaexstores/config/Configers.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class loginp {
  final String password;
  final String email;

  loginp({
    @required this.email,
    @required this.password,
  });

  Future<String> login(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              height: 60,width: 60,
              child: CircularProgressIndicator(
                backgroundColor: SecondryColor,
                valueColor: AlwaysStoppedAnimation<Color>(PrimaryColor),

                strokeWidth: 5,
              ),
            ),
          );
        });

    try {
      Map data = {
        "Email": email, "Password": password};
      var url = Uri.parse (Api.login_api);

      var response = await http.post(url, body: data);
      final result = jsonDecode( response.body );
      String situation = result['result'];
      String storeID= result['Store']['store_id'];
      String storeName= result['Store']['name_en'];
      String userdata= jsonEncode(result['Store']['userdata']);

      Navigator.pop(context);
      if (situation == "1") {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("storeID", storeID);
        sharedPreferences.setString("storeName", storeName);
        sharedPreferences.setString("userdata", userdata);




        sharedPreferences.setBool("Remember", true);
        sharedPreferences.commit();

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Home()),
            (Route<dynamic> route) => false);

      } else {
        AwesomeDialog(
          dialogBackgroundColor: PrimaryColor,
          context: context,
          headerAnimationLoop: true,
          dialogType: DialogType.ERROR,
          body: Text(
            "Store Not Found !!",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          autoHide: Duration(seconds: 7),
        )..show();
      }
    } catch (e) {
      Navigator.pop(context);
      AwesomeDialog(
        dialogBackgroundColor: SecondryColor,
        context: context,
        headerAnimationLoop: true,
        dialogType: DialogType.ERROR,
        body: Text(
          'Connection Error ',
          style: TextStyle(
              color: PrimaryColor, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        autoHide: Duration(seconds: 7),
      )..show();
    }
  }
}
