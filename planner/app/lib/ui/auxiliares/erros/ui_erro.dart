import '../auxiliares.dart';

enum UIErro { campoRequerido, campoInvalido, inesperado, credencialInvalida, emailEmUso }

extension UIErroExtensao on UIErro {
  String get descricao {
    switch (this) {
      case UIErro.campoRequerido:
        return R.string.campoRequeridoMensagem;
      case UIErro.campoInvalido:
        return R.string.campoInvalidoMensagem;
      case UIErro.inesperado:
        return R.string.inesperadoMensagem;
      case UIErro.credencialInvalida:
        return R.string.credencialInvalidaMensagem;
      case UIErro.emailEmUso:
        return R.string.emailEmUsoMensagem;
    }
  }
}
