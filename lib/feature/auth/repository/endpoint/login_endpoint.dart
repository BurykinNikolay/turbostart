import 'package:turbostart/data/network/url/url_factory.dart';
import 'package:turbostart/data/network/url/urls.dart' as urls;
import 'package:turbostart/di/provider/store_provider.dart';

class LoginEndpoint implements Endpoint {
  final StoreProvider storeProvider;

  LoginEndpoint({this.storeProvider});

  String get apiUrl => storeProvider.store.state.apiUrl;

  @override
  Uri create() {
    //  final queryParameters = {"email": email, "password": password};
    var uri = Uri.https(apiUrl, urls.login);
    return uri;
  }
}
