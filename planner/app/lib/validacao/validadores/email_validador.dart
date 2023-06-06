// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import '../../presentation/protocols/validacao.dart';
import './../protocolos/campo_validacao.dart';

class EmailValidador extends Equatable implements CampoValidacao {
  late final String campo;
  EmailValidador({required this.campo});
  List get props => [campo];

  @override
  ValidacaoErro? validar(Map input) {
    final regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    final isValid = input[campo]?.isNotEmpty != true || regex.hasMatch(input[campo] as String);
    return isValid ? null : ValidacaoErro.campoInvalido;
  }
}
