import 'package:flutter/material.dart';
import 'package:formulariosbloc/src/bloc/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('El email es: ${bloc!.email}'),
          Divider(),
          Text('La contraseña es: ${bloc.password}'),
        ],
      )
    );
  }
}