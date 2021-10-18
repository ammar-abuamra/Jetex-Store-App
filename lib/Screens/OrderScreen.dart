import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:http/http.dart' as http;
import 'package:jettaexstores/orderApi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int pending = 0;
  int statusPreparing = 1;
  int statusReady = 2;
  int statusShipping = 3;
  int statusCollecting = 4;
  int statusDone = 5;
  int statusCanceled = 6;
  int statusRejected = 7;
  int selectedIndex = 0;
  dynamic storeData;

  List<Orderapi> infos = [];

  Future<List<Orderapi>> _getData(int status) async {
    //int status;
    var getStoreID = {"storeID": sharedPreferences.getString("storeID")};
    print("Status " + status.toString());
    print("ID " + getStoreID['storeID'].toString());
    String url =
        'http://45.76.132.167/api/authentication/storeOrders.php?store_id=' +
            getStoreID['storeID'].toString() +
            '&status=' +
            status.toString();

    var response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final List<Orderapi> orderList = orderapiFromJson(response.body);
      print("orderlist " + orderList.toString());
      return orderList;
    } else {
      // ignore: deprecated_member_use
      return List<Orderapi>();
    }
  }

  void setdata() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      storeData = jsonDecode(sharedPreferences.getString("userdata"));
    });
  }
  //with shared pref

  @override
  void initState() {
    super.initState();

    _getData(pending).then((orderList) {
      setState(() {
        infos = orderList;
      });
    });

    setdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: SecondryColor,
        backgroundColor: PrimaryColor,
        title: Text(getLang(context, 'Orderbar'),style: TextStyle(color: SecondryColor)),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
      decoration: BoxDecoration(
          color:SecondryColor, borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            height: MediaQuery.of(context).size.height * .1,
            width: MediaQuery.of(context).size.height * 1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        statuemethod(pending, getLang(context, 'pending')),
                        statuemethod(statusPreparing, getLang(context, 'Preparing')),
                        statuemethod(statusReady, getLang(context, 'Ready')),
                        statuemethod(statusShipping, getLang(context, 'Shipping')),
                        statuemethod(statusCollecting, getLang(context, 'Collecting')),
                        statuemethod(statusDone, getLang(context, 'Done')),
                        statuemethod(statusRejected, getLang(context, 'Rejected')),
                        statuemethod(statusCanceled, getLang(context, 'Caneled')),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),


          Container(
            height: MediaQuery.of(context).size.height * .68,
            width: MediaQuery.of(context).size.height * .9,
            child: ListView.builder(
              itemBuilder: (context, int index) {
                Orderapi order = infos[index];
                return InkWell(
                  onTap: (){
                    showModalBottomSheet(context: context, builder: (context){

                      return   Container(
                        color: Colors.black54,
                        child: Container(
                          decoration: BoxDecoration(
                              color: SecondryColor, borderRadius: BorderRadius.only(topRight:Radius.circular(20) ,topLeft: Radius.circular(20) )),
                          height: MediaQuery.of(context).size.height * .5,
                          //width: MediaQuery.of(context).size.height * .9,
                          child: Column(
                            children: [
                              SizedBox(height: 9,),
                              Divider(thickness: 4,color:PrimaryColor ,height: 8,endIndent: 110,indent: 110,),
                              ListTile(title: Text('Product name',style: TextStyle(fontWeight: FontWeight.bold,color: PrimaryColor)),trailing: Text("Potato",style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,)),),
                              ListTile(title: Text('اسم المنتج',style: TextStyle(fontWeight: FontWeight.bold,color: PrimaryColor)),trailing: Text("يطاطا",style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,)),),
                              ListTile(title: Text('Price',style: TextStyle(fontWeight: FontWeight.bold,color: PrimaryColor)),trailing: Text(" \$ 30",style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,)),),
                              ListTile(title: Text('Pay Way',style: TextStyle(fontWeight: FontWeight.bold,color: PrimaryColor)),trailing: Text("Cash",style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,)),),
                              ListTile(title: Text('Shipment Way',style: TextStyle(fontWeight: FontWeight.bold,color: PrimaryColor)),trailing: Text("Car",style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,)),),

                            ],
                          ),
                        ),
                      );
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                    decoration: BoxDecoration(
                        color: SecondryColor, borderRadius: BorderRadius.circular(5)),
                    child: ListTile(
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 5, vertical:0),
                      trailing: Row(
                         //crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.check),
                            color:Color(0xffedb54f),
                            onPressed: () async {
                              var id = order.id.toString();
                              // print("Pending " + pending.toString());
                              if (order.status == 0) {
                                await updateStatus(id, statusPreparing);

                                await _getData(pending).then((orderList) {
                                  return infos = orderList;
                                });
                                setState(() {});
                              } else if (order.status == 1) {
                                await updateStatus(id, statusReady);

                                await _getData(statusPreparing).then((orderList) {
                                  return infos = orderList;
                                });
                                setState(() {});
                              } else if (order.status == 2) {
                                await updateStatus(id, statusShipping);

                                await _getData(statusReady).then((orderList) {
                                  return infos = orderList;
                                });
                                setState(() {});
                              } else if (order.status == 3) {
                                await updateStatus(id, statusCollecting);

                                await _getData(statusShipping).then((orderList) {
                                  return infos = orderList;
                                });
                                setState(() {});
                              } else if (order.status == 4) {
                                await updateStatus(id, statusDone);

                                await _getData(statusCollecting)
                                    .then((orderList) {
                                  return infos = orderList;
                                });
                                setState(() {});
                              }
                            },
                          ),
                          IconButton(
                              onPressed: () async {
                                var id = order.id.toString();
                                if (order.status == 0) {
                                  await updateStatus(id, statusRejected);
                                  await _getData(pending).then((orderList) {
                                    return infos = orderList;
                                  });
                                  setState(() {});
                                } else if (order.status == 3) {
                                  await updateStatus(id, statusCanceled);
                                  await _getData(pending).then((orderList) {
                                    return infos = orderList;
                                  });
                                  setState(() {});
                                }
                              },
                              icon: const Icon(Icons.cancel,color: Colors.redAccent,))

                        ],
                      ),
                      title:                         Text(
                        "Order Number :    "+ order.orderNumber.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: PrimaryColor),
                      ),
                    ),
                  ),
                );
              },
              itemCount: null == infos ? 0 : infos.length,
            ),
          )
        ],
      ),
    );
  }

  InkWell statuemethod(int st , String title) {
    return InkWell(
                          onTap: () {
                            setState(() {
                              _getData(st).then((orderList) {
                                setState(() {
                                  infos = orderList;
                                });
                              });
                            });
                          },
                          child: buildContainer(title,Color(0xffedb54f)));
  }

  Widget buildContainer(String st, Color co) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: co,
              borderRadius: BorderRadiusDirectional.circular(5)),
          height: 40,
          width: 65,
          child: Text(st, textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,),)),
    );
  }


}

Future<bool> updateStatus(var id, int status) async {
  print(status.toString());

  final response = await http.post(
      Uri.parse('http://45.76.132.167/api/authentication/updateStatus.php'),
      body: {"id": id.toString(), "status": status.toString()});

  print(response.body);
  return true;
}

