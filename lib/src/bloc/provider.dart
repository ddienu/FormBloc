import 'package:flutter/material.dart';


import 'package:formulariosbloc/src/bloc/login_bloc.dart';
export 'package:formulariosbloc/src/bloc/login_bloc.dart';

import 'package:formulariosbloc/src/bloc/productos_bloc.dart';
export 'package:formulariosbloc/src/bloc/productos_bloc.dart';



class Provider extends InheritedWidget {

  final loginBloc = LoginBloc();

  final _productosBloc = ProductosBloc();

  static Provider? _instancia;

  factory Provider ({Key? key, required Widget child}){
    _instancia ??= Provider._internal(key: key, child: child);
    return _instancia!;
  }

  Provider._internal({Key? key, required super.child}) : super(key: key);

  

  //Provider({Key? key, required super.child}) : super(key: key);

  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc? of (BuildContext context ) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()?.loginBloc;
  }

  static ProductosBloc?  productosBloc (BuildContext context ) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()?._productosBloc;
  }


  }

