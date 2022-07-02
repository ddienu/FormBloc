import 'dart:convert';

import 'package:formulariosbloc/src/models/producto_model.dart';

import 'package:http/http.dart' as http;


class ProductosProvider {

  final String _url = 'flutter-59693-default-rtdb.firebaseio.com';

  Future<bool>crearProducto( ProductoModel producto) async {

    final url = Uri.https( _url, '/productos.json');

    print(url);

    final resp = await http.post(url, body: productoModelToJson( producto ));

    final decodedData = json.decode( resp.body );


    print( decodedData);

    return true;

    
  }

}