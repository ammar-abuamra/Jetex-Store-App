import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Module/PodcutDataList.dart';
import 'package:jettaexstores/Widget/SlideButton.dart';
import 'package:jettaexstores/widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProscutDitalScreen extends StatefulWidget {
  @override
  _ProscutDitalScreenState createState() => _ProscutDitalScreenState();
}

class _ProscutDitalScreenState extends State<ProscutDitalScreen> {
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
  List<Data> items = List.of(PData.Datas);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar,
        bottomNavigationBar: CbottomNavigationBar,
        body: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount:items.length,
          itemBuilder: (context , index ){
            final item = items[index];
            return  SlidableWidget(child: buildListTile(item),
              onDismissed: (action) =>
                  dismissSlidableItem(context, index, action),
            );
          },

        ));
  }
}

// Widget CategoryContinaer(
//   String st,
// ) {
//   return Stack(
//     children: [
//       Container(
//         padding: EdgeInsets.all(5),
//         margin: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             color: Color(0xffedb54f), borderRadius: BorderRadius.circular(5)),
//         child: ListTile(
//           onTap: () {},
//           title: Text(st,
//               style:
//                   TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//           leading: CircleAvatar(
//             child: Text(
//               'Photo Edit',
//             ),
//             backgroundColor: Colors.white,
//             radius: 120,
//           ),
//         ),
//       )
//     ],
//   );
// }


Widget buildListTile(Data item) => Container(
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
        Text('\$ 30',style: TextStyle(color: Colors.white)),
        Icon(Icons.star,color: Colors.white70,)
      ],
    ),

    title: Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text(

          item.username,

          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),

        ),

        const SizedBox(height: 4),

        Text(item.message,style: TextStyle(color: Colors.white70),)

      ],

    ),


    onTap: () {
    },

  ),
);



class Utils {
  static void showSnackBar(BuildContext context, String message) =>
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message)),
        );
}