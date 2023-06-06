import 'package:app/data/http/http_cliente.dart';
import 'package:app/main/factories/cache/armazenamento_seguro_adapter_factory.dart';
import 'package:app/main/factories/http/http_cliente_factory.dart';

import '../../decorators/autorizador_http_cliente_decorador.dart';

HttpCliente makeAutorizadorHttpClienteDecorator() => AutorizadorHttpClienteDecorator(
    apagarCacheArmazenamentoSeguro: makeArmazenamentoSeguroAdapter(),
    httpclientedecorador: makeHttpAdapter(),
    obterCacheArmazenamentoSeguro: makeArmazenamentoSeguroAdapter());
