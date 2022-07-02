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
        title: Text('Home'),
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

          final productos = snapshot.data;

          return ListView.builder(
            itemCount: productos!.length,
            itemBuilder: (context, i) => _crearItem(context, productos[i] ),
            );

        }else{

          return Center( child: CircularProgressIndicator());
        }
      },
    );
  }

    Widget _crearItem(BuildContext context, ProductoModel producto){

      return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.redAccent,
        ),
        onDismissed: ( direction ){
          //TODO: Borrar producto.
        },
        child: ListTile(
          title: Text(' ${producto.title } - ${ producto.valor} '),
          subtitle: Text(producto.id),
          onTap: () => Navigator.pushNamed(context, 'producto'), 
          
        ),
      );
    }
}