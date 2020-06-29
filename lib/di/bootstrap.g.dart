// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bootstrap.dart';

// **************************************************************************
// BootstrapperGenerator
// **************************************************************************

class _AppBootstrapper extends AppBootstrapper {
  Container base() {
    final container = Container();
    return container;
  }

  Container production() {
    final container = this.base();
    container.register<LoginEpic>((c) => LoginEpic(c.get<LoginRepository>()),
        defaultMode: InjectMode.unspecified);
    container.register<AuthInterceptor>((c) => AuthInterceptor(),
        defaultMode: InjectMode.unspecified);
    container.register<Client>((c) => Client(),
        defaultMode: InjectMode.unspecified);
    container.register<RestService>((c) => RestServiceImpl(c.get<Client>()),
        defaultMode: InjectMode.unspecified);
    container.register<UrlFactory>((c) => UrlAbstractFactory(),
        defaultMode: InjectMode.unspecified);
    container.register<StoreProvider>((c) => StoreProviderImpl(),
        defaultMode: InjectMode.unspecified);
    container.register<LocalizationProvider>((c) => LocalizationProviderImpl(),
        defaultMode: InjectMode.unspecified);
    container.register<LoginRepository>(
        (c) => LoginRepositoryImpl(
            c.get<StoreProvider>(), c.get<RestService>(), c.get<UrlFactory>()),
        defaultMode: InjectMode.unspecified);
    return container;
  }
}

class AppBootstrapperBuilder {
  static final _AppBootstrapper instance = build();

  static _AppBootstrapper build() {
    return new _AppBootstrapper();
  }
}
