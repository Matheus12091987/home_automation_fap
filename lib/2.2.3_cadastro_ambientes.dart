//
// Tela dos Ambientes Cadastrados
//

import 'package:flutter/material.dart';

import '2.0_ambientes.dart';
import '2.2_config.dart';
import '2.2.3.1_popup_inclusao_ambientes.dart';

class AmbientesCadastrados extends StatefulWidget {
  @override
  _AmbientesCadastradosState createState() => _AmbientesCadastradosState();
}

class _AmbientesCadastradosState extends State<AmbientesCadastrados> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ambientes Cadastrados'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Row(children: [
          //inserir as coisas aqui
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chevron_left_rounded),
            label: 'Retornar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Novo Ambiente',
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (_currentIndex == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Configuracao()));
    } else if (_currentIndex == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Ambientes()));
    } else if (_currentIndex == 2) {
      inserirNovoAmbiente(context);
    }
  }
}
