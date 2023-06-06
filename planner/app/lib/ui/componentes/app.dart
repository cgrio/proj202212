import 'package:app/ui/componentes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../main/factories/pages/login/login_page_factory.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    

    return GetMaterialApp(
      title: "Planner",
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
//  GetPage(name: '/', page: makeSplashPage, transition: Transition.fade),
        GetPage(name: '/login', page: makeLoginPage, transition: Transition.fadeIn),
      ],
      theme: makeAppTheme(),
    );
  }
}
