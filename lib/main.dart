import 'package:flutter/material.dart';
import 'package:formulariosbloc/src/pages/home_page.dart';

import 'package:formulariosbloc/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'login' : (BuildContext context) => LoginPage(),
        'home'  : (BuildContext context) => HomePage(),
      },
    );
  }
}
