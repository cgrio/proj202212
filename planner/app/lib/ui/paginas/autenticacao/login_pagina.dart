import 'package:flutter/material.dart';

import 'componentes/login_cabecalho.dart';
import 'login_presenter.dart';

class LoginPagina extends StatelessWidget {
  final LoginPresenter presenter;
  LoginPagina(this.presenter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      presenter.estaCarregandoStream.listen((estaCarregando) {
        if (estaCarregando) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return WdDialogoCarregando();
              });
        }
      });
      return WdFormLogin(presenter: presenter);
    }));
  }
}

class WdDialogoCarregando extends StatelessWidget {
  const WdDialogoCarregando({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 10,
            ),
            Text(
              ' Aguarde',
              textAlign: TextAlign.center,
            )
          ],
        )
      ],
    );
  }
}

class WdFormLogin extends StatelessWidget {
  const WdFormLogin({
    super.key,
    required this.presenter,
  });

  final LoginPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LoginCabecalho(),
          Text(
            "Login".toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
          Form(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StreamBuilder<String?>(
                  stream: presenter.emailErrorStream,
                  builder: (context, snapshot) {
                    return TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email', icon: Icon(Icons.email), errorText: snapshot.data?.isEmpty == true ? null : snapshot.data),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: presenter.validarEmail,
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: StreamBuilder<String?>(
                    stream: presenter.senhaErrorStream,
                    builder: (context, snapshot) {
                      return TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Senha', icon: Icon(Icons.lock), errorText: snapshot.data?.isEmpty == true ? null : snapshot.data),
                        obscureText: true,
                        onChanged: presenter.validarSenha,
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: StreamBuilder<bool>(
                    stream: presenter.formularioValidoStream,
                    builder: (context, snapshot) {
                      return TextButton(
                        child: Text(
                          "Login".toUpperCase(),
                        ),
                        onPressed: snapshot.data == true ? presenter.autenticacao : null,
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(onPressed: () {}, child: Text("Criar Conta".toUpperCase())),
              )
            ],
          ))
        ],
      ),
    );
  }
}
