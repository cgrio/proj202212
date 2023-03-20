import 'dart:io';

import 'package:app/dominio/casos_uso/lembretes/apagar_lembrete_casouso.dart';

import '../../../../dominio/auxiliares/dominio_erros.dart';
import '../../../http/http_cliente.dart';
import '../../../http/http_erros.dart';

class RemotoNodeApagarLembreteCasoUso implements ApagarLembreteCasoUso {
  final HttpCliente httpCliente;
  final String url;

  RemotoNodeApagarLembreteCasoUso(this.httpCliente, this.url);
  @override
  Future<bool> apagar({required String lembreteId}) async {
    try {
      Map<String, dynamic> requisicao = await httpCliente.requisicao(url: url, metodo: 'delete', corpo: {'lembreteId': lembreteId});
      return requisicao.isNotEmpty;
    } on HttpErros catch (error) {
      throw error == HttpErros.proibido ? DominioErros.emailEmUso : DominioErros.inesperado;
    }
  }
}
