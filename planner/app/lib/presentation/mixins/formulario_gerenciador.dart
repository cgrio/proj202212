import 'package:get/get.dart';

mixin FormularioGerenciador on GetxController {
  final _estaValidoFormulario = false.obs;

  Stream<bool> get formularioValidoStream => _estaValidoFormulario.stream;
  
  set estaValidoFormulario(bool valor) => _estaValidoFormulario.value = valor;
}
