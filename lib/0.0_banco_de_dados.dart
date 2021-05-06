/*######################################################
    Banco de dados do sistema (Provisório)
######################################################*/

/*######################################################
    Variaveis gerais do sistema
######################################################*/

var posUsuarioAtual = [];

/*######################################################
    Variaveis do Banco de Dados 
######################################################*/

class Usuario {
  int id;
  String nome;
  String senha;
  int nivelAcesso;
  bool criarAmbiente;
  bool incluirNovosDevices;
  bool alterarSenha;

  Usuario(this.id, this.nome, this.senha, this.nivelAcesso, this.criarAmbiente,
      this.incluirNovosDevices, this.alterarSenha);
}

class Ambiente {
  int id;
  int idUsuario;
  String nome;
  String comentario;

  Ambiente(this.id, this.idUsuario, this.nome, this.comentario);
}

class Device {
  int id;
  String nome;
  String comentario;
  int tipo;
  String addrLocal;
  String addrRemoto;
  String feedback;

  Device(this.id, this.nome, this.comentario, this.tipo, this.addrLocal,
      this.addrRemoto, this.feedback);
}

class Botoes {
  int id;
  int idAmbiente;
  int idUsuario;
  int idDevice;
  String nome;
  String comentario;
  String nomePlaca;
  int saidaFisica;

  Botoes(
    this.id,
    this.idAmbiente,
    this.idUsuario,
    this.idDevice,
    this.nome,
    this.comentario,
    this.nomePlaca,
    this.saidaFisica,
  );
}

/*######################################################
    Iniciando as listas
######################################################*/
List<Usuario> geralUsuarios = [];
List<Ambiente> geralAmbientes = [];
List<Device> geralDevice = [];
List<Botoes> geralBotoes = [];
/*######################################################
    Variaveis do Locais 
######################################################*/

// Usuários
var idUsuario = [];
var usuarios = [];
var senhas = [];
var niveisAcesso = [];
var criarAmbientes = [];
var incluirDevices = [];
var alterarSenha = [];

// Ambientes
var idAmbiente = [];
var idUsuAmb = [];
var ambientesName = [];
var ambientesComentario = [];

// Devices
var idDevices = [];
var devicesName = [];
var devicesComentario = [];
var devicesTipo = [];
var devicesAddrLocal = [];
var devicesAddrRemoto = [];
var devicesFeedback = [];

//Botões
var idBotao = [];
var idBotAmb = [];
var idBotAmbUsu = [];
var idBotDev = [];
var botaoName = [];
var botaoComentario = [];
var botaoNomePlaca = [];
var botaoSaidaFisica = [];

/*######################################################
      Functions do sistema
  ######################################################*/
//********************Usuarios****************************
// ignore: non_constant_identifier_names
AdicionarUsuario(var a, var b, var c, var d, var e, var f) {
  if (geralUsuarios.length == 0) {
    geralUsuarios.add(Usuario(1, a, b, c, d, e, f));
  } else {
    geralUsuarios.add(Usuario(
        geralUsuarios[geralUsuarios.length - 1].id + 1, a, b, c, d, e, f));
  }
  CarregaNovoUsuario(geralUsuarios.length - 1);
}

// ignore: non_constant_identifier_names
CarregaNovoUsuario(var posicao) {
  idUsuario.add(geralUsuarios[posicao].id);
  usuarios.add(geralUsuarios[posicao].nome);
  senhas.add(geralUsuarios[posicao].senha);
  niveisAcesso.add(geralUsuarios[posicao].nivelAcesso);
  criarAmbientes.add(geralUsuarios[posicao].criarAmbiente);
  incluirDevices.add(geralUsuarios[posicao].incluirNovosDevices);
  alterarSenha.add(geralUsuarios[posicao].alterarSenha);
}

// ignore: non_constant_identifier_names
EditarUsuario(var a, var b, var c, var d, var e, var id, var index) {
  for (int i = 0; i < geralUsuarios.length; i++) {
    if (geralUsuarios[i].id == id) {
      geralUsuarios[i].senha = a;
      geralUsuarios[i].nivelAcesso = b;
      geralUsuarios[i].criarAmbiente = c;
      geralUsuarios[i].incluirNovosDevices = d;
      geralUsuarios[i].alterarSenha = e;
      AtualizarBaseLocalUsuarios(index, i);
      i = geralUsuarios.length;
    }
  }
}

// ignore: non_constant_identifier_names
AtualizarBaseLocalUsuarios(var indexLocal, var indexBd) {
  senhas[indexLocal] = geralUsuarios[indexBd].senha;
  niveisAcesso[indexLocal] = geralUsuarios[indexBd].nivelAcesso;
  criarAmbientes[indexLocal] = geralUsuarios[indexBd].criarAmbiente;
  incluirDevices[indexLocal] = geralUsuarios[indexBd].incluirNovosDevices;
  alterarSenha[indexLocal] = geralUsuarios[indexBd].alterarSenha;
}

