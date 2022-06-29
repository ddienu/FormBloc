import 'package:flutter/material.dart';

class ProductoPage extends StatelessWidget {
  const ProductoPage({Key? key}) : super(key: key);

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
    );
  }
  
  Widget _crearPrecio() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions( decimal: true ),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.deepPurple),
        labelText: 'Precio', 
      ),
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
    onPressed: (){}, 
    icon: Icon(Icons.save), 
    label: Text('Guardar'),
    );
 }
}
