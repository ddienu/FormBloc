import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:formulariosbloc/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:formulariosbloc/src/utils/utils.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';

import 'package:formulariosbloc/src/models/producto_model.dart';

import 'package:http/http.dart' as http;

  final _prefs = PreferenciasUsuario();

class ProductosProvider {

  final String _url = 'flutter-59693-default-rtdb.firebaseio.com';


  final Map<String, String> _queryParameters = {"auth" : _prefs.token};

  Future<bool>crearProducto( ProductoModel producto) async {

    final url = Uri.https( _url, '/productos.json', _queryParameters);

    final resp = await http.post(url, body: productoModelToJson( producto ));

    final decodedData = json.decode( resp.body );

    print( decodedData);

    return true;

    
  }
  Future<bool>editarProducto( ProductoModel producto) async {

    final url = Uri.https( _url, '/productos/${producto.id}.json', _queryParameters);

    final resp = await http.put(url, body: productoModelToJson( producto ));

    final decodedData = json.decode( resp.body );

    print( decodedData);

    return true;

  }

  Future<List<ProductoModel>> cargarProductos(BuildContext context) async{

    final url = Uri.https( _url, '/productos.json', _queryParameters);

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode( resp.body);

    final List<ProductoModel> productos = [];

    //if ( decodedData == null) return [];

    if ( decodedData ['error'] != null){

      print( decodedData ["error"]);

      mostrarAlerta(context, decodedData["error"]);
    }
      

    decodedData.forEach((id, prod) {

        final prodTemp = ProductoModel.fromJson( prod );

        prodTemp.id = id;

        productos.add( prodTemp );

     });

     return productos;

  }

  Future<int> borrarProducto( String id) async {

    final url = Uri.https(_url, '/productos/$id.json', _queryParameters);

    final resp = await http.delete(url);

    print(resp.body);

    return 1;
  }

  Future<String> subirImagen(XFile imagen) async {

    final url = Uri.parse('https://api.cloudinary.com/v1_1/dztkh7sdx/image/upload?upload_preset=zlntpygk');

    final mimeType = mime(imagen.path)!.split('/');

    final imageUploadRequest = http.MultipartRequest(

      'POST',
      url,

    );

    final file = await http.MultipartFile.fromPath(

      'file', 
      imagen.path,
      contentType: MediaType(
        mimeType[0],
        mimeType[1],
      ) 
      );

      imageUploadRequest.files.add(file);

      final streamResponse = await imageUploadRequest.send();

      final resp = await http.Response.fromStream(streamResponse);

      if ( resp.statusCode != 200 && resp.statusCode != 201){

        print('Algo salio mal');
        print( resp.body);
      }

      final respData = json.decode( resp.body );
      print( respData );

      return respData['secure_url'];
   }

  
}