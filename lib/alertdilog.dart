import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';

class cad extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.75,width:MediaQuery.of(context).size.width*.75,
      decoration: BoxDecoration(
          color: Colors.white,borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(child: Text(getLang(context, "EditDilog"),style: TextStyle(color: Colors.white),),backgroundColor:Color(0xffedb54f),radius: 40,
          ),
          buildListTile(Icons.edit, getLang(context, "StoreNameEdit",)),
          buildListTile(Icons.star,getLang(context, "StarsRateEdit")),
          buildListTile(Icons.phone,getLang(context, "PhoneNumberEdit")),
          buildListTile(Icons.location_on,getLang(context, "StoreLocationEdit")),



        ],
      ),
    );
  }

  ListTile buildListTile(IconData icon , String fname) {
    return ListTile(
      leading:Icon(icon,color: Color(0xffedb54f),) ,
      title: Text(fname),

    );
  }
}
