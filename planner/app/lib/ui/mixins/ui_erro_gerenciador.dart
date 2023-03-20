import '../auxiliares/erros/ui_erro.dart';

import 'package:flutter/material.dart';

import '../componentes/error_message.dart';

mixin UIErroGerenciador {
  void handleMainError(BuildContext context, Stream<UIErro?> stream) {
    stream.listen((error) {
      if (error != null) {
        showErrorMessage(context, error.descricao);
      }
    });
  }
}
