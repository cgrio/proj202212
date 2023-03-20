import '../../../auxiliares/auxiliares.dart';
import 'package:flutter/material.dart';

abstract class LoginPresenter implements Listenable {
  Stream<UIErro?> get emailErroStream;
  Stream<UIErro?> get senhaErroStream;
  Stream<UIErro?> get principalErroStream;
  Stream<String?> get navegarParaStream;
  Stream<bool> get estaValidoFormularioStream;
  Stream<bool> get estaCarregandoStream;

  void validarLogin(String email);
  void validarSenha(String senha);
  Future<void> autenticar();
  void irParaCadastroUsuario();
}
