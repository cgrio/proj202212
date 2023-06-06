import 'package:app/infra/cache/armazenamento_local_adaptador.dart';
import 'package:localstorage/localstorage.dart';

ArmazenamentoLocalAdaptador makeArmazenamentoLocalAdapterFactory() => ArmazenamentoLocalAdaptador(localStorage: LocalStorage('planner'));
