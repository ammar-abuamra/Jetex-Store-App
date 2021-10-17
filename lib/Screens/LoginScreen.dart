import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/Widget/NavBar.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/config/log_in.dart';
import 'package:jettaexstores/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController StoreEmail = new TextEditingController();
  TextEditingController StorePassword = new TextEditingController();

  GlobalKey<FormState> EmailState = new GlobalKey<FormState>();
  GlobalKey<FormState> PasswordState = new GlobalKey<FormState>();
  var lang = sharedPreferences.getString("lang");
  // String valed(String value) {
  //   if (value.isEmpty) {
  //     return "Cant leave feiled empty";
  //   }
  // }
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
               margin: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: SecondryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                    ),
                    image: DecorationImage(
                        image: AssetImage('assets/image/jetta-04.png'))),
              ),
              Container(
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
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width * 1,
                child: TextFormField(
                  // validator: valed,

                  controller: StoreEmail,
                  key: EmailState,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon:IconButton(onPressed: (){}, icon: Icon(  Icons.email, color: SecondryColor,),) ,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: SecondryColor),
                        borderRadius: BorderRadius.circular(3)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: SecondryColor),
                        borderRadius: BorderRadius.circular(3)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                    labelText: getLang(context, "LogStoreName"),
                    labelStyle: TextStyle(
                      color: SecondryColor,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width * 1,
                child: TextFormField(
                  // validator: valed,
                      obscureText: _passwordVisible,
                  controller: StorePassword,
                  key: PasswordState,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    icon:IconButton(onPressed: (){
                      setState(() {
                        _passwordVisible = ! _passwordVisible ;
                      });
                    }, icon: Icon(  _passwordVisible ? Icons.visibility_sharp  : Icons.visibility_off, color: SecondryColor,),) ,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: SecondryColor),
                        borderRadius: BorderRadius.circular(3)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: SecondryColor),
                        borderRadius: BorderRadius.circular(3)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                    labelText: getLang(context, "LogStorePass"),
                    labelStyle: TextStyle(
                      color: SecondryColor,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () async{

                         final SharedPreferences logprefs = await SharedPreferences.getInstance();
                 logprefs.setString('e', StoreEmail.text);  logprefs.setString('p', StorePassword.text);
                  loginp(
                      email:logprefs.getString('e'), password: logprefs.getString('p')).login(context).then((value) {
                    setState(() {
                      print(value);
                    });
                  });
                },
                child: Container(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

