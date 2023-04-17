import 'package:flutter/material.dart';

import '../paginas/autenticacao/login_pagina.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Planner",
      debugShowCheckedModeBanner: false,
      home: LoginPagina(),
    );
  }
}
