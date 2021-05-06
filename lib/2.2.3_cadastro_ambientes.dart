//
// Tela dos Ambientes Cadastrados
//

import 'package:flutter/material.dart';

import '0.0_banco_de_dados.dart';
import '2.0_ambientes.dart';
import '2.2_config.dart';
import '2.2.3.1_popup_inclusao_ambientes.dart';
import '2.2.3.2_popup_edicao_ambientes.dart';

class AmbientesCadastrados extends StatefulWidget {
  @override
  _AmbientesCadastradosState createState() => _AmbientesCadastradosState();
}

class _AmbientesCadastradosState extends State<AmbientesCadastrados> {
  int _currentIndex = 0;

  @override
  // ignore: must_call_super
  void initState() {
    LimparAmbientes();
    CarregarAmbiente(idUsuario[posUsuarioAtual[0]]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ambientes Cadastrados'),
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
                return ListTile(
                  title: Row(
                    children: [
                      Expanded(
                          child: Text(
                        ambientesName[index],
                        style: TextStyle(fontSize: 18),
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        softWrap: true,
                      )),
                    ],
                  ),
                  subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Descrição: ' + ambientesComentario[index],
                            overflow: TextOverflow.fade,
                            maxLines: 5,
                            softWrap: true,
                          )),
                        ],
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          setState(() {
                            edicaoDoAmbiente(context, index);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Editar este Ambiente.'),
                              duration: Duration(seconds: 2),
                            ));
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            ambientesName.removeAt(index);
                            ambientesComentario.removeAt(index);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Tarefa removida com sucesso.'),
                              duration: Duration(seconds: 2),
                            ));
                          });
                        },
                      ),
                    ],
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
              itemCount: ambientesName.length,
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
