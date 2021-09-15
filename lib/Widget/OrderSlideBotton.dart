

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:jettaexstores/config/Constant.dart';

enum SlidableAction { archive, share, more, delete }

class SlideButtonOrder<T> extends StatelessWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlideButtonOrder({
    @required this.child,
    @required this.onDismissed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
    actionPane: SlidableDrawerActionPane(),
    child: child,



    /// right side

    secondaryActions: <Widget>[
      SlideContiner(Icons.check_circle, Colors.black54, 'Accept'),
      SlideContiner(Icons.close, Colors.red, 'Reject')

    ],
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