import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:jettaexstores/Module/productjson.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/config/Constant.dart';

class cad extends StatefulWidget {


  final String nameen ;
  final String desen;
  final String desar;
  final String namear;
  final String price;
  final String imag;

  const cad( this.nameen, this.desen, this.desar, this.price,this.namear,  this.imag) ;





  @override
  State<cad> createState() => _cadState();
}

class _cadState extends State<cad> {

  Future<List<ProductApi>> _getData() async {
    String url = 'http://45.76.132.167/api/authentication/productview.php';
    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    List<ProductApi> products = [];

    for (var itm in jsonData) {
      products.add(ProductApi.fromJson(itm));
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.imag);
    return FutureBuilder(
      future: _getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.data == null) {
          return Center(
              child: Container(
                child: Text('Loading...'),
              ));
        } else {
          return  Container(
            height: MediaQuery
                .of(context)
                .size
                .height * .75,
            width: MediaQuery
                .of(context)
                .size
                .width * .75,
            decoration: BoxDecoration(
              color: SecondryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height *.12,
                  width: MediaQuery.of(context).size.width *.35,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3,color: PrimaryColor,),
                      borderRadius: BorderRadius.all(Radius.circular(18)),

                      image:DecorationImage(image: widget.imag.isNotEmpty
                          ? NetworkImage(widget.imag)
                          : null,  fit: BoxFit.fill) ),
                  // child: CircleAvatar(
                  //     radius: 40, backgroundImage:  NetworkImage('https://th.bing.com/th/id/R.3e90674b7ea7ef69d4301c3d7cce2d8a?rik=73p7jRIdO%2fLj5A&pid=ImgRaw&r=0')   ),
                ),

                Container(
                  child: Center(
                      child: Text(
                     widget.nameen,
                        style: TextStyle(
                            color: SecondryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: PrimaryColor,),
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                ),
                buildListTile(
                    Icons.edit,

                    widget.desen,
                ),
                Container(
                  child: Center(
                      child: Text(
                        widget.namear,
                        style: TextStyle(
                            color: SecondryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: PrimaryColor,),
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                ),
                buildListTile(Icons.star,widget.desar),
                Container(
                  child: Center(
                      child: Text(
                        'Price',
                        style: TextStyle(
                            color: SecondryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: PrimaryColor,),
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                ),
                buildListTile(Icons.money_off,widget.price),
                // buildListTile(
                //     Icons.location_on, getLang(context, "StoreLocationEdit")),
              ],

            ),
          );
        }}


        );



  }


  ListTile buildListTile(IconData icon, String fname) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0xffedb54f),
      ),
      title: Text(
        fname,textAlign: TextAlign.center,
        style: TextStyle(color: PrimaryColor),
      ),
    );
  }
}
