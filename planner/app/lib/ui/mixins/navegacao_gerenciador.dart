import 'package:get/get.dart';

mixin NavegacaoGerenciador {
  void handleNavigation(Stream<String?> stream, {bool clear = false}) {
    stream.listen((pagina) {
      if (pagina != null && pagina.isNotEmpty) {
        if (clear == true) {
          Get.offAllNamed(pagina);
        } else {
          Get.toNamed(pagina);
        }
      }
    });
  }
}
