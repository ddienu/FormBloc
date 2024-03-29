import 'package:flutter/cupertino.dart';
import 'package:formulariosbloc/src/providers/productos_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';

import 'package:formulariosbloc/src/models/producto_model.dart';


class ProductosBloc {

  final _productosController = BehaviorSubject<List<ProductoModel>>();
  final _cargandoController  = BehaviorSubject<bool>();


  final _productosProvider = ProductosProvider();

  Stream<List<ProductoModel>> get productosStream => _productosController.stream;
  Stream<bool> get cargando => _cargandoController.stream;

  void cargarProductos(BuildContext context) async {


    final productos = await _productosProvider.cargarProductos(context);
    _productosController.sink.add( productos ); 

  }

  void crearProducto(ProductoModel producto) async {

    _cargandoController.sink.add(true);
    await _productosProvider.crearProducto(producto);
    _cargandoController.sink.add(false);

  }

  Future<String> subirFoto(XFile foto) async {

    _cargandoController.sink.add(true);
    final fotoUrl = await _productosProvider.subirImagen( foto );
    _cargandoController.sink.add(false);

    return fotoUrl;

  }

  void editarProducto(ProductoModel producto) async {

    _cargandoController.sink.add(true);
    await _productosProvider.editarProducto(producto);
    _cargandoController.sink.add(false);

  }

    void borrarProducto(String id) async {

    await _productosProvider.borrarProducto( id );
    

  }

  dispose(){
    _productosController.close();
    _cargandoController.close();
  }

}