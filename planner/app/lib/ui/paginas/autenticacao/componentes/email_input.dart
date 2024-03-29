import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_presenter.dart';

class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginPresenter presenter = Provider.of(context);
    return StreamBuilder<String?>(
        stream: presenter.emailErrorStream,
        builder: (context, snapshot) {
          return TextFormField(
            decoration:
                InputDecoration(labelText: 'Email', icon: Icon(Icons.email), errorText: snapshot.data?.isEmpty == true ? null : snapshot.data),
            keyboardType: TextInputType.emailAddress,
            onChanged: presenter.validarEmail,
          );
        });
  }
}
