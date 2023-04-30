abstract class LoginPresenter {
  Stream<String?> get emailErrorStream;
  Stream<String?> get senhaErrorStream;
  Stream<bool> get formularioValidoStream;
  Stream<bool> get estaCarregandoStream;
  void validarEmail(String email);
  void validarSenha(String senha);
  void autenticacao();
}
