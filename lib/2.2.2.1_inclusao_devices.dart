//
// Tela de Inclusão de Devices
//

import 'package:flutter/material.dart';

import '0.0_banco_de_dados.dart';
import '2.0_ambientes.dart';
import '2.2.2_cadastro_devices.dart';

class InclusaoDevices extends StatefulWidget {
  @override
  _InclusaoDevicesState createState() => _InclusaoDevicesState();
}

class _InclusaoDevicesState extends State<InclusaoDevices> {
  int _currentIndex = 0;
  int valorRadio = 0;

  var _txtDeviceCadastro = TextEditingController();
  var _txtComentarioCadastro = TextEditingController();
  var _txtAddrLocalCadastro = TextEditingController();
  var _txtAddrRemotoCadastro = TextEditingController();
  var _txtFeedbackCadastro = TextEditingController();
  var _radioValue;

  @override
  // ignore: must_call_super
  void initState() {
    //
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inclusão de Devices'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Scrollbar(
            child: Column(children: [
              Padding(padding: EdgeInsets.all(5)),
              Text('Apelido e Comentário do Device'),
              SizedBox(height: 5),
              TextField(
                controller: _txtDeviceCadastro,
                decoration: InputDecoration(
                    labelText: 'Apelido do Device',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 5),
              TextField(
                controller: _txtComentarioCadastro,
                decoration: InputDecoration(
                  labelText: 'Comentario',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 5),
              Text('Tipo de Device'),
              RadioListTile(
                value: 0,
                groupValue: _radioValue,
                title: Text('Facility Start'),
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
                title: Text('Facility IR'),
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
                title: Text('Facility CAM'),
                onChanged: (val) {
                  setState(() {
                    _radioValue = val;
                    valorRadio = 3;
                  });
                },
              ),
              SizedBox(height: 5),
              Text('Endereços de comunicação e Feedback'),
              SizedBox(height: 5),
              TextField(
                controller: _txtAddrLocalCadastro,
                decoration: InputDecoration(
                    labelText: 'Endereço Local Device',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 5),
              TextField(
                controller: _txtAddrRemotoCadastro,
                decoration: InputDecoration(
                    labelText: 'Endereço Remoto Device',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 5),
              TextField(
                controller: _txtFeedbackCadastro,
                decoration: InputDecoration(
                    labelText: 'Feedback do Device',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 5),
              //
              //
              //
              //
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
            icon: Icon(Icons.add_box_rounded),
            label: 'Cadastrar New Device',
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
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => DevicesCadastrados()));
    } else if (_currentIndex == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Ambientes()));
    } else if (_currentIndex == 2) {
      if (_txtDeviceCadastro.text.isNotEmpty &
          _txtComentarioCadastro.text.isNotEmpty &
          _txtAddrLocalCadastro.text.isNotEmpty &
          _txtAddrRemotoCadastro.text.isNotEmpty &
          _txtFeedbackCadastro.text.isNotEmpty &
          (valorRadio != 0)) {
        for (int i = 0; i < geralDevice.length; i++) {
          if (geralDevice[i].nome == _txtDeviceCadastro.text) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Já existe um Device com este nome, alterar!!!'),
              duration: Duration(seconds: 5),
            ));
            i = geralDevice.length;
          } else if (i + 1 == geralDevice.length) {
            AdicionarDevice(
                _txtDeviceCadastro.text,
                _txtComentarioCadastro.text,
                valorRadio,
                _txtAddrLocalCadastro.text,
                _txtAddrRemotoCadastro.text,
                _txtFeedbackCadastro.text);
            i = geralDevice.length;
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => DevicesCadastrados()));
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text('!!!Para Cadastrar o Device não pode haver campos nulos!!!'),
          duration: Duration(seconds: 5),
        ));
      }
    }
  }
}
