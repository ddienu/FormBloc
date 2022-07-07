import 'dart:io';

import 'package:flutter/material.dart';

import 'package:formulariosbloc/src/models/producto_model.dart';
import 'package:formulariosbloc/src/providers/productos_provider.dart';
import 'package:formulariosbloc/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {
   ProductoPage({Key? key}) : super(key: key);

  @override
  State<ProductoPage> createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {

  ProductoModel producto = ProductoModel();

  bool _guardando = false;

  XFile? foto;

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
            onPressed: _seleccionarFoto, 
            icon: Icon(Icons.photo_library_outlined),
            ),
            IconButton(
            onPressed: _tomarFoto, 
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
                _mostrarFoto(),
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
    onPressed: (_guardando) ? null : _submit, 
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

 void _submit() async {

    if(!formKey.currentState!.validate()) return;

    formKey.currentState?.save();

    setState(() {
    _guardando = true;
    });


    if ( foto != null){
      producto.fotoUrl = await productoProvider.subirImagen( foto as File );
    }

    if( producto.id == null){
    productoProvider.crearProducto( producto );
    }else{
    productoProvider.editarProducto( producto ); 
    }
    mostrarSnackBar( 'El registro ha sido guardado');

    Navigator.pop(context);
 }

 void mostrarSnackBar( String mensaje ) {

    final snackBar = SnackBar(
      content: Text( mensaje, textAlign: TextAlign.center, style: TextStyle( fontWeight: FontWeight.bold),),
      duration: Duration( seconds: 2),
      backgroundColor: Theme.of(context).primaryColor,
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      
  }

   Widget _mostrarFoto(){

    if ( producto.fotoUrl == null){
      return Container();
      }else{
      return Image(
        image: AssetImage(foto?.path ?? 'assets/no-image.png'),
        height: 300,
        fit: BoxFit.cover,
        );
    }
  }

  _procesarImagen( ImageSource origen) async {

    foto = (await ImagePicker().pickImage(
      source: origen,
       ));

    if ( foto != null){
      //Limpiar
    }

    setState(() { });

  }
 
  _seleccionarFoto() async {


    _procesarImagen(ImageSource.gallery);
 }

  _tomarFoto() async {

    _procesarImagen(ImageSource.camera);

  }
 
}
