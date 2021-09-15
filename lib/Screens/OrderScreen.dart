import 'package:flutter/material.dart';
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


  List<Data> items = List.of(PData.Datas);

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
