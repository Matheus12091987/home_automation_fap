//
// Tela dos Ambientes
//

import 'package:flutter/material.dart';

import '0.0_banco_de_dados.dart';
import '1.0_login.dart';
import '2.2_config.dart';

class Ambientes extends StatefulWidget {
  @override
  _AmbientesState createState() => _AmbientesState();
}

class _AmbientesState extends State<Ambientes> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ambiente Principal'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Scrollbar(
            child: Row(children: [
          Expanded(
            child: ListView.separated(
              //Aparência do item da lista
              itemBuilder: (context, index) {
                return ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 200, height: 60),
                  child: ElevatedButton(
                    child: Text(ambientes[index]),
                    onPressed: () {
                      
                    },
                  ),
                );
              },
              //Aparência do divisor
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.blue[100],
                  thickness: 1,
                );
              },
              //total de itens da lista
              itemCount: ambientes.length,
            ),
          ),
          //inserir as coisas aqui
        ])),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chevron_left_rounded),
            label: 'Sair',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
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
          context, MaterialPageRoute(builder: (context) => Login()));
    } else if (_currentIndex == 1) {
      //
    } else if (_currentIndex == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Configuracao()));
    }
  }
}
