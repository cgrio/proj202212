import 'dart:developer';

import 'package:app/ui/paginas/autenticacao/login_pagina.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  Future<void> carregarPagina(WidgetTester tester) async {
    final loginPagina = MaterialApp(home: LoginPagina());
    await tester.pumpWidget(loginPagina);
  }

  testWidgets('Deve carregar com o estado inicial', (WidgetTester tester) async {
    await carregarPagina(tester);
    final campoEmailFilhos = find.descendant(of: find.bySemanticsLabel('Email'), matching: find.byType(Text));
    expect(campoEmailFilhos, findsOneWidget, reason: "Procura apenas um campo com label Email");
    expect(campoEmailFilhos.toString().indexOf('errorText'), isNegative, reason: "Verifico se os filhos não existem errorText");
    expect(campoEmailFilhos.toString().indexOf('textAlign'), isNonZero, reason: "Verifico se tem a propriedade textAlign");

    final campoSenhaFilhos = find.descendant(of: find.bySemanticsLabel('Password'), matching: find.byType(Text));
    expect(campoSenhaFilhos, findsOneWidget, reason: "Procura apenas um campo com label Password");

    expect(campoSenhaFilhos.toString().indexOf('errorText'), isNegative, reason: "Verifico se os filhos não existem errorText");
    expect(campoSenhaFilhos.toString().indexOf('textAlign'), isNonZero, reason: "Verifico se tem a propriedade textAlign");

    final botaoLogin = tester.widget<TextButton>(find.byType(TextButton));

    expect(botaoLogin.onPressed, isNotNull);
  });

  testWidgets('Testar validador de página', (WidgetTester tester) async {
    await carregarPagina(tester);
    final campoEmailFilhos = find.descendant(of: find.bySemanticsLabel('Email'), matching: find.byType(Text));
    expect(campoEmailFilhos, findsOneWidget, reason: "Procura apenas um campo com label Email");
    expect(campoEmailFilhos.toString().indexOf('errorText'), isNegative, reason: "Verifico se os filhos não existem errorText");
    expect(campoEmailFilhos.toString().indexOf('textAlign'), isNonZero, reason: "Verifico se tem a propriedade textAlign");
  });
}
