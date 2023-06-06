// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app/data/http/http.dart';

import '../../data/cache/apagar_armazenamento_cache_seguro.dart';
import '../../data/cache/obter_armazenamento_cache_seguro.dart';

class AutorizadorHttpClienteDecorator implements HttpCliente {
  late final ObterArmazenamentoSeguroCache obterCacheArmazenamentoSeguro;
  late final ApagarArmazenamentoSeguroCache apagarCacheArmazenamentoSeguro;
  late final HttpCliente httpclientedecorador;
  AutorizadorHttpClienteDecorator({
    required this.obterCacheArmazenamentoSeguro,
    required this.apagarCacheArmazenamentoSeguro,
    required this.httpclientedecorador,
  });

  @override
  Future<Map<String, dynamic>> requisicao({required String url, required String metodo, Map? corpo, Map? cabecalho}) async {
    try {
      final token = await obterCacheArmazenamentoSeguro.obter('token');
      final autorizacaoCabecalho = cabecalho ?? {}
        ..addAll({'x-access-token': token});
      return await httpclientedecorador.requisicao(url: url, metodo: metodo, corpo: corpo, cabecalho: autorizacaoCabecalho);
    } catch (error) {
      if (error is HttpErros && error != HttpErros.proibido) {
        rethrow;
      } else {
        await apagarCacheArmazenamentoSeguro.apagar('token');
        throw HttpErros.proibido;
      }
    }
  }
}
