import 'package:flutter/material.dart';

class CampoTextoWidget extends StatelessWidget {
  final Object presenter;
  final String label;
  final String icone;
  final Color cor;
  final Stream erroStreamer;
  final Stream mudancaPresenter;
  final String erroMensagem;
  final TextInputType teclado;

  const CampoTextoWidget({
    Key? key,
    required this.presenter,
    required this.label,
    required this.icone,
    required this.cor,
    required this.erroStreamer,
    required this.erroMensagem,
    required this.teclado,
    required this.mudancaPresenter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
