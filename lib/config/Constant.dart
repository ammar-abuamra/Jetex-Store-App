import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';

const PrimaryColor = Color(0xffedb54f);
const SecondryColor = Color(0xff222222);
const TitlesTextStyle = TextStyle(color:SecondryColor, fontSize: 18, fontWeight: FontWeight.bold);//for the 4 b// oxeis in the main page
const CategoryTextStyle=TextStyle(color: SecondryColor,fontWeight: FontWeight.bold );
const IteamTextSytle=TextStyle(color: SecondryColor,fontWeight: FontWeight.bold );

Container loginlogocontainer(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
    height: MediaQuery.of(context).size.height * .3,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        color: PrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        image: DecorationImage(
            image: AssetImage('assets/image/jetta-01.png'))),
  );
}
Container logintextwelcomecontainer(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          getLang(context, "LoginWelcome"),
          style: TextStyle(
              fontSize: 35,
              color: SecondryColor,
              fontWeight: FontWeight.bold),
        ),
        Text( getLang(context, "LogText"),
            style: TextStyle(
                fontSize: 20,
                color: SecondryColor,
                fontWeight: FontWeight.bold))
      ],
    ),
  );
}
Container loginstoreconterinr(BuildContext context, TextEditingController controller, GlobalKey key , TextInputType tybe , IconData icon , String label) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(.1),
      borderRadius: BorderRadius.circular(12),
    ),

    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    height: MediaQuery.of(context).size.height * .07,
    width: MediaQuery.of(context).size.width * .85,
    child: TextFormField(
      controller: controller,
      key: key,
      textAlign: TextAlign.center,
      keyboardType: tybe,
      decoration: InputDecoration(

        icon:IconButton(onPressed: (){}, icon: Icon(  icon, color: SecondryColor,),) ,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.white.withOpacity(.12)),
            borderRadius: BorderRadius.circular(3)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.white.withOpacity(.12)),
            borderRadius: BorderRadius.circular(3)),
        contentPadding:
        EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        labelText:label,
        labelStyle: TextStyle(
          color: SecondryColor,
          letterSpacing: 0,
        ),
      ),
    ),
  );
}
Container loginsavebutton(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5),
    height: MediaQuery.of(context).size.height * .05,
    width: MediaQuery.of(context).size.width * .4,
    decoration: BoxDecoration(
        color: SecondryColor,
        borderRadius: BorderRadius.all(Radius.circular(3))),
    child: Center(
        child: Text(
          getLang(context, "LogBotton"),
          style: TextStyle(
              color: PrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 15),
        )),
  );
}


