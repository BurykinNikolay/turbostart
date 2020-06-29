import 'package:turbostart/app_starter.dart' as starter;

import 'db_storage.dart';

abstract class DbStorageProvider {
  DbStorage get dbStorage;
}

class DbStorageProviderImpl implements DbStorageProvider {
  @override
  DbStorage get dbStorage => starter.dbStorage;
}
