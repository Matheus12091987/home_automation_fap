//
// Tela dos usuários Cadastrados
//

import 'package:flutter/material.dart';

import '0.0_banco_de_dados.dart';
import '2.0_ambientes.dart';
import '2.2_config.dart';
import '2.2.4.1_inclusao_usuarios.dart';
import '2.2.4.2_edicao_usuarios.dart';

class UsuariosCadastrados extends StatefulWidget {
  @override
  _UsuariosCadastradosState createState() => _UsuariosCadastradosState();
}

class _UsuariosCadastradosState extends State<UsuariosCadastrados> {
  int _currentIndex = 0;
  var grupoUsuario;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuários Cadastrados'),
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
                if (niveisAcesso[index] == 1) {
                  grupoUsuario = "Administrador(a)";
                } else if (niveisAcesso[index] == 2) {
                  grupoUsuario = "Usuário(a)";
                } else {
                  grupoUsuario = "Convidado(a)";
                }
                return ListTile(
                  title: Row(
                    children: [
                      Expanded(
                          child: Text(
                        usuarios[index],
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
                          Text('Usuario tipo: ' + grupoUsuario),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Criar Ambientes: ' +
                              criarAmbientes[index].toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Incluir Devices: ' +
                              incluirDevices[index].toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Alterar Senha: ' +
                              alterarSenha[index].toString()),
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
                            int msg = index;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EdicaoUsuarios(
                                          retornando: msg,
                                        )));
                          });
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            if(usuarios[index] != 'admin'){
                              if(idUsuario[index] != idUsuario[posUsuarioAtual[0]]){
                                ExcluirUsuario(idUsuario[index]);
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('Usuario removido com sucesso.'),
                                  duration: Duration(seconds: 2),
                                ));
                              }else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text('Você não pode Remover a sí mesmo!!!'),
                                  duration: Duration(seconds: 2),
                                ));
                              }
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('O usuario admin não pode ser removido!!!'),
                                duration: Duration(seconds: 2),
                              ));
                            }                              
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
              itemCount: usuarios.length,
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
            label: 'New User',
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => InclusaoUsuarios()));
    }
  }
}
