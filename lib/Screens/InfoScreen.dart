import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Module/Info_Api.dart';
import 'package:jettaexstores/Module/phoneapi.dart';
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
  dynamic userdata;

  Future<List<Infoapi>> _getData() async {
    String url = 'http://45.76.132.167/api/authentication/infoapi.php';
    var getStore = {"storeID": sharedPreferences.getString("storeID")};
    print(getStore);
    var response = await http.post(
      Uri.parse(url),
      body: getStore,
    );
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
        title: Text('Insert Data',style: TextStyle(color: SecondryColor)),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,color: SecondryColor,
            ),
            onPressed: () {
              phonealertDialog();
            },
          ),
        ],
      ),
      backgroundColor: SecondryColor,
      body: FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
                child: Column(
              children: [
                InkWell(
                    onTap: () {},
                    child: buildContainer('ADD STORE EMAIL', Icons.email)),
                //for the fiset email add
                InkWell(
                    onTap: () {},
                    child: buildContainer(
                        'ADD STORE LOCATION', Icons.location_on)),
                //for the firset add location
                InkWell(
                    onTap: () {
                      phonealertDialog();
                    },
                    child: buildContainer('ADD PHONE NUMBER', Icons.phone)),
              ],
            ));
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      enalertDialog();
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xffedb54f),
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        title: Text(
                          'Store Name In English  \n    ${userdata['name_en']}',
                          style: CategoryTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        leading: Icon(
                          Icons.title,
                          color: SecondryColor,
                        ),
                      ),
                    ),
                  ), //gor the store en name
                  InkWell(
                    onTap: () {
                      aralertDialog();
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xffedb54f),
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        title: Text(
                          'Store Name in Arbic  \n    ${userdata['name_ar']}',
                          style: CategoryTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        leading: Icon(
                          Icons.title,
                          color: SecondryColor,
                        ),
                      ),
                    ),
                  ),//add and views store name in ar
                  InkWell(
                    onTap: () {
                      phonealertDialog();
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xffedb54f),
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        title: Text(
                          'Call us on \n   ${userdata['phone_number']}   ',
                          style: CategoryTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        leading: Icon(
                          Icons.phone,
                          color: SecondryColor,
                        ),
                      ),
                    ),
                  ), //add phones numbe  and show them
                  InkWell(
                    onTap: () {
                      emailalertDialog();
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xffedb54f),
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        title: Text(
                          'Contact us on \n ${userdata['store_email']} ',
                          style: CategoryTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        leading: Icon(
                          Icons.email,
                          color: SecondryColor,
                        ),
                      ),
                    ),
                  ), //add the emailes and show them
                  InkWell(
                    onTap: () {
                      locationalertDialog();
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xffedb54f),
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        title: Text(
                          'Our Location \n   ${userdata['store_location']}   ',
                          style: CategoryTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        leading: Icon(
                          Icons.location_on,
                          color: SecondryColor,
                        ),
                      ),
                    ),
                  ),//add and view store location



                ],
              ),
            );
          }
        },
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
                          labelText: 'Edit Phone Number',
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
                          'Save',
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
                width: MediaQuery.of(context).size.width * .7,
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
                          labelText: 'EditStore Email',
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
                              'Save',
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
                          labelText: 'Edit English Store Name',
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
                              'Save',
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
                          labelText: 'Edit The Arabic Name Store',
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
                              'Save',
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
                          labelText: 'Edit The Store Location ',
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
                              'Save',
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
