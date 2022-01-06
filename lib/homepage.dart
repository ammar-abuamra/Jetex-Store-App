import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jettaexstores/Module/Info_Api.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/alertdilog.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/main.dart';
import 'package:jettaexstores/widget.dart';
import 'Provider/Localapp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  final picker = ImagePicker();

  Future getImage(ImageSource src) async {
    final pickedFile = await picker.pickImage(source: src);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        print(pickedFile.path);
      } else {
        print('non');
      }
    });
  }

  dynamic userdata;
  Future<List<Infoapi>> _getData() async {
    String url = 'http://45.76.132.167/api/authentication/mainStoreinfo.php?id=';
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

  Widget buildContainer(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height * .4,
        width: MediaQuery.of(context).size.width * .4,
        decoration: BoxDecoration(
            color: SecondryColor, ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildListTile(
                context, Icons.image, getLang(context, 'glalrydio'), ImageSource.gallery),
            buildListTile(
                context, Icons.camera, getLang(context, 'camdi'), ImageSource.camera),
          ],
        ),
      ),
    );
  }

  var lang = sharedPreferences.getString("lang");

  Widget buildListTile(
      BuildContext context, IconData icon, String fname, ImageSource src) {
    return ListTile(
      onTap: () {

        getImage(src);
        // });
        Navigator.of(context).pop();
      },
      leading: Icon(icon,color: PrimaryColor,),
      title: Text(fname,style: TextStyle(color: PrimaryColor),),
    );
  }

  @override
  Widget build(BuildContext context) {

    final AlertDialog alertq = AlertDialog(backgroundColor: SecondryColor,shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
      content: buildContainer(context),
    );

    return Scaffold(
      backgroundColor: SecondryColor,
      appBar: AppBar(
        foregroundColor: SecondryColor,
        backgroundColor: PrimaryColor,
        title: Text('JETTEX STORE',style: TextStyle(color: SecondryColor)),

      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){


            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top -
                              MediaQuery.of(context).padding.bottom) /
                              3.5,

                          child: _image == null ? Image.network('https://images-na.ssl-images-amazon.com/images/I/513CiKyzUWL.jpg', fit: BoxFit.cover,) : Image.file(_image, fit: BoxFit.cover,)),
                      Column(
                        children: [
                          Editbutton(
                            radios: 15,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return alertq;
                                  });
                            },
                          ),
                          Editbutton(
                            radios: 15,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return alertq;
                                  });
                            },
                          ),
                          Editbutton(
                            radios: 15,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return alertq;
                                  });
                            },
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom) /
                      6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //للمسافات الي بين اسم المحل و الايقونات والييتختهن
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${userdata['name_ar']}   ',
                                    style: TextStyle(
                                        color: Color(0xffedb54f),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        wordSpacing: 4),
                                  ),
                                  Text(
                                    '${userdata['name_en']}',
                                    style: TextStyle(
                                        color: Color(0xffedb54f),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        wordSpacing: 4),
                                  )
                                ],
                              ),
                              SizedBox(height: 8,),


                              Row(
                                children: [
                                  Icon(Icons.star,size: 17,),
                                  Icon(Icons.star,size: 17),
                                  Icon(Icons.star,size: 17),
                                  Icon(Icons.star,size: 17),
                                  Icon(Icons.star,size: 17),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom) /
                      2.5,
                  child: GridView(
                    children: [
                      ProdcutsBoxs(context, getLang(context, "ProductButton"),
                          'ProscutDitalScreen'),
                      ProdcutsBoxs(
                          context, getLang(context, "OrderButton"), 'OrderScreen'),
                      ProdcutsBoxs(context, getLang(context, "ReviewButton"),
                          'RevewiesScreen'),
                      ProdcutsBoxs(
                          context, getLang(context, "InfoButton"), 'InfoScreen'),
                    ],
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.7,
                    ),
                  ),
                ),
              ],
            );
          }
        ,
      ),
    );
  }

  FloatingActionButton cbuildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Color(0xffedb54f),
      onPressed: null,
      child: Icon(
        Icons.home,color: SecondryColor,
      ),
    );
  }
}