// ignore: non_constant_identifier_names
AlterarSenhaUsuario(var novaSenha, var idUsuario, var indexLocal) {
  for (int i = 0; i < geralUsuarios.length; i++) {
    if (geralUsuarios[i].id == idUsuario) {
      geralUsuarios[i].senha = novaSenha;
      AtualizarBaseLocalUsuarios(indexLocal, i);
      i = geralUsuarios.length;
    }
  }
}

// ignore: non_constant_identifier_names
ExcluirUsuario(var idUsu) {
  for (int i = (geralBotoes.length - 1); i >= 0; i--) {
    if (geralBotoes[i].idUsuario == idUsu) {
      geralBotoes.removeAt(i);
    }
  }
  for (int i = (geralAmbientes.length - 1); i >= 0; i--) {
    if (geralAmbientes[i].idUsuario == idUsu) {
      geralAmbientes.removeAt(i);
    }
  }
  for (int i = 0; i < geralUsuarios.length; i++) {
    if (geralUsuarios[i].id == idUsu) {
      geralUsuarios.removeAt(i);
      i = geralUsuarios.length;
      CarregarUsuarios();
    }
  }
}

// ignore: non_constant_identifier_names
CarregarUsuarios() {
  idUsuario.clear();
  usuarios.clear();
  senhas.clear();
  niveisAcesso.clear();
  criarAmbientes.clear();
  incluirDevices.clear();
  alterarSenha.clear();

  for (int i = 0; i < geralUsuarios.length; i++) {
    idUsuario.add(geralUsuarios[i].id);
    usuarios.add(geralUsuarios[i].nome);
    senhas.add(geralUsuarios[i].senha);
    niveisAcesso.add(geralUsuarios[i].nivelAcesso);
    criarAmbientes.add(geralUsuarios[i].criarAmbiente);
    incluirDevices.add(geralUsuarios[i].incluirNovosDevices);
    alterarSenha.add(geralUsuarios[i].alterarSenha);
  }
}

//********************Devices****************************
// ignore: non_constant_identifier_names
AdicionarDevice(var a, var b, var c, var d, var e, var f) {
  if (geralDevice.length == 0) {
    geralDevice.add(Device(1, a, b, c, d, e, f));
  } else {
    geralDevice.add(
        Device(geralDevice[geralDevice.length - 1].id + 1, a, b, c, d, e, f));
  }
  CarregaNovoDevice(geralDevice.length - 1);
}

// ignore: non_constant_identifier_names
CarregaNovoDevice(int posicao_bd) {
  idDevices.add(geralDevice[posicao_bd].id);
  devicesName.add(geralDevice[posicao_bd].nome);
  devicesComentario.add(geralDevice[posicao_bd].comentario);
  devicesTipo.add(geralDevice[posicao_bd].tipo);
  devicesAddrLocal.add(geralDevice[posicao_bd].addrLocal);
  devicesAddrRemoto.add(geralDevice[posicao_bd].addrRemoto);
  devicesFeedback.add(geralDevice[posicao_bd].feedback);
}

// ignore: non_constant_identifier_names
EditarDevice(var a, var b, var c, var d, var e, var f, var id, var indexLocal) {
  for (int i = 0; i < geralDevice.length; i++) {
    if (geralDevice[i].id == id) {
      geralDevice[i].nome = a;
      geralDevice[i].comentario = b;
      geralDevice[i].tipo = c;
      geralDevice[i].addrLocal = d;
      geralDevice[i].addrRemoto = e;
      geralDevice[i].feedback = f;
      AtualizarBaseLocalDevices(indexLocal, i);
    }
  }
}

// ignore: non_constant_identifier_names
AtualizarBaseLocalDevices(var indexLocal, var indexBd) {
  devicesName[indexLocal] = geralDevice[indexBd].nome;
  devicesComentario[indexLocal] = geralDevice[indexBd].comentario;
  devicesTipo[indexLocal] = geralDevice[indexBd].tipo;
  devicesAddrLocal[indexLocal] = geralDevice[indexBd].addrLocal;
  devicesAddrRemoto[indexLocal] = geralDevice[indexBd].addrRemoto;
  devicesFeedback[indexLocal] = geralDevice[indexBd].feedback;
}

// ignore: non_constant_identifier_names
ExcluirDevice(var deviceId, var indexLocal) {
  for (int i = 0; i < geralDevice.length; i++) {
    if (geralDevice[i].id == deviceId) {
      geralDevice.removeAt(i);

      idDevices.removeAt(indexLocal);
      devicesName.removeAt(indexLocal);
      devicesComentario.removeAt(indexLocal);
      devicesTipo.removeAt(indexLocal);
      devicesAddrLocal.removeAt(indexLocal);
      devicesAddrRemoto.removeAt(indexLocal);
      devicesFeedback.removeAt(indexLocal);

      i = geralDevice.length;
    }
  }
}

