import 'package:flutter/material.dart';
import 'package:formulariosbloc/src/bloc/provider.dart';
import 'package:formulariosbloc/src/pages/home_page.dart';

import 'package:formulariosbloc/src/pages/login_page.dart';
import 'package:formulariosbloc/src/pages/producto_page.dart';
import 'package:formulariosbloc/src/pages/registro_page.dart';
import 'package:formulariosbloc/src/preferencias_usuario/preferencias_usuario.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

    final prefs = PreferenciasUsuario();
    await prefs.initPrefs();

  runApp(MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

   return Provider(
      child: MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login'    : (BuildContext context) => LoginPage(),
        'registro' : (BuildContext context) => RegistroPage(), 
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
