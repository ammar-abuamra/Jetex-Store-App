import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/config/Constant.dart';

class cad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .75,
      width: MediaQuery.of(context).size.width * .75,
      decoration: BoxDecoration(
        color: SecondryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Center(
                child: Text(
              getLang(context, "EditDilog"),
              style: TextStyle(
                  color: SecondryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
            decoration: BoxDecoration( borderRadius: BorderRadius.circular(5), color: PrimaryColor,),
            padding: EdgeInsets.all(5),
            width: double.infinity,
          ),
          buildListTile(
              Icons.edit,
              getLang(
                context,
                "StoreNameEdit",
              )),
          buildListTile(Icons.star, getLang(context, "StarsRateEdit")),
          buildListTile(Icons.phone, getLang(context, "PhoneNumberEdit")),
          buildListTile(
              Icons.location_on, getLang(context, "StoreLocationEdit")),
        ],
      ),
    );
  }

  ListTile buildListTile(IconData icon, String fname) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color(0xffedb54f),
      ),
      title: Text(
        fname,
        style: TextStyle(color: PrimaryColor),
      ),
    );
  }
}
