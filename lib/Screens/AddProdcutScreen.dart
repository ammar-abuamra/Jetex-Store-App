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
      "storeID": sharedPreferences.getString("storeID"),
    //  "id":product.id,
       "name_en": product.nameEn,
     // "name_ar":product.nameAr,
     // "image": product.image,
      "description_en":product.descriptionEn,
      //"description_ar":product.descriptionAr,
      "price": product.price,
      //"price2": product.price2,
      //"status": product.status,
    //  "store_id":product.storeId,
     // "category_id":product.categoryId,
     // "sub_category_id": product.subCategoryId,
    });



  }

}
class AddProdcut extends StatefulWidget {
  @override
  _AddProdcutState createState() => _AddProdcutState();
}

class _AddProdcutState extends State<AddProdcut> {
  final AlertDialog alert = AlertDialog(
    content: AddProdcutdilog(),
  );

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

  TextEditingController nameedit = TextEditingController();
  TextEditingController idt = TextEditingController();
  TextEditingController ar = TextEditingController();
  TextEditingController im = TextEditingController();
  TextEditingController den = TextEditingController();
  TextEditingController der = TextEditingController();
  TextEditingController p1 = TextEditingController();
  TextEditingController p2 = TextEditingController();
  TextEditingController st = TextEditingController();
  //TextEditingController sid = TextEditingController();
  //TextEditingController ci = TextEditingController();
  //TextEditingController si = TextEditingController();

  insertdata(ProductApi product )async{
    var msg = await theadd().insertdata(product);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: SecondryColor,
      appBar: appBar,
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height -
                      MediaQuery.of(context).padding.top) /
                      3.95,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              color: SecondryColor,
                              size: 45,
                            ),
                            Text(
                              'Add Product Photo',
                              style: TextStyle(
                                  color: SecondryColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
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
                    1.55,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      cont(nameedit,Icons.edit, 'Product Name', TextInputType.text),
                      //cont(ar,Icons.edit, 'Product Name', TextInputType.text),
                      cont(den,Icons.edit, 'Descrption', TextInputType.text),
                      //cont(der),
                      //cont(idt,Icons.edit, 'Product Name', TextInputType.text),
                      //cont(im,Icons.edit, 'Product Name', TextInputType.text),
                      cont(p1,Icons.edit, 'Product Price', TextInputType.number),
                      //cont(p2),
                      //cont(st),

                      // Container(
                      //   padding: EdgeInsets.all(5),
                      //   margin: EdgeInsets.all(5),
                      //   decoration: BoxDecoration(
                      //       color: PrimaryColor,
                      //       borderRadius: BorderRadius.circular(5)),
                      //   child: ListTile(
                      //     leading: Icon(
                      //       Icons.dashboard_outlined,
                      //       color: SecondryColor,
                      //     ),
                      //     title: TextFormField(
                      //       controller: nameedit,
                      //       style: TextStyle(color: SecondryColor),
                      //       // controller: ,
                      //       keyboardType: TextInputType.text,
                      //       decoration: InputDecoration(
                      //         labelText: 'Product Category',
                      //         labelStyle: TextStyle(color: SecondryColor),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.all(5),
                      //   margin: EdgeInsets.all(5),
                      //   decoration: BoxDecoration(
                      //       color: PrimaryColor,
                      //       borderRadius: BorderRadius.circular(5)),
                      //   child: ListTile(
                      //     leading: Icon(
                      //       Icons.dashboard,
                      //       color: SecondryColor,
                      //     ),
                      //     title: TextFormField(
                      //       controller: nameedit,
                      //       style: TextStyle(color: SecondryColor),
                      //       // controller: ,
                      //       keyboardType: TextInputType.text,
                      //       decoration: InputDecoration(
                      //         labelText: 'Product Sub Category',
                      //         labelStyle: TextStyle(color: SecondryColor),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.all(5),
                      //   margin: EdgeInsets.all(5),
                      //   decoration: BoxDecoration(
                      //       color: PrimaryColor,
                      //       borderRadius: BorderRadius.circular(5)),
                      //   child: ListTile(
                      //     leading: Icon(
                      //       Icons.monetization_on,
                      //       color: SecondryColor,
                      //     ),
                      //     title: TextFormField(
                      //       controller: nameedit,
                      //       style: TextStyle(color: SecondryColor),
                      //       // controller: ,
                      //       keyboardType: TextInputType.text,
                      //       decoration: InputDecoration(
                      //         labelText: 'Product Price',
                      //         labelStyle: TextStyle(color: SecondryColor),
                      //       ),
                      //     ),
                      //   ),
                      // ),





                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  setState(() {
                    ProductApi product=ProductApi(
                        //image: im.text,
                        //categoryId: ci.text,
                        //descriptionAr:der.text ,
                        descriptionEn: den.text,
                       // id: idt.text,
                      //  nameAr:ar.text ,
                      //  price2:p2.text ,
                        price: p1.text,
                        //status:st.text ,
                        //storeId: sid.text,
                        //subCategoryId: si.text,

                        nameEn: nameedit.text);
                    insertdata(product);
                    print(product);
                  });
                },
                child: Container(
                  //padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(
                    horizontal: 90,
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
                    margin: EdgeInsets.all(5),
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
