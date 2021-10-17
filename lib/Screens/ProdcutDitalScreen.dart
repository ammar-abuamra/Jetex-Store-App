import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Module/PodcutDataList.dart';
import 'package:jettaexstores/Module/productjson.dart';
import 'package:jettaexstores/Widget/SlideButton.dart';
import 'package:jettaexstores/alertdilog.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/widget.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_slidable/flutter_slidable.dart';

class ProscutDitalScreen extends StatefulWidget {
  @override
  _ProscutDitalScreenState createState() => _ProscutDitalScreenState();
}

class _ProscutDitalScreenState extends State<ProscutDitalScreen> {


  Future<List<ProductApi>> _getData() async {
    String url = " http://45.76.132.167/api/authentication/productview.php?";
    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    List<ProductApi> products = [];

    for (var itm in jsonData) {
      products.add(ProductApi.fromJson(itm));
    }
    return products;
  }
  void showAlertDialog(
      BuildContext context,
      String nameen,
      String namear,
      String desen,
      String desar,
      String imag,
      String price){
    final AlertDialog alert = AlertDialog(backgroundColor: SecondryColor,shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
      content: cad(nameen,namear,desen,desar,imag,price),
    );
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return alert;
        });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, 'AddProdcut');
          }, icon: Icon(Icons.add))
        ],
        foregroundColor: SecondryColor,
        backgroundColor: PrimaryColor,
        title: Text('Products',style: TextStyle(color: SecondryColor)),

      ),
      backgroundColor: SecondryColor,
      body: FutureBuilder(
          future: _getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                  child: Container(
                    child: Text('Loading...'),
                  ));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actions: <Widget>[
                      SlideContiner(Icons.share, Colors.indigo, 'Share'),

                    ],
                    secondaryActions: <Widget>[
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context,'EditProduct',

                                arguments:{
                                  "id": snapshot.data[index].id,
                                  "namear": snapshot.data[index].nameAr,
                                  "nameen": snapshot.data[index].nameEn,
                                  "image": snapshot.data[index].image,
                                  "desar": snapshot.data[index].descriptionAr,
                                  "desen": snapshot.data[index].descriptionEn,
                                  "price": snapshot.data[index].price,


                                }

                            );



                          },
                          child: SlideContiner(Icons.edit, Colors.black54, 'Edit')),
                      SlideContiner(Icons.delete, Colors.red, 'Delete')

                    ],
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color(0xffedb54f),
                          borderRadius: BorderRadiusDirectional.circular(15)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        leading: Container(
                          height: MediaQuery.of(context).size.height *2,
                          width: MediaQuery.of(context).size.width * .21,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(8),
                              image:DecorationImage(image: NetworkImage(snapshot.data[index].image),fit: BoxFit.fill) ),
                        ),

                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Drag ',
                                style: TextStyle(color: SecondryColor)),
                            Icon(
                              Icons.arrow_back,
                              color: Colors.black54,
                            )
                          ],
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              snapshot.data[index].nameEn,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: SecondryColor),
                            ),
                            const SizedBox(height: 4),
                            // Text(
                            //   snapshot.data[index].descriptionEn,
                            //   style: TextStyle(color: Colors.black54),
                            // )
                          ],
                        ),
                        onTap: () {
                          print(snapshot.data[index].id);
                          print(snapshot.data[index].nameEn);
                          showAlertDialog(context,

                            snapshot.data[index].nameAr,
                            snapshot.data[index].descriptionEn,
                            snapshot.data[index].descriptionAr,
                            snapshot.data[index].price,
                            snapshot.data[index].nameEn,
                            snapshot.data[index].image,
                           );
                          //showDialog(
                             // context: context,
                             // builder: (BuildContext ctx) {
                               // return alert;
                              //});
                        },
                      ),
                    ),
                  );
                },
              );
            }
          }),

    );
  }
}

Container SlideContiner(IconData icon , Color color , String txt) {
  return Container(
    margin: EdgeInsets.only(left: 5 ,right: 5),

    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,color: Colors.white,),
        Text(txt,style: TextStyle(color: Colors.white),)
      ],),
  );
}





class Utils {
  static void showSnackBar(BuildContext context, String message) =>
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message)),
        );
}
