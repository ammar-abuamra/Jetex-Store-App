import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Module/reviewapi.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/widget.dart';

class RevewiesScreen extends StatefulWidget {
  @override
  _RevewiesScreenState createState() => _RevewiesScreenState();
}



class _RevewiesScreenState extends State<RevewiesScreen> {

  Future<List<Reviewmodule>> _getData() async {
    String url = 'http://45.76.132.167/api/authentication/reviewsapi.php';
    var response = await http.get(Uri.parse(url));
    var jsonData = json.decode(response.body);
    List<Reviewmodule> reviwe = [];

    for (var itm in jsonData) {
      reviwe.add(Reviewmodule.fromJson(itm));
    }
    return reviwe;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        backgroundColor: SecondryColor,
        body: FutureBuilder(
          future: _getData(),
          builder: (BuildContext contetx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                  child: Container(
                    child: Text('Loading...'),
                  ));
            } else{  return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 50),
                        Card(

                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32),
                          ),
                          color: PrimaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Row(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: SecondryColor,

                                      radius: 35,

                                      backgroundImage: NetworkImage(''),
                                    ),
                                    SizedBox(width: 15,),
                                    Column(
                                      children: [
                                        Text(
                                          snapshot.data[index].nameEn,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: SecondryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          //textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          snapshot.data[index].name,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          //textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),


                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      ' Rate',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: SecondryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),

                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ), Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ), Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ), Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ), Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                );
              },

            );}

          },


        ));
  }
}
