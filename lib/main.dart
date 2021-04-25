import 'dart:async';
import 'package:flutter/material.dart';

import '0.0_banco_de_dados.dart';
import '1.0_login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Navigator',
    home: MenuPrincipal(),
  ));
}

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipal createState() => _MenuPrincipal();
}

class _MenuPrincipal extends State<MenuPrincipal> {
  @override
  void initState() {
    AdicionarUsuario('admin', '179325', 1, true, true, true);
    AdicionarUsuario('mperes', '1234', 1, true, true, true);
    AdicionarDevice('Entrada', 1, 'http://192.168.1.1',
        'http://automation.ddns.net:9001', '/status');
    AdicionarDevice('Cozinha', 1, 'http://192.168.1.2',
        'http://automation.ddns.net:9002', '/status');

    ambientes.add('Entrada/Copa/Sala');
    ambientes.add('Cozinha/Area de Serviço');

    posUsuarioAtual.add(0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
              child: Image.asset('images/logo.jpg', height: 230, width: 230)),
        ],
      )),
    );
  }
}
