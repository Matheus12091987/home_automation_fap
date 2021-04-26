//
// Tela do Sobre!!!
//

import 'package:flutter/material.dart';

import '1.0_login.dart';

class Sobre extends StatefulWidget {
  @override
  _SobreState createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre!!!'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Text(
              "Aplicação de funcionalidade local ou remoto de uma home automation"),
          Text(""),
          Text('''Esta aplicação foi desenvolvida a partir de um sistema de automação onde os comandos são request http padronizadas e tem respostas http partindo de endereços fixos.        '''),
          Text(""),
          SizedBox(height: 20),
          Image.asset('images/developer.jpg', height: 267, width: 200), //1,3353 escala da imagem
          SizedBox(height: 10),
          Text("Develop by: Matheus Gonçalves Peres - 2840481723024"),
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
            icon: Icon(Icons.login_rounded),
            label: 'Tela de Login',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (_currentIndex >= 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
    } else if (_currentIndex == 1) {
     //
    } else if (_currentIndex == 2) {
      //
    }
  }
}
