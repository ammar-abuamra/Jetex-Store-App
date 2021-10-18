import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jettaexstores/BottomBarScreen/NotifictionScreen.dart';
import 'package:jettaexstores/Provider/Localapp.dart';
import 'package:jettaexstores/Screens/AddProdcutScreen.dart';
import 'package:jettaexstores/Screens/EditProductDetials.dart';
import 'package:jettaexstores/Screens/LoginScreen.dart';
import 'package:jettaexstores/Screens/ProdcutDitalScreen.dart';
import 'package:jettaexstores/Screens/SplashScreen.dart';
import 'package:jettaexstores/Screens/SubCategory.dart';
import 'package:jettaexstores/Widget/NavBar.dart';
import 'package:jettaexstores/config/Api_Test.dart';
import 'package:jettaexstores/config/Constant.dart';
import 'package:jettaexstores/homepage.dart';
import 'package:flutter/widgets.dart';
import 'BottomBarScreen/SettingScreen.dart';
import 'Screens/InfoScreen.dart';
import 'Screens/OrderScreen.dart';
import 'Screens/CategoryScreen.dart';
import 'Screens/RevewisScreen.dart';
import 'Provider/Localapp.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();

 var email = sharedPreferences.getString('e');
 var pass = sharedPreferences.getString('p');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocal(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  setLocal(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  var lang = sharedPreferences.getString("lang");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en", ""),
        Locale("ar", ""),
      ],
      localeResolutionCallback: (currentLang, supportLang) {
        if (currentLang != null) {
          for (Locale local in supportLang) {
            if (local.languageCode == currentLang.languageCode) {
              sharedPreferences.setString("lang", currentLang.languageCode);
              return currentLang;
            }
          }
        }
        return supportLang.first;
      },
      locale: _locale,
      theme: ThemeData(

          focusColor: SecondryColor,
          primaryColor: Color(0xffedb54f),
          canvasColor: PrimaryColor,
          buttonColor: Color(0xffedb54f),
          iconTheme: IconThemeData(color: Color(0xffedb54f))),
      debugShowCheckedModeBanner: false,
      initialRoute: 'Home',
      routes: {
        'EditProduct':(context)=> EditProduct(),
        'Api_test':(context)=> Api_test(),
        'LoginScreen': (context) => LoginScreen(),
        'Home': (context) => Home(),
        'SettingScreen': (context) => SettingScreen(),
        'NoteficationScreen': (context) => NoteficationScreen(),
        'SpalshScreen': (context) => SpalshScreen(),
        'HomePage': (context) => HomePage(),
        'InfoScreen': (context) => InfoScreen(),
        'OrderScreen': (context) => OrderScreen(),
        'ProdcutScreen': (context) => ProdcutScreen(),
        'RevewiesScreen': (context) => RevewiesScreen(),
        'AddProdcut': (context) => AddProdcut(),
        'SubCategory': (context) => SubCategory(),
        'ProscutDitalScreen': (context) => ProscutDitalScreen(),
      },
    );
  }
}


