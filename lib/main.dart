import 'package:flutter/material.dart';
import 'package:formulariosbloc/src/bloc/provider.dart';
import 'package:formulariosbloc/src/pages/home_page.dart';

import 'package:formulariosbloc/src/pages/login_page.dart';
import 'package:formulariosbloc/src/pages/producto_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
   
    return Provider(
      child: MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'login'    : (BuildContext context) => LoginPage(),
        'home'     : (BuildContext context) => HomePage(),
        'producto' : (BuildContext context) => ProductoPage(), 
      },
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide( color: Colors.deepPurple)
          )
        ),
        primaryColor: Colors.deepPurple,
        hintColor: Colors.black,     
      ),
    )
   );
 }
}
