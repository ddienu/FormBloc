import 'package:flutter/material.dart';


import 'package:formulariosbloc/src/bloc/login_bloc.dart';
export 'package:formulariosbloc/src/bloc/login_bloc.dart';


class Provider extends InheritedWidget {

  final loginBloc = LoginBloc();

  Provider({Key? key, required super.child}) : super(key: key);
  
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc? of (BuildContext context ) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()?.loginBloc;
  }
  }

