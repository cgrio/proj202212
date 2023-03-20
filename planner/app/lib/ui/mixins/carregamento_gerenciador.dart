import 'package:flutter/material.dart';

import '../componentes/components.dart';

mixin CarregamentoGerenciador {
  void handleLoading(BuildContext context, Stream<bool> stream) {
    stream.listen((isLoading) async {
      if (isLoading == true) {
        await showLoading(context);
      } else {
        hideLoading(context);
      }
    });
  }
}
