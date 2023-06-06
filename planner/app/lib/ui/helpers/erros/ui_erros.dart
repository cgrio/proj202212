import '../i18n/recursos.dart';

enum UIErros { campoRequerido, campoInvalido, inesperado, credencialInvalida, emailEmUso }

extension UIErrosExtensao on UIErros {
  String get descricao {
    switch (this) {
      case UIErros.campoRequerido:
        return R.string.msgCampoRequerido;
      case UIErros.campoInvalido:
        return R.string.msgCampoInvalido;
      case UIErros.campoRequerido:
        return R.string.msgCampoInvalido;
      default:
        return 'Sem definição';
    }
  }
}
