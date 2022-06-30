import 'package:flutter/material.dart';

import 'package:formulariosbloc/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
   ProductoPage({Key? key}) : super(key: key);

  @override
  State<ProductoPage> createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.deepPurple),
        labelText: 'Producto', 
      ),
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
      keyboardType: TextInputType.numberWithOptions( decimal: true ),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.deepPurple),
        labelText: 'Precio', 
      ),
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

 void _submit(){

    if(!formKey.currentState!.validate()) return;

    print('Todo OK!');


 }
}
