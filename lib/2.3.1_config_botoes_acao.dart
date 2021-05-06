//
// Tela de Configuração dos Botões
//

import 'package:flutter/material.dart';

import '0.0_banco_de_dados.dart';
import '2.0_ambientes.dart';
import '2.3_ambientes_acao.dart';
import '2.3.1.1_inclusao_botoes_acao.dart';
import '2.3.1.2_edicao_botoes_acao.dart';

class ConfigBotaoAcao extends StatefulWidget {
  final String ambienteTexto;
  final int ambientePassado;

  ConfigBotaoAcao(
      {Key key, @required this.ambienteTexto, @required this.ambientePassado})
      : super(key: key);
  @override
  _ConfigBotaoAcaoState createState() => _ConfigBotaoAcaoState(
      ambienteAtual: ambienteTexto, indexPassado: ambientePassado);
}

class _ConfigBotaoAcaoState extends State<ConfigBotaoAcao> {
  final String ambienteAtual;
  final int indexPassado;

  _ConfigBotaoAcaoState(
      {@required this.ambienteAtual, @required this.indexPassado});

  int _currentIndex = 0;
  var saidaAtivada = '';

  @override
  // ignore: must_call_super
  void initState() {
    LimparAcoes();
    CarregaAcoes(idUsuario[posUsuarioAtual[0]], idAmbiente[indexPassado]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Botões Cadastrados no Ambiente',
                style: TextStyle(fontSize: 18)),
            Text(ambienteAtual, style: TextStyle(fontSize: 10)),
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
              itemBuilder: (context, index) {
                if (botaoSaidaFisica[index] == 1) {
                  saidaAtivada = 'Output 01';
                } else if (botaoSaidaFisica[index] == 2) {
                  saidaAtivada = 'Output 02';
                } else {
                  saidaAtivada = 'Output 03';
                }
                return ListTile(
                  title: Row(
                    children: [
                      Expanded(
                          child: Text(
                        botaoName[index],
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
                            'Comentário: ' + botaoComentario[index],
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                            softWrap: true,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Device Controlado: ' + botaoNomePlaca[index],
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                            softWrap: true,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Saida Física: ' + saidaAtivada,
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
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EdicaoBotoes(
                                        passaIndexAmb: indexPassado,
                                        passaIdUsu:
                                            idUsuario[posUsuarioAtual[0]],
                                        passaIdBotao: idBotao[index],
                                        passaIndexBotao:index)));
                            //
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Editar este Botão.'),
                              duration: Duration(seconds: 2),
                            ));
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            /*devicesName.removeAt(index);
                            devicesAddrLocal.removeAt(index);
                            devicesAddrRemoto.removeAt(index);
                            devicesTipo.removeAt(index);
                            devicesFeedback.removeAt(index);*/
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Botão removido com sucesso.'),
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
            icon: Icon(Icons.add_box_rounded),
            label: 'Novo Botão de Ação',
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
          context,
          MaterialPageRoute(
              builder: (context) => AmbientesAcao(
                    index: indexPassado,
                  )));
    } else if (_currentIndex == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Ambientes()));
    } else if (_currentIndex == 2) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => InclusaoBotoes(
                  passaIndexAmb: indexPassado,
                  passaIdUsu: idUsuario[posUsuarioAtual[0]])));
    }
  }
}
