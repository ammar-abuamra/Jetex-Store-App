import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';

class AddProdcutdilog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.75,width:MediaQuery.of(context).size.width*.75,
      decoration: BoxDecoration(
          color: Colors.white,borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(child: Text(getLang(context, "EditDilog"),style: TextStyle(color: Colors.white),),backgroundColor: Colors.black,radius: 40,
          ),
          buildListTile(Icons.edit, getLang(context, "StoreNameEdit")),
        ],
      ),
    );
  }

  ListTile buildListTile(IconData icon , String fname) {
    return ListTile(
      leading:Icon(icon) ,
      title: Text(fname),

    );
  }
}
