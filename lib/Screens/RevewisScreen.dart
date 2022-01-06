import 'dart:convert';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Module/reviewapi.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/Widget/reviewdilog.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RevewiesScreen extends StatefulWidget {
  @override
  _RevewiesScreenState createState() => _RevewiesScreenState();
}

class _RevewiesScreenState extends State<RevewiesScreen> {
  List<ReviewApi> review = [];
  dynamic storeData;

  Future<List<ReviewApi>> _getReview() async {
    var getStoreID = {"storeID": sharedPreferences.getString("storeID")};
    print(getStoreID['storeID'].toString());

    String url =
        'http://45.76.132.167/api/authentication/reviewsapi.php?stores_id=' +
            getStoreID['storeID'].toString();

    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final List<ReviewApi> reviewList = reviewApiFromJson(response.body);

      return reviewList;
    } else {
      // ignore: deprecated_member_use
      return List<ReviewApi>();
    }
  }

  void setdata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      storeData = jsonDecode(sharedPreferences.getString("userdata"));
    });
  }

  void showAlertDialog(
    BuildContext context,
    String name,
    String review,
  ) {
    final AlertDialog alert = AlertDialog(
      backgroundColor: SecondryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: revied(
        name,
        review,
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return alert;
        });
  }

  @override
  void initState() {
    super.initState();

    _getReview().then((reviewList) {
      setState(() {
        review = reviewList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: SecondryColor,
        backgroundColor: PrimaryColor,
        title: Text(getLang(context, "Reviewbar"),
            style: TextStyle(color: SecondryColor)),
      ),
      backgroundColor: SecondryColor,
      body: ListView.builder(
          itemBuilder: (context, int index) {
            ReviewApi reviewApi = review[index];
            if (review.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      height: 60,
                      width: 60,
                      child: CircularProgressIndicator(
                        backgroundColor: SecondryColor,
                        valueColor: AlwaysStoppedAnimation<Color>(PrimaryColor),
                        strokeWidth: 5,
                      ),
                    ),
                    Text(
                      getLang(context, "Indicator"),
                      style: TextStyle(
                          color: PrimaryColor, fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              );
            } else {
              return Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 3),
                      InkWell(
                        onTap: () {
                          showAlertDialog(
                              context, reviewApi.name, reviewApi.review);
                        },
                        child: Card(
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          color: PrimaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: SecondryColor,
                                      radius: 35,
                                      backgroundImage: NetworkImage(''),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          reviewApi.name,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: SecondryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          //textAlign: TextAlign.left,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(top: 5),
                                          width: 120,
                                          child: Text(
                                            reviewApi.review,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 15,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            //textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      ' Rate :  ',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: SecondryColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(' ${reviewApi.rating.toString()}  ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: SecondryColor,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
          itemCount: null == review ? 0 : review.length),
    );
  }
}

// To parse this JSON data, do
//
//     final reviewApi = reviewApiFromJson(jsonString);

List<ReviewApi> reviewApiFromJson(String str) =>
    List<ReviewApi>.from(json.decode(str).map((x) => ReviewApi.fromJson(x)));

String reviewApiToJson(List<ReviewApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReviewApi {
  ReviewApi({
    this.id,
    this.userId,
    this.storesId,
    this.rating,
    this.review,
    this.name,
    this.email,
  });

  int id;
  int userId;
  int storesId;
  int rating;
  String review;
  String name;
  String email;

  factory ReviewApi.fromJson(Map<String, dynamic> json) => ReviewApi(
        id: json["id"],
        userId: json["user_id"],
        storesId: json["stores_id"],
        rating: json["rating"],
        review: json["review"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "stores_id": storesId,
        "rating": rating,
        "review": review,
        "name": name,
        "email": email,
      };
}