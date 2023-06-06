
import 'package:flutter/material.dart';

import '../../mixins/carregamento_gerenciador.dart';
import '../../mixins/navegacao_gerenciador.dart';
import '../../mixins/teclado_gerenciador.dart';
import '../../mixins/ui_erros_gerenciador.dart';
import 'login_presenter.dart';

class LoginPagina extends StatelessWidget with TecladoGerenciador, CarregamentoGerenciador, UIErrosGerenciador, NavegacaoGerenciador {
  late final LoginPresenter presenter;

  LoginPagina(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          handleLoading(context, presenter.estaCarregandoStream);
          handleMainError(context, presenter.erroGeralStream);
          handleNavigation(presenter.navigateToStream, clear: true);
        },
      ),
    );
  }
}
