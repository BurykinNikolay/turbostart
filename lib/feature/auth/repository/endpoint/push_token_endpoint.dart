import 'package:turbostart/data/network/url/url_factory.dart';
import 'package:turbostart/data/network/url/urls.dart' as urls;
import 'package:turbostart/di/provider/store_provider.dart';

class PushTokenEndpoint implements Endpoint {
  final StoreProvider storeProvider;

  PushTokenEndpoint({this.storeProvider});

  String get apiUrl => storeProvider.store.state.apiUrl;

  @override
  Uri create() {
    var uri = Uri.https(apiUrl, urls.pushToken);
    return uri;
  }
}
