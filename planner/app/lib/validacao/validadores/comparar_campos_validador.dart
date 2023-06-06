// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/presentation/protocols/validacao.dart';
import 'package:equatable/equatable.dart';
import './../protocolos/campo_validacao.dart';

class CompararCamposValidador extends Equatable implements CampoValidacao {
  late final String campo;
  late final String campoParaComparar;
  CompararCamposValidador({
    required this.campo,
    required this.campoParaComparar,
  });
  List get props => [campo, campoParaComparar];

  @override
  ValidacaoErro? validar(Map input) {
    input[campo] != null && input[campoParaComparar] != null && input[campo] != input[campoParaComparar] ? ValidacaoErro.campoInvalido : null;
  }
}
