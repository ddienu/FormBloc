import 'package:flutter/material.dart';
import 'package:formulariosbloc/src/bloc/provider.dart';
import 'package:formulariosbloc/src/pages/producto_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Form'),
        centerTitle: true,
      ),
      body: Container(),
      floatingActionButton: _crearBoton(context),
    );
  }
  
  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      child: Icon(Icons.add),
      onPressed: () =>Navigator.pushNamed(context, 'producto'),
      );
  }
}