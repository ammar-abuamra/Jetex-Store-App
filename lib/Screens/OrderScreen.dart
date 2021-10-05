import 'package:flutter/material.dart';
import 'package:jettaexstores/Module/OrderDataList.dart';
import 'package:jettaexstores/Module/OrderDataList.dart';
import 'package:jettaexstores/Module/PodcutDataList.dart';
import 'package:jettaexstores/Screens/ProdcutDitalScreen.dart';
import 'package:jettaexstores/Widget/OrderSlideBotton.dart';
import 'package:jettaexstores/Widget/SlideButton.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/widget.dart';

class OrderScreen extends StatefulWidget {

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {


  List<OrderData> items = List.of(OData.Datas);

  void dismissSlidableItem(){}
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: appBar,
    backgroundColor: SecondryColor,
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount:items.length,
        itemBuilder: (context , index ){
          final item = items[index];
          return  SlideButtonOrder(child: buildListTile(item),
            onDismissed: (action) =>
                dismissSlidableItem(),
          );
        },

      ),
    );
  }
}

Widget buildListTile(item) => Container(
  margin: EdgeInsets.all(5),
  decoration: BoxDecoration(
      color: Color(0xffedb54f),
      borderRadius: BorderRadiusDirectional.circular(15)
  ),
  child:   ListTile(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ),

    leading: CircleAvatar(

      radius: 28,

      backgroundImage: NetworkImage(item.urlAvatar),

    ),
    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('\$ 30',style: TextStyle(color: SecondryColor)),
        Icon(Icons.favorite_border,color: Colors.black54,)
      ],
    ),

    title: Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text(

          item.username,

          style: TextStyle(fontWeight: FontWeight.bold,color: SecondryColor),

        ),

        const SizedBox(height: 4),

        Text(item.message,style: TextStyle(color: Colors.black54),)

      ],

    ),


    onTap: () {
    },

  ),
);
