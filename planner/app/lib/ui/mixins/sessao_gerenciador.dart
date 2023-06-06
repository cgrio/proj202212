import 'package:get/get.dart';

mixin SessaoGerenciador {
  void handleSessionExpired(Stream<bool> stream) {
    stream.listen((estaExpirado) {
      if (estaExpirado == true) {
        Get.offAllNamed('/login');
      }
    });
  }
}
