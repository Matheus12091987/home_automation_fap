import 'package:flutter/material.dart';
import '0.0_banco_de_dados.dart';

/*########################################################
    Alterar Senha do usuario atual
########################################################*/

var senhaAtual = TextEditingController();
var novaSenha = TextEditingController();
var novaSenhaRepetida = TextEditingController();

alterarSenhaAtual(BuildContext context) {
  senhaAtual.clear();
  novaSenha.clear();
  novaSenhaRepetida.clear();
  
  Widget cancelaButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('A senha não foi alterada!!!'),
        duration: Duration(seconds: 2),
      ));
      return 0;
    },
  );
  Widget continuaButton = TextButton(
    child: Text("Alterar"),
    onPressed: () {
      if (senhaAtual.text == senhas[posUsuarioAtual[0]]) {
        if (novaSenha.text.isNotEmpty & novaSenhaRepetida.text.isNotEmpty) {
          if (novaSenha.text == novaSenhaRepetida.text) {
            senhas[posUsuarioAtual[0]]= novaSenha.text;
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('A senha foi alterada com sucesso!!!'),
              duration: Duration(seconds: 2),
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('As novas senhas não conferem!!! Não alterado!!!'),
              duration: Duration(seconds: 2),
            ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('As novas senhas não podem ser nulas!!! Não alterado!!!'),
            duration: Duration(seconds: 2),
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('As senha atual esta errada!!! Não alterado!!!'),
          duration: Duration(seconds: 2),
        ));
      }
      return 1;
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alterar Senha. Usuário: " + usuarios[posUsuarioAtual[0]] + "!!!"),
    content: Container(
        child: SizedBox(
      height: 260,
      width: 50,
      child: Column(
        children: [
          TextField(
              controller: senhaAtual,
              obscureText: true,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                  labelText: 'Senha Atual!!!', border: OutlineInputBorder())),
          SizedBox(height: 20),
          TextField(
              controller: novaSenha,
              obscureText: true,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                  labelText: 'Nova Senha!!!', border: OutlineInputBorder())),
          SizedBox(height: 20),
          TextField(
              controller: novaSenhaRepetida,
              obscureText: true,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                  labelText: 'Repita a Nova Senha!!!',
                  border: OutlineInputBorder())),
          SizedBox(height: 20),
        ],
      ),
    )),
    actions: [
      cancelaButton,
      continuaButton,
    ],
  );
  //exibe o diálogo
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
