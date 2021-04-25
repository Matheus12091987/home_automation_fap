import 'package:flutter/material.dart';
import '0.0_banco_de_dados.dart';

/*########################################################
    Incluir um Novo Ambiente / Comodo
########################################################*/

var nomeAmbiente = TextEditingController();
var comentarioAmbiente = TextEditingController();

inserirNovoAmbiente(BuildContext context) {
  nomeAmbiente.clear();
  comentarioAmbiente.clear();

  Widget cancelaButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Nenhum Ambiente foi Inserido!!!'),
        duration: Duration(seconds: 2),
      ));
      return 0;
    },
  );
  Widget continuaButton = TextButton(
    child: Text("Inserir"),
    onPressed: () {
      //
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Incluir Novo Ambiente. Usuário: " + usuarios[posUsuarioAtual[0]] + "!!!"),
    content: Container(
        child: SizedBox(
      height: 260,
      width: 50,
      child: Column(
        children: [
          TextField(
              controller: nomeAmbiente,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                  labelText: 'Nome do Novo Ambiente',
                  border: OutlineInputBorder())),
          SizedBox(height: 20),
          TextField(
              controller: comentarioAmbiente,
              style: TextStyle(fontSize: 18),
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                  labelText: 'Comentário Sobre!!!',
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
