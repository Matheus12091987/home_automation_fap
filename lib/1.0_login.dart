//
// TELA DE LOGIN
//

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '0.0_banco_de_dados.dart';
import '2.0_ambientes.dart';
import '2.1_sobre.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _txtUsuario = TextEditingController();
  var _txtSenha = TextEditingController();
  int _currentIndex = 0;
  bool _passwordVisible;

  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acesso a Sistema'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Image.asset(
            'images/logo.jpg',
            height: 130,
            width: 130,
          ),
          Padding(padding: EdgeInsets.all(10)),
          TextField(
            controller: _txtUsuario,
            decoration: InputDecoration(
                labelText: 'Nome de Usuário', border: OutlineInputBorder()),
          ),
          SizedBox(height: 30),
          TextField(
            controller: _txtSenha,
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              labelText: 'Senha',
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColorDark,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: ConstrainedBox(
                    //define o tamanho do botão
                    constraints:
                        BoxConstraints.tightFor(width: 170, height: 40),
                    child: ElevatedButton(
                      child: Text('Esqueci Minha Senha'),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              '!!!Procure o administrador do sistema para corrigir sua senha!!!'),
                          duration: Duration(seconds: 5),
                        ));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ConstrainedBox(
                    //define o tamanho do botão
                    constraints:
                        BoxConstraints.tightFor(width: 170, height: 40),
                    child: ElevatedButton(
                      child: Text('Avançar'),
                      onPressed: () {
                        posUsuarioAtual[0] = 0;
                        for (int i = 0; i < usuarios.length; i++) {
                          if (usuarios[i] == _txtUsuario.text) {
                            posUsuarioAtual[0] = i;
                            if (_txtUsuario.text == usuarios[i] &&
                                _txtSenha.text == senhas[i]) {
                              i = usuarios.length;
                              LimparAmbientes();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Ambientes()));
                            } else {
                              i = usuarios.length;
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(
                                    'Verifique seu Usuário ou Senha por favor'),
                                duration: Duration(seconds: 4),
                              ));
                            }
                          } else if ((posUsuarioAtual[0] == 0) &
                              ((i + 1) == usuarios.length)) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Usuario não encontrado"),
                              duration: Duration(seconds: 4),
                            ));
                          }
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Fechar App',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: 'Sobre',
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (_currentIndex == 0) {
      SystemNavigator.pop();
    } else if (_currentIndex == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre()));
    }
  }
}
