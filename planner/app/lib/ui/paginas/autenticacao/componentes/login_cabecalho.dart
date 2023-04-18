
import 'package:flutter/material.dart';

class LoginCabecalho extends StatelessWidget {
  const LoginCabecalho({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Image(
          height: 20,
          width: 20,
          image: AssetImage(
            'lib/assets/planner_icone.png',
          ),
        ),
      ),
    );
  }
}
