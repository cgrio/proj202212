import 'package:get/get.dart';

mixin CarregamentoGerenciador on GetxController {
  final _estaCarregando = false.obs;
  Stream<bool> get estaCarregandoStream => _estaCarregando.stream;

  set estaCarregando(bool valor) => _estaCarregando.value = valor;
}
