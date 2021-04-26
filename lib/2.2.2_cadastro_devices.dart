//
// Tela dos Devices Cadastrados
//

import 'package:flutter/material.dart';
import '0.0_banco_de_dados.dart';
import '2.0_ambientes.dart';
import '2.2_config.dart';

class DevicesCadastrados extends StatefulWidget {
  @override
  _DevicesCadastradosState createState() => _DevicesCadastradosState();
}

class _DevicesCadastradosState extends State<DevicesCadastrados> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Devices Cadastrados'),
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
                        devicesName[index],
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
                            'Tipo: ' + devicesTipo[index].toString(),
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
                            'Addr Local: ' + devicesAddrLocal[index],
                            overflow: TextOverflow.fade,
                            maxLines: 5,
                            softWrap: true,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Addr Remoto: ' + devicesAddrRemoto[index],
                            overflow: TextOverflow.fade,
                            maxLines: 5,
                            softWrap: true,
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Tag Feedback: ' + devicesFeedback[index],
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
                            //int msg = index;
                            /*Navigator.push(
                              context, MaterialPageRoute(builder: 
                                (context) => EdicaoUsuarios(retornando: msg,)
                              )
                            );*/
                            //
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Editar este Device.'),
                              duration: Duration(seconds: 2),
                            ));
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            devicesName.removeAt(index);
                            devicesAddrLocal.removeAt(index);
                            devicesAddrRemoto.removeAt(index);
                            devicesTipo.removeAt(index);
                            devicesFeedback.removeAt(index);
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
              itemCount: devicesName.length,
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
            label: 'Novo Device',
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
      /*Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Configuracao()
        )
      );*/
    }
  }
}
