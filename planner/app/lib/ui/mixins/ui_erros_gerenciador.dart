import 'package:flutter/widgets.dart';

import '../componentes/exibir_mensagem_erro.dart';
import '../helpers/erros/ui_erros.dart';

mixin UIErrosGerenciador {
  void handleMainError(BuildContext context, Stream<UIErros?> stream) {
    stream.listen((event) {
      if (event != null) {
        exibirMensagemErro(context, event.descricao);
      }
    });
  }
}
