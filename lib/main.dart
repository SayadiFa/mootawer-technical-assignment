import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mootawer_technical_test/app_theme.dart';
import 'package:mootawer_technical_test/screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: AppTheme.iconThemeColor),
        //Appbar color
        primaryColor: AppTheme.appPrimaryColor,
        primaryIconTheme: IconThemeData(color: AppTheme.appIconsPrimaryColor),
        //Main Title color
        primaryTextTheme: TextTheme(
          //headline1 used for title of article title in single article screen
          headline1: TextStyle(
              color: AppTheme.headline1And5Color,
              fontSize: 20,
              height: 1.2,
              fontWeight: FontWeight.bold),
          //headline3 used for caption of article in article card
          headline3: TextStyle(
              color: AppTheme.headline3And6Color, fontSize: 14, height: 1.2),
          //headline4 used for secondary data and minor data (writer name and dates)
          headline4: TextStyle(
              color: AppTheme.headline4Color, fontSize: 18, height: 1.4),
          //headline5 used for title of article title in cards
          headline5: TextStyle(
              color: AppTheme.headline1And5Color, fontSize: 20, height: 1.2),
          //headline6 used in drawer title
          headline6: TextStyle(color: AppTheme.headline3And6Color),
        ),
      ),
      home: HomePage(),
      routes: {
        '/home-page': (context) => HomePage(),
      },
    );
  }
}
