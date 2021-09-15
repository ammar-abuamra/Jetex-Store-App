import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/config/Constant.dart';

class AddProdcutdilog extends StatelessWidget {

  File image;

  final picker = ImagePicker();

  Future getImage(ImageSource src)async{
    final pickedFile = await picker.pickImage(source: src);
    //  setState(() {
    if (pickedFile !=null){
      image = File(pickedFile.path);
      print(pickedFile.path);
    }else{
      print('non');
    }
    // });
  }
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
          CircleAvatar(child: Text(getLang(context, "EditDilog"),style: TextStyle(color: Colors.white),),backgroundColor: SecondryColor,radius: 40,
          ),
          buildListTile(context, Icons.image,getLang(context, "FromGallery"), ImageSource.gallery),
          buildListTile(context, Icons.camera,getLang(context, "FromCamera"),ImageSource.camera),
        ],
      ),
    );
  }

  Widget buildListTile(BuildContext context,IconData icon , String fname ,ImageSource src ) {
    return ListTile(
      onTap: (){
        //  setState(() {
        getImage(src);
        // });
        Navigator.of(context).pop();
      },
      leading:Icon(icon,color: Color(0xffedb54f),) ,
      title: Text(fname),

    );
  }
}
