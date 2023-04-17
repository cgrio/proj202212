import 'package:flutter/material.dart';

class LoginPagina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
