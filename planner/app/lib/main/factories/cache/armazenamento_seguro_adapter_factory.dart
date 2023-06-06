import 'package:app/infra/cache/armazenamento_seguro_adaptador.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

ArmazenamentoSeguroAdaptador makeArmazenamentoSeguroAdapter() => ArmazenamentoSeguroAdaptador(secureStorage: FlutterSecureStorage());
