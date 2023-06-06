import 'package:app/ui/componentes/carregamento_dialogo.dart';
import 'package:flutter/material.dart';

mixin CarregamentoGerenciador {
  void handleLoading(BuildContext context, Stream<bool> stream) {
    stream.listen((isLoading) async {
      if (isLoading == true) {
        await exibirDialogoCarregamento(context);
      } else {
        esconderDialogoCarregamento(context);
      }
    });
  }
}
