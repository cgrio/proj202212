import 'package:app/data/casos_uso/remoto_node/autenticacao/remoto_node_salvar_conta_casouso.dart';
import 'package:app/domain/casos_uso/autenticacao/salvar_conta_casouso.dart';
import 'package:app/main/factories/http/api_url_factory.dart';
import 'package:app/main/factories/http/http_cliente_factory.dart';

SalvarContaCasoUso makeRemoteSalvarConta() => RemotoNodeSalvarContaCasoUso(httpCliente: makeHttpAdapter(), url: makeApiUrl('cadastro'));
