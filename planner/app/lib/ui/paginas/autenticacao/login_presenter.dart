import 'package:app/ui/helpers/erros/ui_erros.dart';

abstract class LoginPresenter {
  Stream<UIErros?> get emailErrorStream;
  Stream<UIErros?> get senhaErrorStream;
  Stream<UIErros?> get erroGeralStream;
  Stream<String?> get navegarParaStream;
  Stream<bool> get formularioValidoStream;
  Stream<bool> get estaCarregandoStream;
  void validarEmail(String email);
  void validarSenha(String senha);
  void login();
  void irParaCadastro();
}
