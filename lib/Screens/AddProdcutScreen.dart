import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jettaexstores/Module/productjson.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/Widget/AddProdcutScreen%5DDilog.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/main.dart';
import 'package:jettaexstores/widget.dart';
import 'package:jettaexstores/Module/Info_Api.dart';

class theadd {
  var ure = Uri.http('45.76.132.167', '/api/authentication/insertproduct.php');
  Future<String> insertdata(ProductApi product)async{
    final response = await http.post(ure, body: {
      //"storeID": sharedPreferences.getString("storeID"),
      "store_id":product.storeId,
       "name_en": product.nameEn,
      "name_ar": product.nameAr,
      "price": product.price,

    });
   print(response.body);



  }

}
class AddProdcut extends StatefulWidget {
  @override
  _AddProdcutState createState() => _AddProdcutState();
}

class _AddProdcutState extends State<AddProdcut> {
  // final AlertDialog alert = AlertDialog(
  //   content: AddProdcutdilog(),
  // );

  // File _image;
  // final picker = ImagePicker();
  //
  // Future getImage(ImageSource src) async {
  //   final pickedFile = await picker.pickImage(source: src);
  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //       print(pickedFile.path);
  //     } else {
  //       print('non');
  //     }
  //   });
  // }

  TextEditingController nameen = TextEditingController();
  TextEditingController namear = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController storeid = TextEditingController();



  insertdata(ProductApi product )async{
    var msg = await theadd().insertdata(product);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: SecondryColor,
      appBar: AppBar(
        foregroundColor: SecondryColor,
        backgroundColor: PrimaryColor,
        title: Text('Add Product',style: TextStyle(color: SecondryColor)),

      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top -
                    MediaQuery.of(context).padding.bottom) /
                    1.5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      cont(storeid,Icons.edit, 'Store id', TextInputType.text),
                      cont(nameen,Icons.edit, 'Product Name In English', TextInputType.text),
                      cont(namear,Icons.title, 'اسم المنتج', TextInputType.text),
                      cont(price,Icons.money_off, 'Product Price', TextInputType.phone),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    ProductApi product=ProductApi(
                      storeId: storeid.text,
                       nameAr:namear.text ,
                        price: price.text,
                        nameEn: nameen.text
                    );
                    insertdata(product);
                    print(product);
                  });
                },
                child: Container(
                  //padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(
                    horizontal: 80,
                  ),
                  decoration: BoxDecoration(
                      color: PrimaryColor, borderRadius: BorderRadius.circular(5)),
                  child: ListTile(
                    title: Text('Add Product ',
                        style: TextStyle(
                            color: SecondryColor, fontWeight: FontWeight.bold)),
                    trailing: Icon(
                      Icons.arrow_right,
                      color: SecondryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container cont(TextEditingController te ,  IconData icon , String title , TextInputType tybe) {
    return Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.only(left: 15,right: 15,top: 30,bottom: 15),
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: ListTile(
                      leading: Icon(
                        icon,
                        color: SecondryColor,
                      ),
                      title: TextFormField(
                        controller:te,
                        style: TextStyle(color: SecondryColor),
                        // controller: ,
                        keyboardType: tybe,
                        decoration: InputDecoration(
                          labelText: title,
                          labelStyle: TextStyle(color: SecondryColor),
                        ),
                      ),
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
        title: Text(st,
            style:
            TextStyle(color: SecondryColor, fontWeight: FontWeight.bold)),
        trailing: Icon(
          Icons.add,
          color: SecondryColor,
        ),
      ),
    );
  }
}

