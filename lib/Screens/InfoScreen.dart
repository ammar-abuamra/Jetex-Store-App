import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Module/Info_Api.dart';
import 'package:jettaexstores/Module/phoneapi.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/homepage.dart';
import 'package:jettaexstores/main.dart';
import 'package:jettaexstores/widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  dynamic userdata;  Future<List<Infoapi>> _getData() async {
    String url = 'http://45.76.132.167/api/authentication/infoapi.php';
    var getStore = {
      "storeID": sharedPreferences.getString("storeID")};
    print(getStore);
    var response = await http.post(Uri.parse(url), body: getStore,);
    var jsonData = json.decode(response.body);
    List<Infoapi> info = [];

    for (var itm in jsonData) {
      info.add(Infoapi.fromJson(itm));
    }
    return info;
  } //with shared pref

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
    setdata();
  }

  void setdata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userdata = jsonDecode(sharedPreferences.getString("userdata"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: SecondryColor,
        backgroundColor: PrimaryColor,
        title: Text( getLang(context, "Infobar"),style: TextStyle(color: SecondryColor)),

      ),
      backgroundColor: SecondryColor,
      body: FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    height: 60,width: 60,
                    child: CircularProgressIndicator(
                      backgroundColor: SecondryColor,
                      valueColor: AlwaysStoppedAnimation<Color>(PrimaryColor),

                      strokeWidth: 5,
                    ),
                  ),

                  Text( getLang(context, "Indicator"),style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.w800),)
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      enalertDialog();
                    },
                    child: infobox(context,  getLang(context, "InfoStorename") + '\n ${userdata['name_en']}' , Icons.font_download_outlined),
                  ), //gor the store en name
                  InkWell(
                    onTap: () {
                      aralertDialog();
                    },
                    child: infobox(context,  getLang(context, "InfoarStorename") + '\n    ${userdata['name_ar']}' , Icons.title),
                  ),//add and views store name in ar
                  InkWell(
                    onTap: () {
                      phonealertDialog();
                    },
                    child:infobox(context,  getLang(context, "InfoCallus") + '\n   ${userdata['phone_number']}   ' , Icons.phone),
                  ), //add phones numbe  and show them
                  InkWell(
                    onTap: () {
                      emailalertDialog();
                    },
                    child:infobox(context, getLang(context, "InfoEmail") + '\n ${userdata['store_email']} ' , Icons.email)  ,
                  ), //add the emailes and show them
                  InkWell(
                    onTap: () {
                      locationalertDialog();
                    },
                    child:infobox(context, getLang(context, "InfoLocation") + '\n  ${userdata['store_location']}   ' , Icons.location_on) ,

                  ),//add and view store location



                ],
              ),
            );
          }
        },
      ),
    );
  }

  Container infobox(BuildContext context, String title, IconData icon) {
    return Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xffedb54f),
                        borderRadius: BorderRadius.circular(5)),
                    child: ListTile(
                      title: Text(
                       title,
                        style: CategoryTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      leading: Icon(
                        icon,
                        color: SecondryColor,
                      ),
                      trailing: Icon(
                        Icons.arrow_right,
                        color: SecondryColor,
                      ),
                    ),
                  );
  }

  Container buildContainer(String st, IconData icon) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Color(0xffedb54f), borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        title: Text(
          st,
          style: CategoryTextStyle,
          textAlign: TextAlign.center,
        ),
        leading: Icon(
          icon,
          color: SecondryColor,
        ),
      ),
    );
  }

  Future<bool> phonealertDialog() {
    Future<String> Insert(Phone ph) async {

      var ure = Uri.http('45.76.132.167', '/api/authentication/updatedatainfo.php');
      var data = {"phone_number": ph.phoneNumber.toString()};
      var xbody = {
        "table": 'stores',
        "data": data,
        "feild":'id',
        "value":sharedPreferences.getString("storeID")

      };
      print(xbody);
      final response = await http.post(
        ure,
        body:jsonEncode (xbody) ,headers: {
        'Content-type': 'application/json'
      }
      );
      print(response.body);
    }

    TextEditingController pn = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: SecondryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SingleChildScrollView(
            child: Form(
              child: Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .7,
                decoration: BoxDecoration(
                  color: SecondryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: PrimaryColor,
                      ),
                      title: TextFormField(
                        controller: pn,
                        style: TextStyle(color: PrimaryColor),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText:getLang(context, "InfoPhoneEdit"),
                          labelStyle: TextStyle(color: PrimaryColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Phone inf = Phone(phoneNumber: pn.text);
                          Insert(inf);
                          Navigator.of(context).pop();
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width * .4,
                        decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Center(
                            child: Text(
                              getLang(context, "InfoSaveBottn"),
                          style: TextStyle(
                              color: SecondryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
  Future<bool> emailalertDialog() {
    Future<String> Insert(Infoapi inf) async {

      var ure = Uri.http('45.76.132.167', '/api/authentication/updatedatainfo.php');
      var data = {"store_email":inf.storeEmail};
      var xbody = {
        "table": 'stores',
        "data": data,
        "feild":'id',
        "value":sharedPreferences.getString("storeID")

      };
      print(xbody);
      final response = await http.post(
          ure,
          body:jsonEncode (xbody) ,headers: {
        'Content-type': 'application/json'
      }
      );
      print(response.body);
    }

    TextEditingController em = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: SecondryColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SingleChildScrollView(
            child: Form(
              child: Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  color: SecondryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.email,
                        color: PrimaryColor,
                      ),
                      title: TextFormField(
                        controller: em,
                        style: TextStyle(color: PrimaryColor),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: getLang(context, "InfoEmailEdit") ,
                          labelStyle: TextStyle(color: PrimaryColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Infoapi inf = Infoapi( storeEmail:  em.text);
                          Insert(inf);
                          Navigator.of(context).pop();
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width * .4,
                        decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius:
                            BorderRadius.all(Radius.circular(15))),
                        child: Center(
                            child: Text(
                              getLang(context, "InfoSaveBottn"),
                              style: TextStyle(
                                  color: SecondryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
  Future<bool>enalertDialog() {
    Future<String> Insert(Infoapi inf) async {

      var ure = Uri.http('45.76.132.167', '/api/authentication/updatedatainfo.php');
      var data = {"name_en": inf.nameEn};
      var xbody = {
        "table": 'stores',
        "data": data,
        "feild":'id',
        "value":sharedPreferences.getString("storeID")

      };
      print(xbody);
      final response = await http.post(
          ure,
          body:jsonEncode (xbody) ,headers: {
        'Content-type': 'application/json'
      }
      );
      print(response.body);
    }

    TextEditingController en = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: SecondryColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SingleChildScrollView(
            child: Form(
              child: Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .7,
                decoration: BoxDecoration(
                  color: SecondryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.edit,
                        color: PrimaryColor,
                      ),
                      title: TextFormField(
                        controller: en,
                        style: TextStyle(color: PrimaryColor),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText:  getLang(context, "InfoenStoreName"),
                          labelStyle: TextStyle(color: PrimaryColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Infoapi inf = Infoapi(nameEn:  en.text);
                          Insert(inf);
                          Navigator.of(context).pop();
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width * .4,
                        decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius:
                            BorderRadius.all(Radius.circular(15))),
                        child: Center(
                            child: Text(
                              getLang(context, "InfoSaveBottn"),
                              style: TextStyle(
                                  color: SecondryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
  Future<bool> aralertDialog() {
    Future<String> Insert(Infoapi inf) async {

      var ure = Uri.http('45.76.132.167', '/api/authentication/updatedatainfo.php');
      var data = {"name_ar":inf.nameAr};
      var xbody = {
        "table": 'stores',
        "data": data,
        "feild":'id',
        "value":sharedPreferences.getString("storeID")

      };
      print(xbody);
      final response = await http.post(
          ure,
          body:jsonEncode (xbody) ,headers: {
        'Content-type': 'application/json'
      }
      );
      print(response.body);
    }

    TextEditingController ar = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: SecondryColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SingleChildScrollView(
            child: Form(
              child: Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .7,
                decoration: BoxDecoration(
                  color: SecondryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.edit,
                        color: PrimaryColor,
                      ),
                      title: TextFormField(
                        controller: ar,
                        style: TextStyle(color: PrimaryColor),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText:  getLang(context, "InfoenStoreName"),
                          labelStyle: TextStyle(color: PrimaryColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Infoapi inf = Infoapi( nameAr: ar.text);
                          Insert(inf);
                          Navigator.of(context).pop();
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width * .4,
                        decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius:
                            BorderRadius.all(Radius.circular(15))),
                        child: Center(
                            child: Text(
                              getLang(context, "InfoSaveBottn"),
                              style: TextStyle(
                                  color: SecondryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
  Future<bool> locationalertDialog() {
    Future<String> Insert(Infoapi inf) async {

      var ure = Uri.http('45.76.132.167', '/api/authentication/updatedatainfo.php');
      var data = {"store_location":inf.storeLocation};
      var xbody = {
        "table": 'stores',
        "data": data,
        "feild":'id',
        "value":sharedPreferences.getString("storeID")

      };
      print(xbody);
      final response = await http.post(
          ure,
          body:jsonEncode (xbody) ,headers: {
        'Content-type': 'application/json'
      }
      );
      print(response.body);
    }

    TextEditingController lo = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
          backgroundColor: SecondryColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: SingleChildScrollView(
            child: Form(
              child: Container(
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width * .7,
                decoration: BoxDecoration(
                  color: SecondryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.location_on,
                        color: PrimaryColor,
                      ),
                      title: TextFormField(
                        controller: lo,
                        style: TextStyle(color: PrimaryColor),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: getLang(context, "InfoStoreLocation"),
                          labelStyle: TextStyle(color: PrimaryColor),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Infoapi inf = Infoapi( storeLocation:  lo.text);
                          Insert(inf);
                          Navigator.of(context).pop();
                        });
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * .05,
                        width: MediaQuery.of(context).size.width * .4,
                        decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius:
                            BorderRadius.all(Radius.circular(15))),
                        child: Center(
                            child: Text(
                              getLang(context, "InfoSaveBottn"),
                              style: TextStyle(
                                  color: SecondryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
