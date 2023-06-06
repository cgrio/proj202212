import 'package:flutter/material.dart';

mixin TecladoGerenciador {
  void esconderTeclado(BuildContext context) {
    final focoAtual = FocusScope.of(context);
    if (!focoAtual.hasPrimaryFocus) {
      focoAtual.unfocus();
    }
  }
}
