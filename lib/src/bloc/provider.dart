import 'package:flutter/material.dart';


import 'package:formulariosbloc/src/bloc/login_bloc.dart';
export 'package:formulariosbloc/src/bloc/login_bloc.dart';


class Provider extends InheritedWidget {

  static Provider? _instancia;

  factory Provider ({Key? key, required Widget child}){
    if (_instancia == null){
      _instancia = Provider._internal(key: key, child: child);
    }
    return _instancia!;
  }

  Provider._internal({Key? key, required super.child}) : super(key: key);

  final loginBloc = LoginBloc();

  //Provider({Key? key, required super.child}) : super(key: key);

  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc? of (BuildContext context ) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()?.loginBloc;
  }
  }

