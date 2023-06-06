// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../../presentation/protocols/validacao.dart';
import './../protocolos/campo_validacao.dart';

class CampoRequeridoValidador extends Equatable implements CampoValidacao {
  late final String campo;

  CampoRequeridoValidador({required this.campo});
  List get props => [campo];

  @override
  ValidacaoErro? validar(Map input) {
    input[campo]?.isNotEmpty == true ? null : ValidacaoErro.campoInvalido;
  }
}
