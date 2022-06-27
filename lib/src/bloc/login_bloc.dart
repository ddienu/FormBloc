import 'dart:async';

import 'package:formulariosbloc/src/bloc/validators.dart';



class LoginBloc extends Validators {

  final _emailController    = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();


  //Get to recover the Stream data

  get emailStream    => _emailController.stream.transform(validarEmail);
  get passwordStream => _passwordController.stream.transform( validarPassword );


  //Get to input the data to the Stream

  get changeEmail    =>  _emailController.sink.add;
  get changePassword => _passwordController.sink.add;


  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}