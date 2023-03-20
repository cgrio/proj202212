import '../../../../dominio/auxiliares/dominio_erros.dart';
import '../../../../dominio/casos_uso/lembretes/obter_lembrete_casouso.dart';
import '../../../../dominio/entidades/lembretes/lembrete_entidade.dart';
import '../../../http/http_cliente.dart';
import '../../../http/http_erros.dart';
import '../../../models/remoto_node/lembrete/remoto_node_lembrete_modelo.dart';

class RemotoNodeObterLembreteCasoUso implements ObterLembreteCasoUso {
  final HttpCliente httpCliente;
  final String url;

  RemotoNodeObterLembreteCasoUso(this.httpCliente, this.url);

  @override
  Future<LembreteEntidade> obter({required String lembreteId}) async {
    try {
      return RemotoNodeLembreteModelo.fromJson(await httpCliente.requisicao(url: url, metodo: 'post')).toEntity();
    } on HttpErros catch (error) {
      throw error == HttpErros.proibido ? DominioErros.emailEmUso : DominioErros.inesperado;
    }
  }
}
