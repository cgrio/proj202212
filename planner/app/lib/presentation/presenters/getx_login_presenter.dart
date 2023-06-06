import '../../domain/auxiliares/dominio_erros.dart';
import '../../domain/casos_uso/autenticacao/login_casouso.dart';
import '../../domain/casos_uso/autenticacao/salvar_conta_casouso.dart';
import '../../ui/helpers/erros/ui_erros.dart';
import '../mixins/carregamento_gerenciador.dart';
import '../mixins/formulario_gerenciador.dart';
import '../mixins/navegacao_gerenciador.dart';
import '../mixins/uierros_gerenciador.dart';
import '../../ui/paginas/autenticacao/login_presenter.dart';

import 'package:get/get.dart';

import '../protocols/validacao.dart';

class GetxLoginPresenter extends GetxController
    with CarregamentoGerenciador, NavegacaoGerenciador, FormularioGerenciador, UIErrosGerenciador
    implements LoginPresenter {
  late final Validacao validacao;
  late final LoginCasoUso autenticacao;
  late final SalvarContaCasoUso salvarContaAtual;

  final _emailErro = Rx<UIErros?>(null);
  final _senhaErro = Rx<UIErros?>(null);

  String? _email;
  String? _senha;

  @override
  Stream<UIErros?> get senhaErrorStream => _senhaErro.stream;

  @override
  Stream<UIErros?> get emailErrorStream => _emailErro.stream;

  GetxLoginPresenter({
    required this.validacao,
    required this.autenticacao,
    required this.salvarContaAtual,
  });
  UIErros? _validarCampo(String campo) {
    final dadosForm = {'email': _email, 'senha': _senha};

    final erros = validacao.validar(field: campo, input: dadosForm);
    switch (erros) {
      case ValidacaoErro.campoInvalido:
        return UIErros.campoInvalido;
      case ValidacaoErro.campoRequerido:
        return UIErros.campoRequerido;
      default:
        return null;
    }
  }

  void _validarForm() {
    estaValidoFormulario = _emailErro.value == null && _senhaErro.value == null && _email != null && _senha != null;
  }

  @override
  void irParaCadastro() {
    navigateTo = '/cadastro';
  }

  @override
  void validarEmail(String email) {
    _email = email;
    _emailErro.value = _validarCampo('email');
    _validarForm();
  }

  @override
  void validarSenha(String senha) {
    _senha = senha;
    _senhaErro.value = _validarCampo('senha');
    _validarForm();
  }

  @override
  void login() async {
    var geralErro = null;
    var estaCarregando = true;
    try {
      final conta = await autenticacao.login(AutenticacaoRequisicao(login: _email!, senha: _senha!));
      await salvarContaAtual.salvar(conta);
    } on DominioErros catch (erro) {
      switch (erro) {
        case DominioErros.credenciaisInvalidas:
          geralErro = UIErros.credencialInvalida;
          break;
        default:
          geralErro = UIErros.inesperado;
          break;
      }
      estaCarregando = false;
    }
  }
}
