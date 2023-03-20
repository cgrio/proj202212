import 'package:get/get.dart';

import '../../ui/auxiliares/auxiliares.dart';

mixin UIErrosGerenciador on GetxController {
  final _principalErro = Rx<UIErro?>(null);
  Stream<UIErro?> get principalErroStream => _principalErro.stream;
  set principalErro(UIErro? value) => _principalErro.value = value;
}
