import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/Widget/AddProdcutScreen%5DDilog.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/widget.dart';

class AddProdcut extends StatefulWidget {
  @override
  _AddProdcutState createState() => _AddProdcutState();
}

class _AddProdcutState extends State<AddProdcut> {
  final AlertDialog alert = AlertDialog(
    content: AddProdcutdilog(),
  );

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: PrimaryColor,
        child: Text(
        getLang(context, 'Save'),
          style: TextStyle(color: SecondryColor),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      backgroundColor: SecondryColor,
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) /
                  3.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.camera_enhance,
                          color: SecondryColor,
                          size: 45,
                        ),
                        Text(
                          getLang(context, 'AddProductPhoto'),
                          style: TextStyle(
                              color: SecondryColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(5),
                  //   margin: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //       color: PrimaryColor,
                  //       borderRadius: BorderRadius.circular(30)),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Icon(
                  //         Icons.camera_enhance,
                  //         color: SecondryColor,
                  //         size: 45,
                  //       ),
                  //       Text(
                  //         'Add Product Photo',
                  //         style: TextStyle(
                  //             color: SecondryColor, fontWeight: FontWeight.bold),
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom) /
                1.5,
            child: Column(
              children: [
                CategoresContinaer(  getLang(context, 'ProductCategory'),),
                CategoresContinaer(getLang(context, 'SubCategory'),),
                CategoresContinaer(getLang(context, 'ProductTiltle'),),
                CategoresContinaer(getLang(context, 'ProdcutPrice'),),
                CategoresContinaer(getLang(context, 'ProductDescreption'),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container CategoresContinaer(String st) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: PrimaryColor, borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return alert;
              });
        },
        title: Text(st,
            style:
                TextStyle(color: SecondryColor, fontWeight: FontWeight.bold)),
        trailing: Icon(
          Icons.arrow_forward,
          color: SecondryColor,
        ),
      ),
    );
  }
}
