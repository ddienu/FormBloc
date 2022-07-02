import 'package:flutter/material.dart';
import 'package:formulariosbloc/src/bloc/provider.dart';
import 'package:formulariosbloc/src/models/producto_model.dart';

import 'package:formulariosbloc/src/providers/productos_provider.dart';


class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  final productosProvider = ProductosProvider();

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Form'),
        centerTitle: true,
      ),
      body: _crearListado(),
      floatingActionButton: _crearBoton(context),
    );
  }
  
  Widget _crearBoton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.deepPurple,
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'producto'),
      );
  }
  
  Widget _crearListado() {

    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData){

          return Container();

        }else{

          return Center( child: CircularProgressIndicator());
        }
      },
    );
  }
}