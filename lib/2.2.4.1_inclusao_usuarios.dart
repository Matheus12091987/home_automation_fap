//
// Tela de Inclusão de Usuários
//

import 'package:flutter/material.dart';

import '0.0_banco_de_dados.dart';
import '2.0_ambientes.dart';
import '2.2.4_cadastro_usuarios.dart';

class InclusaoUsuarios extends StatefulWidget {
  @override
  _InclusaoUsuariosState createState() => _InclusaoUsuariosState();
}

class _InclusaoUsuariosState extends State<InclusaoUsuarios> {
  int _currentIndex = 0;
  int valorRadio = 0;
  bool _passwordVisible;
  bool valorCheckAmbiente = false;
  bool valorCheckDevices = false;
  bool valorCheckSenha = false;

  var _txtUsuarioCadastro = TextEditingController();
  var _txtSenhaCadastro = TextEditingController();
  var _radioValue;

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inclusão de Usuários'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
          padding: EdgeInsets.all(20),
          child: Scrollbar(
            child: Column(children: [
              Padding(padding: EdgeInsets.all(10)),
              TextField(
                controller: _txtUsuarioCadastro,
                decoration: InputDecoration(
                    labelText: 'Nome de Usuário', border: OutlineInputBorder()),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _txtSenhaCadastro,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )),
              ),
              SizedBox(height: 10),
              Text('Grupo deste Usuário'),
              RadioListTile(
                value: 0,
                groupValue: _radioValue,
                title: Text('Administrador'),
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
                title: Text('Usuário'),
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
                title: Text('Convidado'),
                onChanged: (val) {
                  setState(() {
                    _radioValue = val;
                    valorRadio = 3;
                  });
                },
              ),
              SizedBox(height: 10),
              Text('Habilitações deste Usuário'),
              CheckboxListTile(
                  title: Text('Criar Ambientes'),
                  value: valorCheckAmbiente,
                  onChanged: (bool value) {
                    setState(() {
                      //timeDilation = value ? 5.0 : 1.0;
                      valorCheckAmbiente = value;
                    });
                  }),
              CheckboxListTile(
                  title: Text('Incluir Devices'),
                  value: valorCheckDevices,
                  onChanged: (bool value) {
                    setState(() {
                      //timeDilation = value ? 5.0 : 1.0;
                      valorCheckDevices = value;
                    });
                  }),
              CheckboxListTile(
                  title: Text('Alterar a Senha'),
                  value: valorCheckSenha,
                  onChanged: (bool value) {
                    setState(() {
                      //timeDilation = value ? 5.0 : 1.0;
                      valorCheckSenha = value;
                    });
                  }),
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
            label: 'Cadastrar New User',
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
          MaterialPageRoute(builder: (context) => UsuariosCadastrados()));
    } else if (_currentIndex == 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Ambientes()));
    } else if (_currentIndex == 2) {
      if (_txtUsuarioCadastro.text.isNotEmpty &
          _txtSenhaCadastro.text.isNotEmpty & (valorRadio != 0)) {
        int j = 0;
        if (usuarios.length != 0) {
          for (int i = 0; i < usuarios.length; i++) {
            if (usuarios[i] == _txtUsuarioCadastro.text) {
              j = 1;
            }
            if ((j == 0) & ((i + 1) == usuarios.length)) {
              AdicionarUsuario(
                  _txtUsuarioCadastro.text,
                  _txtSenhaCadastro.text,
                  valorRadio,
                  valorCheckAmbiente,
                  valorCheckDevices,
                  valorCheckSenha);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UsuariosCadastrados()));
              i = usuarios.length;
            } else if ((j == 1) & ((i + 1) == usuarios.length)) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:
                    Text('!!!Usuario já cadastrado, verifique novamente!!!'),
                duration: Duration(seconds: 5),
              ));
            }
          }
        }else{
          AdicionarUsuario(
            _txtUsuarioCadastro.text,
            _txtSenhaCadastro.text,
            valorRadio,
            valorCheckAmbiente,
            valorCheckDevices,
            valorCheckSenha);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => UsuariosCadastrados()
            )
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              '!!!Para cadastrar um usuario não podem haver campos nulos!!!'),
          duration: Duration(seconds: 5),
        ));
      }
    }
  }
}
