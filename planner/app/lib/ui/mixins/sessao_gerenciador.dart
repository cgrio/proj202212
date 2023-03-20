import 'package:get/get.dart';

mixin SessaoGerenciador {
  void handleSessionExpired(Stream<bool> stream) {
    stream.listen((isExpired) {
      if (isExpired == true) {
        Get.offAllNamed('/login');
      }
    });
  }
}