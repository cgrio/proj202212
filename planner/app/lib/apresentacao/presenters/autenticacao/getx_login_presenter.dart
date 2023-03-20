import 'package:app/dominio/auxiliares/dominio_erros.dart';
import 'package:app/dominio/casos_uso/autenticacao/salvar_conta_casouso.dart';
import 'package:app/ui/auxiliares/erros/ui_erro.dart';
import 'package:get/get.dart';
import '../../../dominio/casos_uso/autenticacao/login_casouso.dart';
import '../../../ui/paginas/autenticacao/login/login.dart';
import '../../mixins/mixins.dart';
import '../../protocolos/validacao.dart';

class GetxLoginPresenter extends GetxController
    with CarregamentoGerenciador, NavegacaoGerenciador, FormularioGerenciador, UIErrosGerenciador
    implements LoginPresenter {
  final Validacao validacao;
  final LoginCasoUso login;
  final SalvarContaCasoUso salvarConta;
  final _emailErro = Rx<UIErro?>(null);
  final _senhaErro = Rx<UIErro?>(null);
  final _estaValidoFormulario = Rx<bool?>(null);

  String? _login;
  String? _senha;

  GetxLoginPresenter({required this.validacao, required this.login, required this.salvarConta});

  @override
  Stream<UIErro?> get emailErroStream => _emailErro.stream;

  @override
  void irParaCadastroUsuario() {
    navegarPara = '/cadastro_usuario';
  }

  @override
  Stream<UIErro?> get senhaErroStream => _senhaErro.stream;

  UIErro? _validarCampo(String campo) {
    final dadosFormulario = {'email': _login, 'senha': _senha};
    final erro = validacao.validar(field: campo, input: dadosFormulario);
    switch (erro) {
      case ValidacaoErro.campoInvalido:
        return UIErro.campoInvalido;
      case ValidacaoErro.campoRequerido:
        return UIErro.campoRequerido;
      default:
        return null;
    }
  }

  void _validarFormulario() {
    bool estaValidoFormulario = _emailErro.value == null && _senhaErro.value == null && _login != null && _senha != null;
  }

  @override
  Future<void> autenticar() async {
    try {
      principalErro = null;
      estaCarregando = true;
      final conta = await login.login(AutenticacaoRequisicao(login: _login!, senha: _senha!));
      await salvarConta.salvar(conta);
      navegarPara = '/inicial';
    } on DominioErros catch (erro) {
      switch (erro) {
        case DominioErros.credenciaisInvalidas:
          principalErro = UIErro.credencialInvalida;
          break;
        default:
          principalErro = UIErro.inesperado;
          break;
      }
      estaCarregando = false;
    }
  }

  @override
  void validarLogin(String email) {
    _login = email;
    _emailErro.value = _validarCampo('email');
  }

  @override
  void validarSenha(String senha) {}

  @override
  Stream<bool?> get estaValidoFormularioStream => _estaValidoFormulario.stream;
}
