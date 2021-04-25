/*######################################################
    Variaveis gerais do sistema
######################################################*/
var posUsuarioAtual = [];

/*######################################################
    Variaveis do Banco de Dados 
######################################################*/
// Usuários
var usuarios = [];
var senhas = [];
var niveisAcesso = [];
var criarAmbientes = [];
var incluirDevices = [];
var alterarSenha = [];

// Ambientes
var ambientes = [];

// Devices
var devicesName = [];
var devicesTipo = [];
var devicesAddrLocal = [];
var devicesAddrRemoto = [];
var devicesFeedback = [];

/*######################################################
    Functions do sistema
######################################################*/
// ignore: non_constant_identifier_names
AdicionarUsuario(var a, var b, var c, var d, var e, var f) {
  usuarios.add(a);
  senhas.add(b);
  niveisAcesso.add(c);
  criarAmbientes.add(d);
  incluirDevices.add(e);
  alterarSenha.add(f);
}

// ignore: non_constant_identifier_names
EditarUsuario(var a, var b, var c, var d, var e, var posicao) {
  senhas[posicao] = a;
  niveisAcesso[posicao] = b;
  criarAmbientes[posicao] = c;
  incluirDevices[posicao] = d;
  alterarSenha[posicao] = e;
}

// ignore: non_constant_identifier_names
AdicionarDevice(var a, var b, var c, var d, var e) {
  devicesName.add(a);
  devicesTipo.add(b);
  devicesAddrLocal.add(c);
  devicesAddrRemoto.add(d);
  devicesFeedback.add(e);
}

// ignore: non_constant_identifier_names
EditarDevice(var a, var b, var c, var d, var posicao) {
  devicesTipo[posicao] = a;
  devicesAddrLocal[posicao] = b;
  devicesAddrRemoto[posicao] = c;
  devicesFeedback[posicao] = d;
}
