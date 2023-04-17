import 'package:flutter/material.dart';

import '../paginas/autenticacao/login_pagina.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color.fromRGBO(107, 191, 39, 1);
    final primaryColorDark = Color.fromRGBO(50, 98, 10, 1);
    final primaryColorLight = Color.fromRGBO(236, 247, 227, 1);
    return MaterialApp(
      title: "Planner",
      debugShowCheckedModeBanner: false,
      home: LoginPagina(),
      theme: ThemeData(
          primaryColor: primaryColor,
          primaryColorDark: primaryColorDark,
          primaryColorLight: primaryColorLight,
          accentColor: primaryColor,
          backgroundColor: Colors.white),
    );
  }
}
