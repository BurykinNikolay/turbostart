import 'package:dioc/dioc.dart';

import 'package:http/http.dart';
import 'package:turbostart/data/network/service/interceptor/auth_interceptor.dart';
import 'package:turbostart/data/network/service/rest_service.dart';
import 'package:turbostart/data/network/url/url_factory.dart';
import 'package:turbostart/feature/auth/domain/middleware/epics/login_epic.dart';
import 'package:turbostart/feature/auth/repository/login_repository.dart';
import 'package:turbostart/feature/health/health.dart';

import 'provider/localization_provider.dart';
import 'provider/store_provider.dart';

part 'bootstrap.g.dart';

@bootstrapper
abstract class AppBootstrapper extends Bootstrapper {
  @Provide(LoginEpic, LoginEpic)
  @Provide(SendStepsEpic, SendStepsEpic)
  @Provide(GetStepsEpic, GetStepsEpic)
  @Provide(AuthInterceptor, AuthInterceptor)
  @Provide(Client, Client, defaultMode: InjectMode.singleton)
  @Provide(RestService, RestServiceImpl, defaultMode: InjectMode.singleton)
  @Provide(UrlFactory, UrlAbstractFactory, defaultMode: InjectMode.singleton)
  @Provide(StoreProvider, StoreProviderImpl, defaultMode: InjectMode.singleton)
  @Provide(LocalizationProvider, LocalizationProviderImpl, defaultMode: InjectMode.singleton)
  @Provide(LoginRepository, LoginRepositoryImpl, defaultMode: InjectMode.singleton)
  @Provide(HealthRepository, HealthRepositoryImpl, defaultMode: InjectMode.singleton)
  Container production();
}
