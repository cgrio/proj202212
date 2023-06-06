import 'package:app/presentation/protocols/validacao.dart';

abstract class CampoValidacao {
  String get campo;
  ValidacaoErro? validar(Map input);
}
