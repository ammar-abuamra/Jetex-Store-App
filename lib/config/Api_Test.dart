import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Module/PodcutDataList.dart';
import 'package:jettaexstores/Widget/SlideButton.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/widget.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_slidable/flutter_slidable.dart';

class Api_test extends StatefulWidget {



  @override
  _Api_testState createState() => _Api_testState();
}

class _Api_testState extends State<Api_test> {
  //List<Data> items = List.of(PData.Datas);


  Future getData() async {
    String url = 'https://jsonplaceholder.typicode.com/posts';
    var response = await http.get(Uri.parse(url));
    var responsebody = jsonDecode(response.body);

    return responsebody;
  }



  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: SecondryColor,
      body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return ListView.builder(
              //separatorBuilder: (context, index) => Divider(),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                //final item = items[index];
                return  SlidableWidget(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color(0xffedb54f),
                        borderRadius: BorderRadiusDirectional.circular(15)
                    ),

                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,),
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage('')),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('\$ 30', style: TextStyle(color: SecondryColor)),
                          Icon(Icons.favorite_border, color: Colors.black54,)
                        ],
                      ),

                      title: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [

                          Text(

                            snapshot.data[index]['title'],

                            style: TextStyle(fontWeight: FontWeight.bold,
                                color: SecondryColor),

                          ),

                          const SizedBox(height: 4),

                          Text(
                          snapshot.data[index]['body'],
                            style: TextStyle(color: Colors.black54),)

                        ],

                      ),


                      onTap: () {},

                    ),
                  ),
                );


              },

            );
          }
      ),

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