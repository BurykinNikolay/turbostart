import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:turbostart/domain/domain.dart';
import 'package:turbostart/feature/logger/logger.dart';

class DbStorage {
  final String _applicationDocumentsDirectory;
  static const _systemBoxName = "sys";

  static const _appStateBoxName = "appPersistent";

  static const _keyPersistentAppState = "${_appStateBoxName}_appStateKey";

  static const _lastUpdateDateFieldName = "lastUpdateDateField";

  // ignore: unused_field
  bool _initialized = false;

  Box _systemBox;

  DbStorage(this._applicationDocumentsDirectory);

  Future<DateTime> get lastSyncDate async {
    return (await this._getSystemBox()).get(_lastUpdateDateFieldName) as DateTime;
  }

  Future<Box> _getSystemBox() async {
    if (_systemBox == null) {
      var box = await Hive.openBox(_systemBoxName);
      this._systemBox = box;
    }
    return this._systemBox;
  }

  //box to store all app persistent data like settings and state
  Future<Box<dynamic>> _getPersistentBox() async => await Hive.openBox(_appStateBoxName);

  /// initializes db storage
  Future<void> init() async {
    this._registerAdapters();

    await Hive.init(this._applicationDocumentsDirectory);
    this._initialized = true;
  }

  void _registerAdapters() {}

  //closes all boxes
  Future<void> dispose() async {
    await Hive.close();
  }

  Future<void> saveAppState(AppState state) async {
    final appStateBox = this._getPersistentBox();

    final serializedAppstate = state.toJson();
    await (await appStateBox).put(_keyPersistentAppState, serializedAppstate);
  }

  Future<AppState> getAppState(AppState defaultAppState) async {
    final appStateBox = await this._getPersistentBox();

    final serializedSavedAppState = appStateBox.get(_keyPersistentAppState, defaultValue: defaultAppState.toJson());

    //in case if deserialization fails just return the default state
    try {
      final AppState appState = AppState.fromJson(
        Map<String, dynamic>.from(serializedSavedAppState),
      );
      final lastSync = await lastSyncDate;

      return appState.rebuild((builder) => builder..navigationState.rootNavigatorKey = GlobalKey<NavigatorState>());
    } catch (e) {
      logger.e(e);
      return defaultAppState;
    }
  }

  ///removes everything
  Future<void> clear() async {
    await this._systemBox.clear();
  }

  Future<void> updateSyncDate(DateTime date) async {
    await (await this._getSystemBox()).put(_lastUpdateDateFieldName, date);
  }
}
