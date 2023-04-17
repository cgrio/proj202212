import 'package:flutter/material.dart';

class LoginPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 240,
                margin: EdgeInsets.only(bottom: 32),
                decoration: BoxDecoration(
                    gradient: LinearGradient(

                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft
                    ,colors: [
                        Theme.of(context).primaryColorLight,
                         Theme.of(context).primaryColor,
                          Theme.of(context).primaryColorDark,
                    ]
                    ))
                ),
              child: Image(image: AssetImage('lib/assets/planner_icone.png')),
            ),
            Text("Login".toUpperCase()),
            Form(
                child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'email', icon: Icon(Icons.email)),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'password', icon: Icon(Icons.lock)),
                  obscureText: true,
                ),
                ElevatedButton(
                  child: Text("Login".toUpperCase()),
                  onPressed: () {},
                ),
                OutlinedButton(onPressed: () {}, child: Text("Criar Conta"))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
