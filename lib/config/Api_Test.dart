import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Module/PodcutDataList.dart';
import 'package:jettaexstores/Widget/SlideButton.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/widget.dart';
import 'package:http/http.dart' as http;
import 'package:jettaexstores/Module/productjson.dart';
import 'package:jettaexstores/config/Constant.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class Api_test extends StatefulWidget {
  @override
  _Api_testState createState() => _Api_testState();
}

class _Api_testState extends State<Api_test> {



  Future<List<ProductApi>> getData() async {
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
  void initState() {
    // TODO: implement initStat

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: SecondryColor,
      body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                  child: Container(
                child: Text('Loading...'),
              ));
            } else {
              return ListView.builder(
                //separatorBuilder: (context, index) => Divider(),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return SlidableWidget(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color(0xffedb54f),
                          borderRadius: BorderRadiusDirectional.circular(15)),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        leading: CircleAvatar(
                            radius: 28, backgroundImage: NetworkImage(snapshot.data[index].image)),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$ ${snapshot.data[index].price}',
                                          style: TextStyle(color: SecondryColor)),
                            Icon(
                              Icons.favorite_border,
                              color: Colors.black54,
                            )
                          ],
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data[index].nameEn,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: SecondryColor),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              snapshot.data[index].descriptionEn,
                              style: TextStyle(color: Colors.black54),
                            )
                          ],
                        ),
                        onTap: () {},
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

class Utils {
  static void showSnackBar(BuildContext context, String message) =>
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message)),
        );
}




