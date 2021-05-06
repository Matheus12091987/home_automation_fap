//
// Tela das Configurações
//

import 'package:flutter/material.dart';

import '0.0_banco_de_dados.dart';
import '0.1_popup_acesso_adm.dart';
import '2.0_ambientes.dart';
import '2.2.1_popup_alterar_senha.dart';
import '2.2.2_cadastro_devices.dart';
import '2.2.3_cadastro_ambientes.dart';
import '2.2.4_cadastro_usuarios.dart';

class Configuracao extends StatefulWidget {
  @override
  _ConfiguracaoState createState() => _ConfiguracaoState();
}

class _ConfiguracaoState extends State<Configuracao> {
  int _currentIndex = 0;
  var txtDialogo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações Administrativas '),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: ConstrainedBox(
                    //define o tamanho do botão
                    constraints:
                        BoxConstraints.tightFor(width: 200, height: 60),
                    child: ElevatedButton(
                      child: Text('Devices Cadastrados'),
                      onPressed: () {
                        if(incluirDevices[posUsuarioAtual[0]] == true){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DevicesCadastrados()));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Usuário não habilitado para acessar esta função, procure o Administrador!!!'),
                            duration: Duration(seconds: 2),
                          ));
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: ConstrainedBox(
                    //define o tamanho do botão
                    constraints:
                        BoxConstraints.tightFor(width: 200, height: 60),
                    child: ElevatedButton(
                      child: Text('Ambientes Cadastrados'),
                      onPressed: () {
                        if(criarAmbientes[posUsuarioAtual[0]] == true){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AmbientesCadastrados()));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Usuário não habilitado para acessar esta função, procure o Administrador!!!'),
                            duration: Duration(seconds: 2),
                          ));
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: ConstrainedBox(
                    //define o tamanho do botão
                    constraints:
                        BoxConstraints.tightFor(width: 200, height: 60),
                    child: ElevatedButton(
                      child: Text('Usuários Cadastrados'),
                      onPressed: () async {
                        if (await (acessoAdministrativo(context, 0)) == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UsuariosCadastrados()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Solicitação Cancelada!!!'),
                            duration: Duration(seconds: 2),
                          ));
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: ConstrainedBox(
                    //define o tamanho do botão
                    constraints:
                        BoxConstraints.tightFor(width: 200, height: 60),
                    child: ElevatedButton(
                      child: Text('Alterar Minha Senha'),
                      onPressed: () async {
                        if(alterarSenha[posUsuarioAtual[0]] == true){
                          await (alterarSenhaAtual(context));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Usuário não habilitado para acessar esta função, procure o Administrador!!!'),
                            duration: Duration(seconds: 2),
                          ));
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 60),
              ]),
        ),
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
      // sem função
    }
  }
}
