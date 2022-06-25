import 'dart:async';



class LoginBloc {

  final _emailController    = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();


  //Get to recover the Stream data

  get emailStream    => _emailController.stream;
  get passwordStream => _passwordController.stream;


  //Get to input the data to the Stream

  get changeEmail    =>  _emailController.sink.add;
  get changePassword => _passwordController.sink.add;


  dispose(){
    _emailController.close();
    _passwordController.close();
  }
}