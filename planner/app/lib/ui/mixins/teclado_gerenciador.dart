import 'package:flutter/material.dart';

mixin TecladoGerenciador {
  void esconderTeclado(BuildContext context) {
    final focoCorreto = FocusScope.of(context);
    if (!focoCorreto.hasPrimaryFocus) {
      focoCorreto.unfocus();
    }
  }
}
