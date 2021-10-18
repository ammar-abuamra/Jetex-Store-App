import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jettaexstores/Module/productjson.dart';
import 'package:jettaexstores/Module/productlastapi.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/main.dart';
import 'package:jettaexstores/widget.dart';
import 'package:jettaexstores/Module/Info_Api.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// class theadd {
//   var ure = Uri.http('45.76.132.167', '/api/authentication/insertproduct.php');
//   Future<String> insertdata(ProductApi product)async{
//     final response = await http.post(ure, body: {
//       "storeID": sharedPreferences.getString("storeID"),
//        "id":product.id,
//       "name_en": product.nameEn,
//        "name_ar":product.nameAr,
//       // "image": product.image,
//       "description_en":product.descriptionEn,
//       "description_ar":product.descriptionAr,
//       "price": product.price,
//       //"price2": product.price2,
//       //"status": product.status,
//       //  "store_id":product.storeId,
//       // "category_id":product.categoryId,
//       // "sub_category_id": product.subCategoryId,
//     });
//
//
//
//   }
//
// }

// class update{
//
//   Future<String> updat(ProductApi prod) async {
//     var ure = Uri.http('45.76.132.167', '/api/authentication/updatedatainfo.php');
//     var data = {
//       "id": prod.id,
//       "name_en": prod.nameEn,
//       "name_ar": prod. nameAr,
//       "description_en":  prod.descriptionEn,
//       "description_ar":  prod.descriptionAr,
//       "price":  prod.price,
//     };
//     var xbody = {
//       "table": 'store_products',
//       "data": data,
//       "feild":'id',
//       "value":4
//
//     };
//     print(xbody);
//     final response = await http.post(
//         ure,
//         body:jsonEncode (xbody) ,headers: {
//       'Content-type': 'application/json'
//     }
//     );
//     print(response.body);
//   }
// }
class EditProduct extends StatefulWidget {


  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {



  TextEditingController en = TextEditingController();
  TextEditingController idt = TextEditingController();
  TextEditingController ar = TextEditingController();
  // TextEditingController im = TextEditingController();
  TextEditingController den = TextEditingController();
  TextEditingController der = TextEditingController();
  TextEditingController p1 = TextEditingController();
  TextEditingController id = TextEditingController();
  // TextEditingController st = TextEditingController();
  //TextEditingController sid = TextEditingController();
  //TextEditingController ci = TextEditingController();
  //TextEditingController si = TextEditingController();

  // updaedata(ProductApi product )async{
  //   var msg = await update().updat(product);
  // }
  @override
  Widget build(BuildContext context) {

    final productdata = ModalRoute.of(context).settings.arguments as Map <String , Object>;
    Future<String> updat(ProductsApi prod) async {
      var ure = Uri.http('45.76.132.167', '/api/authentication/updatedatainfo.php');
      var data = {
        "id": productdata['id'],
        "name_en": prod.nameEn,
        "name_ar": prod. nameAr,
        "description_en":  prod.descriptionEn,
        "description_ar":  prod.descriptionAr,
        "price":  prod.price,
      };
      var xbody = {
        "table": 'store_products',
        "data": data,
        "feild":'id',
        "value":productdata['id']

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

    return Scaffold(
      backgroundColor: PrimaryColor,
      appBar: AppBar(
        foregroundColor: SecondryColor,
        backgroundColor: PrimaryColor,
        title: Text('Edit Product',style: TextStyle(color: SecondryColor,)),

      ),
      body: Form(
        child: ListView(
          children: [Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.height * .9,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        photocon(Icons.camera_alt,"Primary Product Photo"),
                        photocon(Icons.camera_alt_outlined,"Secondery Photo"),
                        photocon(Icons.camera_alt_outlined,"Secondery Photo"),
                        photocon(Icons.camera_alt_outlined,"Secondery Photo"),
                        photocon(Icons.camera_alt_outlined,"Secondery Photo"),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .8,
                width: MediaQuery.of(context).size.height * .7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      cont(en,Icons.edit, TextInputType.text,productdata['nameen']),
                      descont(den,Icons.title_outlined,productdata['desen'], TextInputType.text,"Descrption"),
                      cont(der,Icons.edit,  TextInputType.text,productdata['namear'],),
                      descont(ar,Icons.title_outlined,productdata['desar'], TextInputType.text,"الوصف"),
                      CategoresContinaer("category"),
                      CategoresContinaer("category"),
                      CategoresContinaer("category"),
                      CategoresContinaer("category"),
                      colorContinaer(" Color",context),
                      payContinaer('Pay Way'),
                      cont(p1,Icons.edit,   TextInputType.number,productdata['price'],),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    ProductsApi product=ProductsApi(
                      //image: im.text,
                      //categoryId: ci.text,
                        descriptionAr:der.text ,
                        descriptionEn: den.text,
                        //id: id.text,
                        nameAr:ar.text ,
                        //  price2:p2.text ,
                        //rice: p1.text,
                        //status:st.text ,
                        //storeId: sid.text,
                        //subCategoryId: si.text,
                        nameEn: en.text);
                    updat(product);
                    print(product);
                  });
                },
                child: Container(
                  //padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(
                    horizontal: 90,
                  ),
                  decoration: BoxDecoration(
                      color: SecondryColor, borderRadius: BorderRadius.circular(5)),
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
          )],

        ),
      ),
    );
  }


  Container photocon(IconData ic , String tx) {
    return Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: SecondryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                           ic,
                            color: PrimaryColor,
                            size: 40,
                          ),
                          Text(
                           tx,
                            style: TextStyle(fontSize: 10,
                                color: PrimaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    );
  }

  Container cont(TextEditingController te ,  IconData icon ,  TextInputType tybe , String lab) {
    return Container(
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: SecondryColor,
          borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        leading: Icon(
          icon,
          color: PrimaryColor,
        ),
        title: TextFormField(
          controller:te,
          style: TextStyle(color: PrimaryColor),
          // controller: ,
          keyboardType: tybe,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: PrimaryColor),
                borderRadius: BorderRadius.circular(2)),
             contentPadding:
                                     EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            labelText:lab,
         labelStyle: TextStyle(color: PrimaryColor),
           // hintText: title,
           // hintStyle: TextStyle(color: PrimaryColor),
          ),
        ),
      ),
    );
  }
  Container descont(TextEditingController te ,  IconData icon ,String title ,  TextInputType tybe , String lab) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: SecondryColor,
          borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        leading: Icon(
          icon,
          color: PrimaryColor,
        ),
        title: Container(

          child: TextFormField(
            controller:te,
            style: TextStyle(color: PrimaryColor),
            // controller: ,
            keyboardType: tybe,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: PrimaryColor),
                  borderRadius: BorderRadius.circular(2)),
              contentPadding:
              EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              labelText:lab,
              labelStyle: TextStyle(color: PrimaryColor),
              hintText: title,
              hintStyle: TextStyle(color: PrimaryColor),
            ),
          ),
        ),
      ),
    );
  }
