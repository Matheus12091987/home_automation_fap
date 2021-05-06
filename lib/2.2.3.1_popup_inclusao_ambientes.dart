import 'package:flutter/material.dart';
import '0.0_banco_de_dados.dart';
import '2.2.3_cadastro_ambientes.dart';

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
      if (nomeAmbiente.text.isEmpty || comentarioAmbiente.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Não deve haver campos nulos!!!'),
          duration: Duration(seconds: 2),
        ));
      } else {
        if (ambientesName.length != 0) {
          for (int i = 0; i < ambientesName.length; i++) {
            if (nomeAmbiente.text == ambientesName[i]) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Nome de ambiente já existe, tente outro!!!'),
                duration: Duration(seconds: 2),
              ));
              i = ambientesName.length;
            } else if ((i + 1) == ambientesName.length) {
              AdicionarAmbiente(idUsuario[posUsuarioAtual[0]], nomeAmbiente.text, comentarioAmbiente.text);
              i = ambientesName.length;
              Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => AmbientesCadastrados()));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('O Ambiente foi Inserido com Sucesso!!!'),
                duration: Duration(seconds: 2),
              ));
            }
          }
        }else{
          AdicionarAmbiente(idUsuario[posUsuarioAtual[0]], nomeAmbiente.text, comentarioAmbiente.text);
          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AmbientesCadastrados()));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('O Ambiente foi Inserido com Sucesso!!!'),
            duration: Duration(seconds: 2),
          ));
        }
      }
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Incluir Novo Ambiente. Usuário: " +
        usuarios[posUsuarioAtual[0]] +
        "!!!"),
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
