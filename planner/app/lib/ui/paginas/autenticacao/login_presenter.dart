abstract class LoginPresenter {
  Stream<String?> get emailErrorStream;
  Stream<String?> get senhaErrorStream;
  Stream<bool> get formularioValidoStream;
  Stream<bool> get estaCarregandoStream;
  Stream<String?> get erroGeralStream;
  void validarEmail(String email);
  void validarSenha(String senha);
  Future<void> autenticacao();
  void dispose();
}
