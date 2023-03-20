import 'package:get/get.dart';

mixin SessaoGerenciador on GetxController {
  final _sessaoEstaExpirada = false.obs;
  Stream<bool> get sessaoEstaExpiradaStream => _sessaoEstaExpirada.stream;
  set sessaoEstaExpirada(bool value) => _sessaoEstaExpirada.value = value;
}
