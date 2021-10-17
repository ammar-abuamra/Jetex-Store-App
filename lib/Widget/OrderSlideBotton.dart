

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jettaexstores/Module/OrderDataList.dart';
import 'package:jettaexstores/Screens/ProdcutDitalScreen.dart';
import 'package:jettaexstores/config/Constant.dart';

enum SlidableAction { archive, share, more, delete }

class SlideButtonOrder<T> extends StatefulWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlideButtonOrder({
    @required this.child,
    @required this.onDismissed,
    Key key,
  }) : super(key: key);


  @override
  State<SlideButtonOrder<T>> createState() => _SlideButtonOrderState<T>();
}

class _SlideButtonOrderState<T> extends State<SlideButtonOrder<T>> {
  @override
  List<OrderData> items = List.of(OData.Datas);
  void dismissSlidableItem(
      BuildContext context, int index, SlidableAction action) {
    setState(() {
      items.removeAt(index);
    });

    switch (action) {
      case SlidableAction.archive:
        Utils.showSnackBar(context, 'Chat has been archived');
        break;
      case SlidableAction.share:
        Utils.showSnackBar(context, 'Chat has been shared');
        break;
      case SlidableAction.more:
        Utils.showSnackBar(context, 'Selected more');
        break;
      case SlidableAction.delete:
        Utils.showSnackBar(context, 'Chat has been deleted');
        break;
    }
  }
  Widget build(BuildContext context) => Slidable(
    actionPane: SlidableDrawerActionPane(),
    child: widget.child,



    /// right side

    secondaryActions: <Widget>[
      SlideContiner(Icons.check_circle, Colors.black54, 'Accept'),
      InkWell(child: SlideContiner(Icons.close, Colors.red, 'Reject'),


      )],
  );

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
}