import 'package:app/ui/helpers/i18n/strings/traducao.dart';

class PtBr implements Traducao {
  @override
  String get msgCampoInvalido => 'Preenchimento incorreto';

  @override
  String get msgCampoRequerido => 'Preenchimento Obrigatório.';

  @override
  String get msgCredencialInvalida => 'Usuário ou senha invalálidos.';

  @override
  String get msgEmailEmUso => 'O e-mail já foi utilizado em uma conta.';

  @override
  String get msgErroInesperado => 'Erro inesperado contate e equipe do App.';

  @override
  String get msgCarregando => 'Carregando';
}
