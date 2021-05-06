//
// Tela de Edição de Botões de Ação
//

import 'package:flutter/material.dart';

import '0.0_banco_de_dados.dart';
import '2.0_ambientes.dart';
import '2.3.1_config_botoes_acao.dart';

class EdicaoBotoes extends StatefulWidget {
  final int passaIndexAmb;
  final int passaIdUsu;
  final int passaIdBotao;
  final int passaIndexBotao;

  EdicaoBotoes(
      {Key key,
      @required this.passaIndexAmb,
      @required this.passaIdUsu,
      @required this.passaIdBotao,
      @required this.passaIndexBotao})
      : super(key: key);
  @override
  _EdicaoBotoesState createState() => _EdicaoBotoesState(
      indexAmbPassado: passaIndexAmb,
      idUsuPassado: passaIdUsu,
      idBotaoPassado: passaIdBotao,
      indexBotaoPassado: passaIndexBotao);
}

class _EdicaoBotoesState extends State<EdicaoBotoes> {
  final int indexAmbPassado;
  final int idUsuPassado;
  final int idBotaoPassado;
  final int indexBotaoPassado;

  _EdicaoBotoesState(
      {@required this.indexAmbPassado,
      @required this.idUsuPassado,
      @required this.idBotaoPassado,
      @required this.indexBotaoPassado});

  int _currentIndex = 0;
  int valorRadio = 0;
  var valorDropDown = '';

  var _txtNomeBotao = TextEditingController();
  var _txtComentarioBotao = TextEditingController();

  var _radioValue;
  var _valueDropDown;

  @override
  // ignore: must_call_super
  void initState() {
    _txtNomeBotao.text = botaoName[indexBotaoPassado];
    _txtComentarioBotao.text = botaoComentario[indexBotaoPassado];
    valorRadio = botaoSaidaFisica[indexBotaoPassado];
    valorDropDown = botaoNomePlaca[indexBotaoPassado];
    _radioValue = botaoSaidaFisica[indexBotaoPassado] - 1;
    _valueDropDown = botaoNomePlaca[indexBotaoPassado];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Inclusão de Botões de Ação', style: TextStyle(fontSize: 18)),
            Text('Ambiente: ' + ambientesName[indexAmbPassado],
                style: TextStyle(fontSize: 10)),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Scrollbar(
            child: Column(children: [
              Padding(padding: EdgeInsets.all(5)),
              Text('Nome e Comentário do Botão',
                  style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              TextField(
                controller: _txtNomeBotao,
                decoration: InputDecoration(
                    labelText: 'Nome do Botão', border: OutlineInputBorder()),
              ),
              SizedBox(height: 5),
              TextField(
                controller: _txtComentarioBotao,
                decoration: InputDecoration(
                  labelText: 'Comentario',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Text('Selecione o Device Comandado',
                  style: TextStyle(fontSize: 18)),
              DropdownButton<String>(
                items: devicesName.map((var dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                onChanged: (var itemSelect) {
                  setState(() {
                    _valueDropDown = itemSelect;
                    valorDropDown = itemSelect;
                    //print(_valueDropDown);
                  });
                },
                hint: Text('Selecione aqui o Device'),
                value: _valueDropDown,
              ),
              SizedBox(height: 10),
              Text('Selecione a Saida Física', style: TextStyle(fontSize: 18)),
              RadioListTile(
                value: 0,
                groupValue: _radioValue,
                title: Text('Output 01'),
                onChanged: (val) {
                  setState(() {
                    _radioValue = val;
                    valorRadio = 1;
                  });
                },
              ),
              RadioListTile(
                value: 1,
                groupValue: _radioValue,
                title: Text('Output 02'),
                onChanged: (val) {
                  setState(() {
                    _radioValue = val;
                    valorRadio = 2;
                  });
                },
              ),
              RadioListTile(
                value: 2,
                groupValue: _radioValue,
                title: Text('Output 03'),
                onChanged: (val) {
                  setState(() {
                    _radioValue = val;
                    valorRadio = 3;
                  });
                },
              ),
              SizedBox(height: 10),
            ]),
          )),
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
            icon: Icon(Icons.check_box_rounded),
            label: 'Alterar Botão',
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
              builder: (context) => ConfigBotaoAcao(
                  ambienteTexto: ambientesName[indexAmbPassado],
                  ambientePassado: indexAmbPassado)));
    } else if (_currentIndex == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Ambientes()));
    } else if (_currentIndex == 2) {
      if (_txtNomeBotao.text.isNotEmpty &
          _txtComentarioBotao.text.isNotEmpty &
          (valorDropDown != '') &
          (valorRadio != 0)) {
        for (int i = 0; i < devicesName.length; i++) {
          if (devicesName[i] == _valueDropDown) {
            EditarAcoes(
              idBotao[indexBotaoPassado],
              idDevices[i],
              _txtNomeBotao.text,
              _txtComentarioBotao.text,
              valorDropDown,
              valorRadio
            );
            i = devicesName.length;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ConfigBotaoAcao(
                  ambienteTexto: ambientesName[indexAmbPassado],
                  ambientePassado: indexAmbPassado
                )
              )
            );
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              '!!!Para atualizar o botão de ação não podem haver campos nulos!!!'),
          duration: Duration(seconds: 5),
        ));
      }
    }
  }
}
