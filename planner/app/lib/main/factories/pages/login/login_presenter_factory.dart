import '../../../../presentation/presenters/getx_login_presenter.dart';
import '../../../../ui/paginas/autenticacao/login_presenter.dart';
import '../../casos_uso/login_factory.dart';
import '../../casos_uso/salvar_conta_local_factory.dart';
import 'login_validation_factory.dart';

LoginPresenter makeGetxLoginPresenter() =>
    GetxLoginPresenter(validacao: makeLoginValidation(), autenticacao: makeRemoteNodeLogin(), salvarContaAtual: makeLocalSalvarConta());
