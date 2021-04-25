import 'package:flutter/material.dart';

import '0.0_banco_de_dados.dart';

/*########################################################
    Acesso do Administrador(es)
########################################################*/

var usuarioAdm = TextEditingController();
var senhaAdm = TextEditingController();

acessoAdministrativo(BuildContext context, int resultado) async {
  usuarioAdm.clear();
  senhaAdm.clear();

  Widget cancelaButton = TextButton(
    child: Text("Cancelar"),
    onPressed: () {
      Navigator.pop(context);
      resultado = 0;
    },
  );
  Widget continuaButton = TextButton(
    child: Text("Continar"),
    onPressed: () {
      for (int i = 0; i < usuarios.length; i++) {
        if (usuarioAdm.text == usuarios[i]) {
          if(niveisAcesso[i] != 1){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Este usuario não é Administrador!!!'),
              duration: Duration(seconds: 4),
            ));
            Navigator.pop(context);
            resultado = 0;
          }else{
            if ((usuarioAdm.text == usuarios[i]) & (senhaAdm.text == senhas[i])) {
              Navigator.pop(context);
              resultado = 1;
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Verifique a Senha!!!'),
                duration: Duration(seconds: 4),
              ));
              Navigator.pop(context);
              resultado = 0;
            }
          }
          i = usuarios.length;
        }else if((i+1) == usuarios.length){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Usuário não encontrado!!!'),
            duration: Duration(seconds: 4),
          ));
          Navigator.pop(context);
          resultado = 0;
        }
      }
    },
  );
  //configura o AlertDialog
  AlertDialog alertAdm = AlertDialog(
    title: Text("Acesso Administrativo"),
    content: Container(
        child: SizedBox(
      height: 170,
      width: 50,
      child: Column(
        children: [
          //Padding(padding: EdgeInsets.all(10)),
          TextField(
              controller: usuarioAdm,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                  labelText: 'Usuario Administrativo',
                  border: OutlineInputBorder())),
          SizedBox(height: 20),
          TextField(
              controller: senhaAdm,
              obscureText: true,
              style: TextStyle(fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Senha do Usuario Adm',
                border: OutlineInputBorder(),
              )),
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
  await (showDialog(
    context: context,
    builder: (BuildContext context) {
      return alertAdm;
    },
  ));
  return resultado;
}
