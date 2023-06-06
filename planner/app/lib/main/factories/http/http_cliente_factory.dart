import 'package:http/http.dart';

import '../../../data/http/http_cliente.dart';
import 'package:app/infra/http/http_adaptador.dart';

HttpCliente makeHttpAdapter() => HttpAdaptador(Client());
