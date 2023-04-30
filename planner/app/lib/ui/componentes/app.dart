import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../paginas/autenticacao/login_pagina.dart';
import '../paginas/autenticacao/login_presenter.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginPresenter extends Mock implements LoginPresenter {}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final primaryColor = Color.fromRGBO(107, 191, 39, 1);
    final primaryColorDark = Color.fromRGBO(50, 98, 10, 1);
    final primaryColorLight = Color.fromRGBO(236, 247, 227, 1);
    final ButtonStyle themeButtomStyle = TextButton.styleFrom(
        surfaceTintColor: primaryColorDark,
        backgroundColor: primaryColor,
        foregroundColor: primaryColorLight,
        alignment: AlignmentGeometry.lerp(Alignment.bottomCenter, Alignment.center, 1),
        minimumSize: Size(88, 36),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColorDark));

    final ButtonStyle outlineButtomTheme = OutlinedButton.styleFrom(
        side: BorderSide(width: 2.0, color: primaryColor),
        surfaceTintColor: primaryColorDark,
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        alignment: AlignmentGeometry.lerp(Alignment.bottomCenter, Alignment.center, 1),
        minimumSize: Size(88, 36),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColorDark));

    final ButtonStyle elevatedButtomTheme = TextButton.styleFrom(
        surfaceTintColor: primaryColorDark,
        backgroundColor: primaryColor,
        foregroundColor: primaryColorLight,
        alignment: AlignmentGeometry.lerp(Alignment.bottomCenter, Alignment.center, 1),
        minimumSize: Size(88, 36),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: primaryColorDark));
    LoginPresenter presenter = MockLoginPresenter();
    return MaterialApp(
      title: "Planner",
      debugShowCheckedModeBanner: false,
      home: LoginPagina(presenter),
      theme: ThemeData(
          primaryColor: primaryColor,
          primaryColorDark: primaryColorDark,
          primaryColorLight: primaryColorLight,
          secondaryHeaderColor: primaryColor,
          backgroundColor: Colors.white,
          textTheme: TextTheme(headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: primaryColorDark)),
          inputDecorationTheme: InputDecorationTheme(
              iconColor: primaryColor,
              labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: primaryColor),
              alignLabelWithHint: true,
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColor)),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: primaryColorLight))),
          elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtomTheme),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: outlineButtomTheme,
          ),
          textButtonTheme: TextButtonThemeData(
            style: themeButtomStyle,
          )),
    );
  }
}
