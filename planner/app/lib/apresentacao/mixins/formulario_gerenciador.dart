import 'package:get/get.dart';

mixin FormularioGerenciador on GetxController {
  final _formularioEstaValido = false.obs;
  Stream<bool> get formularioEstaValidoStream => _formularioEstaValido.stream;
  set formularioEstaValido(bool value) => _formularioEstaValido.value = value;
}
