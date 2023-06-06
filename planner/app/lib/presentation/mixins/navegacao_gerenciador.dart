import 'package:get/get.dart';

mixin NavegacaoGerenciador on GetxController {
  final _navigateTo = Rx<String?>(null);
  Stream<String?> get navegarParaStream => _navigateTo.stream;
  set navigateTo(String value) => _navigateTo.subject.add(value);
}
