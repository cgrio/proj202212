import 'package:get/get.dart';

mixin NavegacaoGerenciador on GetxController {
  final _navegarPara = Rx<String?>(null);
  Stream<String?> get navegarParaStream => _navegarPara.stream;
  set navegarPara(String value) => _navegarPara.subject.add(value);
}
