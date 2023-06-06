// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import '../../presentation/protocols/validacao.dart';
import './../protocolos/campo_validacao.dart';

class TamanhoMinimoValidador extends Equatable implements CampoValidacao {
  @override
  late final String campo;
  late final int tamanho;
  TamanhoMinimoValidador({required this.campo, required this.tamanho});
  
  List get props => [campo, tamanho];

  @override
  ValidacaoErro? validar(Map input) {
    if (input[campo] != null) {
      int tamanhoCampo = input[campo].lenght as int;
      if (tamanhoCampo >= tamanho) {
        return null;
      }
    }
    return ValidacaoErro.campoInvalido;
  }
}
