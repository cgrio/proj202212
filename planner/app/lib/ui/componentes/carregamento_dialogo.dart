import 'package:flutter/material.dart';

import '../helpers/i18n/recursos.dart';

Future<void> exibirDialogoCarregamento(BuildContext context) async {
  await Future.delayed(Duration.zero);
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => SimpleDialog(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text(R.string.msgCarregando, textAlign: TextAlign.center),
          ],
        ),
      ],
    ),
  );
}

void esconderDialogoCarregamento(BuildContext context) {
  if (Navigator.canPop(context)) {
    Navigator.of(context).pop();
  }
}
