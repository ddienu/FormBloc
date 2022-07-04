import 'package:flutter/material.dart';
import 'package:formulariosbloc/src/models/producto_model.dart';
import 'package:formulariosbloc/src/providers/productos_provider.dart';

import 'package:formulariosbloc/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
   ProductoPage({Key? key}) : super(key: key);

  @override
  State<ProductoPage> createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {

  ProductoModel producto = ProductoModel();

  final formKey = GlobalKey<FormState>();

  final productoProvider = ProductosProvider();

  @override
  Widget build(BuildContext context) {

    final ProductoModel prodData = ModalRoute.of(context)!.settings.arguments as ProductoModel;

    if ( prodData != null){
      producto = prodData;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.photo_library_outlined),
            ),
            IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.camera_alt),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _crearNombreProducto(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(),
              ],
            )
            ),
        ),
      ),
    );
  }

  Widget _crearNombreProducto() {
    return TextFormField(
      initialValue: producto.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.deepPurple),
        labelText: 'Producto', 
      ),
      onSaved: (value) => producto.title = value!,     
      validator: ( value ){
        if( value!.length < 3){
          return 'Ingrese el nombre del producto';
        }else{
          return null;
        }
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions( decimal: true ),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.deepPurple),
        labelText: 'Precio', 
      ),
      onSaved: (value) => producto.valor = double.parse( value! ),     
      validator: ( value ){
          if( utils.isNumeric( value! )){
            return null;
          }else{
            return 'Ingrese un precio válido';
          }
      },
    );
  }

 Widget  _crearBoton() {
  return ElevatedButton.icon(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      )),
      elevation: MaterialStateProperty.all(0.0),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
    ),
    onPressed: _submit, 
    icon: Icon(Icons.save), 
    label: Text('Guardar'),
    );
 }

 Widget  _crearDisponible() {

  return SwitchListTile(
    activeColor: Colors.deepPurple,
    value: producto.disponible,
    title: Text('Disponible'), 
    onChanged: (value) => setState(() {
      producto.disponible = value;
    }),
    );
 }

 void _submit(){

    if(!formKey.currentState!.validate()) return;

    formKey.currentState?.save();

    print('Todo OK!');

    print(producto.title);
    
    print(producto.valor);

    print(producto.disponible);

    if( producto.id == null){
    productoProvider.crearProducto( producto );
    }else{
    productoProvider.editarProducto( producto ); 
    }


    

 }
 
}