Color color = Colors.red;
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);
  Widget bildcolorpiker()=>ColorPicker(
      pickerColor: color,
      onColorChanged:(color)=> setState(() => this.color = color));

  void PickColor(BuildContext context)=>showDialog(
      context: context,
     builder:(context)=> AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
              child: Column(children: [
                bildcolorpiker(),
                TextButton(child: Text('Save'),
               onPressed: (){Navigator.of(context).pop();}, )
              ],
              ))) );

              Container colorContinaer(String st, BuildContext ctx) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: SecondryColor, borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        title: Text(st,
            style:
            TextStyle(color: PrimaryColor, fontWeight: FontWeight.bold)),
        trailing: Row(mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){
                PickColor(ctx);

              },
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: CircleAvatar(backgroundColor:color,radius: 12,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: CircleAvatar(backgroundColor: Colors.amber,radius: 12,),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: CircleAvatar(backgroundColor: Colors.amber,radius: 12,),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: CircleAvatar(backgroundColor: Colors.amber,radius: 12,),
            ),

          ],
        ),
      ),
    );
  }

  Container CategoresContinaer(String st) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: SecondryColor, borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        title: Text(st,
            style:
            TextStyle(color: PrimaryColor, fontWeight: FontWeight.bold)),
        trailing: Icon(
          Icons.add,
          color: PrimaryColor,
        ),
      ),
    );
  }
  Container payContinaer(String st) {
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: SecondryColor, borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        title: Text(st,
            style:
            TextStyle(color: PrimaryColor, fontWeight: FontWeight.bold)),
        trailing: Row(mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Visa    ",
                style:
                TextStyle(color: PrimaryColor, fontWeight: FontWeight.bold)),
            Text("Cash",
                style:
                TextStyle(color: PrimaryColor, fontWeight: FontWeight.bold))

          ],
        ),
      ),
    );
  }

}


// Future<bool> insertinfo() async {
//   String em='';
//   String url = ('http://45.76.132.167/api/authentication/insertinfo.php');
//   var ure = Uri.http('45.76.132.167', '/api/authentication/insertinfo.php');
//   var xbody = {
//     "id" : '',
//     'store_image_id':'',
//     "location":'',
//     "phone_number_id":'',
//     " store_id":'',
//     "email":em
//   };
//   var response = await http.post(ure,body: jsonEncode(xbody), headers:{
//     'Content-type': 'application/json',
//     'Accept': 'application/json'
//   } );
//   var responsebody = jsonDecode(response.body);
//   print
//     (
//       responsebody
//   );
//
//
//
//
// }

