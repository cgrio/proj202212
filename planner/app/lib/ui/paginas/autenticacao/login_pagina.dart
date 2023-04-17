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
                  gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [
                    Theme.of(context).primaryColorLight,
                    Theme.of(context).primaryColor,
                    Theme.of(context).primaryColorDark,
                  ]),
                  boxShadow: [
                    BoxShadow(offset: Offset(0, 0), spreadRadius: 0, blurRadius: 4, color: Colors.black),
                    BoxShadow(offset: Offset(-10, 0), spreadRadius: 0, blurRadius: 14, color: Theme.of(context).primaryColor)
                  ],
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80))),
              child: Image(image: AssetImage('lib/assets/planner_icone.png')),
            ),
            Text(
              "Login".toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'email', icon: Icon(Icons.email)),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'password', icon: Icon(Icons.lock)),
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: Text(
                      "Login".toUpperCase(),
                    ),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(onPressed: () {}, child: Text("Criar Conta")),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
