import 'package:get/get.dart';

mixin SessoaGerenciador on GetxController {
  final _sessaoEstaExpirada = false.obs;
  Stream<bool> get sessaoEstaExpiradaStream => _sessaoEstaExpirada.stream;
  set sessaoEstaExpirada(bool valor) => _sessaoEstaExpirada.value = valor;
}
