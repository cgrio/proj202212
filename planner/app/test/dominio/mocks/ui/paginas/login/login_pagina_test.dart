import 'dart:async';

import 'package:app/ui/paginas/autenticacao/login_pagina.dart';
import 'package:app/ui/paginas/autenticacao/login_presenter.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginPresenter extends Mock implements LoginPresenter {}

void main() {
  late LoginPresenter presenter;
  late StreamController<String?> emailErrosController;
  late StreamController<String?> senhaErrosController;
  late StreamController<bool> formularioValidoController;
  late StreamController<bool> estaCarregandoController;
  Future<void> carregarPagina(WidgetTester tester) async {
    presenter = MockLoginPresenter();

    emailErrosController = StreamController<String?>();
    senhaErrosController = StreamController<String?>();
    formularioValidoController = StreamController<bool>();
    estaCarregandoController = StreamController<bool>();

    when(() => presenter.emailErrorStream).thenAnswer((_) => emailErrosController.stream);
    when(() => presenter.senhaErrorStream).thenAnswer((_) => senhaErrosController.stream);

    when(() => presenter.formularioValidoStream).thenAnswer((_) => formularioValidoController.stream);
    when(() => presenter.estaCarregandoStream).thenAnswer((_) => estaCarregandoController.stream);

    final loginPagina = MaterialApp(home: LoginPagina(presenter));
    await tester.pumpWidget(loginPagina);
  }

  tearDown(() {
    emailErrosController.close();
    senhaErrosController.close();
    formularioValidoController.close();
  });

  testWidgets('Deve carregar com o estado inicial', (WidgetTester tester) async {
    await carregarPagina(tester);
    final campoEmailFilhos = find.descendant(of: find.bySemanticsLabel('Email'), matching: find.byType(Text));
    expect(campoEmailFilhos, findsOneWidget, reason: "Procura apenas um campo com label Email");
    expect(campoEmailFilhos.toString().indexOf('errorText'), isNegative, reason: "Verifico se os filhos não existem errorText");
    expect(campoEmailFilhos.toString().indexOf('textAlign'), isNonZero, reason: "Verifico se tem a propriedade textAlign");

    final campoSenhaFilhos = find.descendant(of: find.bySemanticsLabel('Senha'), matching: find.byType(Text));
    expect(campoSenhaFilhos, findsOneWidget, reason: "Procura apenas um campo com label Password");

    expect(campoSenhaFilhos.toString().indexOf('errorText'), isNegative, reason: "Verifico se os filhos não existem errorText");
    expect(campoSenhaFilhos.toString().indexOf('textAlign'), isNonZero, reason: "Verifico se tem a propriedade textAlign");

    final botaoLogin = tester.widget<TextButton>(find.byType(TextButton));

    expect(botaoLogin.enabled, false);
  });

  testWidgets('Testar validador de página', (WidgetTester tester) async {
    await carregarPagina(tester);
    final email = faker.internet.email();
    await tester.enterText(find.bySemanticsLabel('Email'), email);
    verify(() => presenter.validarEmail(email)).called(1);

    final senha = faker.internet.password();
    await tester.enterText(find.bySemanticsLabel('Senha'), senha);
    verify(() => presenter.validarSenha(senha)).called(1);
  });

  testWidgets('Deve retornar se o email esta inválido', (WidgetTester tester) async {
    await carregarPagina(tester);
    emailErrosController.add('any error');
    await tester.pump(); //atualiza a tela
    expect(find.text('any error'), findsOneWidget);
  });

  testWidgets('Deve retornar o email válido', (WidgetTester tester) async {
    await carregarPagina(tester);
    emailErrosController.add(null);
    await tester.pump(); //atualiza a tela
  });

  testWidgets('Deve chamar autenticação ao submeter o formulário', (WidgetTester tester) async {
    await carregarPagina(tester);
    formularioValidoController.add(true);
    await tester.pump();
    await tester.tap(find.byType(TextButton));
    await tester.pump();

    expect(
      () async => presenter.autenticacao(),
      isA<void>(),
    );
    //atualiza a tela
  });

  testWidgets('Deve chamar loading ', (WidgetTester tester) async {
    await carregarPagina(tester);
    estaCarregandoController.add(true);
    await tester.pump();
    await tester.tap(find.byType(TextButton));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    //atualiza a tela
  });
  //tesatr botao valido 30 minutos do video 019
}
