import 'package:app/ui/helpers/erros/ui_erros.dart';

import 'package:get/get.dart';

mixin UIErrosGerenciador on GetxController {
  final _mainError = Rx<UIErros?>(null);
  Stream<UIErros?> get erroGeralStream => _mainError.stream;
  set mainError(UIErros? value) => _mainError.value = value;
}
