import 'package:flutter/material.dart';

import '0.0_banco_de_dados.dart';
import '2.2.3_cadastro_ambientes.dart';

/*########################################################
    Incluir um Novo Ambiente / Comodo
########################################################*/

var nomeAmbiente = TextEditingController();
var comentarioAmbiente = TextEditingController();

edicaoDoAmbiente(BuildContext context, var indexador) {
  nomeAmbiente.text = ambientesName[indexador];
  comentarioAmbiente.text = ambientesComentario[indexador];

  Widget cancelaButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Nada feito!!!'),
        duration: Duration(seconds: 2),
      ));
      return 0;
    },
  );
  Widget continuaButton = TextButton(
    child: Text("Atualizar"),
    onPressed: () {
      if (nomeAmbiente.text.isEmpty || comentarioAmbiente.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Não deve haver campos nulos!!!'),
          duration: Duration(seconds: 2),
        ));
      } else {
        EditarAmbiente(
              nomeAmbiente.text, 
              comentarioAmbiente.text,
              idAmbiente[indexador], 
              indexador);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => AmbientesCadastrados()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('O Ambiente foi editado com Sucesso!!!'),
          duration: Duration(seconds: 2),
        ));
      }  
    },
  );
  //configura o AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Editar Ambiente. Usuário: " +
        usuarios[posUsuarioAtual[0]] +
        "!!!"),
    content: Container(
        child: SizedBox(
      height: 260,
      width: 50,
      child: Column(
        children: [
          TextField(
              //enabled: false,
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
