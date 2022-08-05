import 'package:flutter/material.dart';
import 'package:formulariosbloc/src/bloc/provider.dart';


import 'package:formulariosbloc/src/models/producto_model.dart';
import 'package:formulariosbloc/src/providers/productos_provider.dart';


class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

   final productosBloc = Provider.productosBloc(context);

   productosBloc!.cargarProductos( context );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Home'),
        centerTitle: true,
      ),
      body: _crearListado( productosBloc ),
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
  
  Widget _crearListado(ProductosBloc productosBloc) {


    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
         if (snapshot.hasData){

          final productos = snapshot.data;

          return ListView.builder(
            itemCount: productos!.length,
            itemBuilder: (context, i) => _crearItem(context, productosBloc, productos[i] ),
            );

        }else{

          return Center( child: CircularProgressIndicator());
        }
      },
    );
  }

    Widget _crearItem(BuildContext context, ProductosBloc productosBloc, ProductoModel producto){ 

      return Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.redAccent,
        ),
        onDismissed: ( direction ) => productosBloc.borrarProducto( producto.id ),
        child: Card(
          child: Column(
            children: [
              ( producto.fotoUrl.isEmpty )
              ? Image(image: AssetImage('assets/no-image.png'),
              fit: BoxFit.contain,
              width: 300.0,)
              : FadeInImage(
                placeholder: AssetImage('assets/jar-loading.gif'), 
                image: NetworkImage( producto.fotoUrl ),
                height: 300.0,
                width: double.maxFinite,
                fit: BoxFit.contain,
                ),
                ListTile(
                  title: Text(' ${producto.title } - ${ producto.valor} '),
                  subtitle: Text(producto.id),
                  onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto), 
          
        ),
            ],
          ),
        )
      );
    }
}
