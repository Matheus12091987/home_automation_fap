//
// Tela dos Ambientes
//

import 'package:flutter/material.dart';

import '0.0_banco_de_dados.dart';
import '2.0_ambientes.dart';
import '2.3.1_config_botoes_acao.dart';

class AmbientesAcao extends StatefulWidget {
  final int index;

  AmbientesAcao({Key key, @required this.index}) : super(key: key);
  @override
  _AmbientesAcaoState createState() => _AmbientesAcaoState(indexPassado: index);
}

class _AmbientesAcaoState extends State<AmbientesAcao> {
  final int indexPassado;

  _AmbientesAcaoState({@required this.indexPassado});

  int _currentIndex = 0;

  @override
  // ignore: must_call_super
  void initState() {
    LimparAcoes();
    CarregaAcoes(idUsuario[posUsuarioAtual[0]], idAmbiente[indexPassado]);
    print(indexPassado);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ambientesName[indexPassado], style: TextStyle(fontSize: 18)),
            Text(ambientesComentario[indexPassado],
                style: TextStyle(fontSize: 10)),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Scrollbar(
            child: Row(children: [
          Expanded(
            child: ListView.separated(
              //Aparência do item da lista
              itemBuilder: (BuildContext context, int index) {
                return ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 200, height: 60),
                  child: ElevatedButton(
                    child: Text(botaoName[index]),
                    onPressed: () {
                      ///////
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
              itemCount: botaoName.length,
            ),
          ),
        ])),
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
            icon: Icon(Icons.settings),
            label: 'Action Settings',
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
          context, MaterialPageRoute(builder: (context) => Ambientes()));
    } else if (_currentIndex == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Ambientes()));
    } else if (_currentIndex == 2) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => ConfigBotaoAcao(
                  ambienteTexto: ambientesName[indexPassado],
                  ambientePassado: indexPassado)));
    }
  }
}
