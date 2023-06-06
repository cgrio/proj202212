import 'package:app/domain/casos_uso/autenticacao/login_casouso.dart';
import 'package:app/main/factories/http/api_url_factory.dart';
import 'package:app/main/factories/http/http_cliente_factory.dart';

import '../../../data/casos_uso/remoto_node/autenticacao/remoto_node_login_casouso.dart';

LoginCasoUso makeRemoteNodeLogin() => RemotoNodeLoginCasoUso(httpCliente: makeHttpAdapter(), url: makeApiUrl('login'));
