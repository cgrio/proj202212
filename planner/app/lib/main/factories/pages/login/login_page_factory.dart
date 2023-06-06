import 'package:app/ui/paginas/autenticacao/login_pagina.dart';
import 'package:flutter/material.dart';

import 'login_presenter_factory.dart';

Widget makeLoginPage() => LoginPagina(makeGetxLoginPresenter());
