import 'dart:async';

class Validators {

  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink){

      String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = RegExp(pattern);

      if (regExp.hasMatch(email)){
        sink.add(email);
      }else{
        sink.addError('El correo no es válido');
      }


    }
  );

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink){

        if (password.length >= 8  ){
          sink.add( password );
        }else{
          sink.addError('La contraseña no es válida');
        }
    }
      );
}