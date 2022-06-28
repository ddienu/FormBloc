import 'dart:async';

import 'package:formulariosbloc/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';



class LoginBloc extends Validators {

  final _emailController    = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();


  //Get to recover the Stream data

  Stream<String>get emailStream    => _emailController.stream.transform(validarEmail);
  Stream<String>get passwordStream => _passwordController.stream.transform( validarPassword );

  Stream<bool>get formValidStream =>
              Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);

                



  //Get to input the data to the Stream

  get changeEmail    =>  _emailController.sink.add;
  get changePassword => _passwordController.sink.add;


  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}