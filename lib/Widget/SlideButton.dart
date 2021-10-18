import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/config/Constant.dart';

class SlidableWidget<T> extends StatefulWidget {
  final Widget child;

  const SlidableWidget({
    @required this.child,
    Key key,
  }) : super(key: key);

  @override
  _SlidableWidgetState<T> createState() => _SlidableWidgetState<T>();
}

class _SlidableWidgetState<T> extends State<SlidableWidget<T>> {
  @override
  Widget build(BuildContext context) {

  }

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


Widget ProductEdit (BuildContext context){
  return  Scaffold(

    backgroundColor: Colors.white.withOpacity(.1),
    body: Center(
      child: Container(
        height: MediaQuery.of(context).size.height * .8,
        width: MediaQuery.of(context).size.width * .9,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            cListTile(Icons.edit,  "Edit Prodct Title",),
            cListTile(Icons.dashboard,"Edit Prodct Category"),
           cListTile(Icons.dashboard_outlined, "Edit Prodcut Sub Category"),
           cListTile(Icons.monetization_on_outlined,"Edit Prodct Price"),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: MediaQuery.of(context).size.height*.05,
                    width:MediaQuery.of(context).size.width *.3,
                    decoration: BoxDecoration(
                        color: SecondryColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Center(child: Text('Cancel',style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,fontSize: 15),)),

                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    height: MediaQuery.of(context).size.height*.05,
                    width:MediaQuery.of(context).size.width *.3,
                    decoration: BoxDecoration(
                        color: SecondryColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Center(child: Text('Save',style: TextStyle(color: PrimaryColor,fontWeight: FontWeight.bold,fontSize: 15),)),

                  ),
                ),
              ],
            )


          ],
        ),
      ),
    ),
  );
}




ListTile cListTile(IconData icon , String fname) {
  return ListTile(
    leading:Icon(icon,color: Color(0xffedb54f),) ,
    title: Text(fname),

  );
}