//********************Ambientes***************************
// ignore: non_constant_identifier_names
AdicionarAmbiente(var a, var b, var c) {
  if (geralAmbientes.length == 0) {
    geralAmbientes.add(Ambiente(1, a, b, c));
  } else {
    geralAmbientes.add(
        Ambiente(geralAmbientes[geralAmbientes.length - 1].id + 1, a, b, c));
  }
}

// ignore: non_constant_identifier_names
CarregarAmbiente(var idUsu) {
  for (int i = 0; i < geralAmbientes.length; i++) {
    if (geralAmbientes[i].idUsuario == idUsu) {
      idAmbiente.add(geralAmbientes[i].id);
      idUsuAmb.add(geralAmbientes[i].idUsuario);
      ambientesName.add(geralAmbientes[i].nome);
      ambientesComentario.add(geralAmbientes[i].comentario);
    }
  }
}

// ignore: non_constant_identifier_names
EditarAmbiente(var a, var b, var id, var index) {
  for (int i = 0; i < geralAmbientes.length; i++) {
    if (geralAmbientes[i].id == id) {
      geralAmbientes[i].nome = a;
      geralAmbientes[i].comentario = b;
      AtualizarBaseLocalAmbientes(index, i);
      i = geralAmbientes.length;
    }
  }
}

// ignore: non_constant_identifier_names
AtualizarBaseLocalAmbientes(var indexLocal, var indexBd) {
  ambientesName[indexLocal] = geralAmbientes[indexBd].nome;
  ambientesComentario[indexLocal] = geralAmbientes[indexBd].comentario;
}

// ignore: non_constant_identifier_names
LimparAmbientes() {
  idAmbiente.clear();
  idUsuAmb.clear();
  ambientesName.clear();
  ambientesComentario.clear();
}

// ignore: non_constant_identifier_names
ExcluirAmbientes(var idAmb) {
  for (int i = (geralBotoes.length - 1); i >= 0; i--) {
    if (geralBotoes[i].idAmbiente == idAmb) {
      geralBotoes.removeAt(i);
    }
  }
  for (int i = 0; i < geralAmbientes.length; i++) {
    if (geralAmbientes[i].id == idAmb) {
      geralAmbientes.removeAt(i);
      i = geralAmbientes.length;
    }
  }
}

//**********************Ações*****************************
// ignore: non_constant_identifier_names
AdicionarAcoes(var idAmb, var idUsu, var idDev, var nome, var comentario,
    var deviceName, var saida) {
  if (geralBotoes.length == 0) {
    geralBotoes.add(
        Botoes(1, idUsu, idAmb, idDev, nome, comentario, deviceName, saida));
  } else {
    geralBotoes.add(Botoes(geralBotoes[geralBotoes.length - 1].id + 1, idAmb,
        idUsu, idDev, nome, comentario, deviceName, saida));
  }
}

// ignore: non_constant_identifier_names
CarregaAcoes(var idUsu, var idAmb) {
  for (int i = 0; i < geralBotoes.length; i++) {
    if ((geralBotoes[i].idUsuario == idUsu) &
        (geralBotoes[i].idAmbiente == idAmb)) {
      idBotao.add(geralBotoes[i].id);
      idBotAmb.add(geralBotoes[i].idAmbiente);
      idBotAmbUsu.add(geralBotoes[i].idUsuario);
      idBotDev.add(geralBotoes[i].idDevice);
      botaoName.add(geralBotoes[i].nome);
      botaoComentario.add(geralBotoes[i].comentario);
      botaoNomePlaca.add(geralBotoes[i].nomePlaca);
      botaoSaidaFisica.add(geralBotoes[i].saidaFisica);
    }
  }
}

// ignore: non_constant_identifier_names
EditarAcoes(var idBotao, var idDev, var nome, var comentario, var deviceName,
    var saida) {
  for (int i = 0; i < geralBotoes.length; i++) {
    if (geralBotoes[i].id == idBotao) {
      geralBotoes[i].idDevice = idDev;
      geralBotoes[i].nome = nome;
      geralBotoes[i].comentario = comentario;
      geralBotoes[i].nomePlaca = deviceName;
      geralBotoes[i].saidaFisica = saida;
      i = geralBotoes.length;
    }
  }
}

// ignore: non_constant_identifier_names
LimparAcoes() {
  idBotao.clear();
  idBotAmb.clear();
  idBotAmbUsu.clear();
  idBotDev.clear();
  botaoName.clear();
  botaoComentario.clear();
  botaoNomePlaca.clear();
  botaoSaidaFisica.clear();
}

// ignore: non_constant_identifier_names
ExcluirAcoes(var idAcao) {
  for (int i = 0; i < geralBotoes.length; i++) {
    if (geralBotoes[i].id == idAcao) {
      geralBotoes.removeAt(i);
      i = geralBotoes.length;
    }
  }
}
