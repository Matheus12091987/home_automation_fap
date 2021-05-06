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

    AdicionarDevice('Entrada', 'local de entrada de pessoas', 1,
        'http://192.168.1.1', 'http://automation.ddns.net:9001', '/status');
    AdicionarDevice('Cozinha', 'local de cozinhar comida', 1,
        'http://192.168.1.2', 'http://automation.ddns.net:9002', '/status');

    AdicionarUsuario('admin', '179325', 1, true, true, true);
    AdicionarAmbiente(geralUsuarios[geralUsuarios.length - 1].id,
        'Entrada/Copa/Sala', 'Ambiente destinado a Convivencia Humana');
    AdicionarAcoes(1, 1, 1, 'Entrada', 'Luz da entrada', 'Entrada', 1);
    AdicionarAcoes(1, 1, 2, 'Cozinha', 'Luz da cozinha', 'Cozinha', 2);

    AdicionarUsuario('mperes', '1234', 1, true, true, true);
    AdicionarAmbiente(geralUsuarios[geralUsuarios.length - 1].id,
        'Entrada/Copa/Sala', 'Ambiente destinado a Convivencia Humana');

    

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
