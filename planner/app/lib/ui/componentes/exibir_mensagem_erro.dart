import 'package:flutter/material.dart';

void exibirMensagemErro(BuildContext context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red[900],
      content: Text(error, textAlign: TextAlign.center),
    )
  );
}