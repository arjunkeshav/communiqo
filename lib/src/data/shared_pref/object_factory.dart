
import 'package:communiqo/src/data/client/client.dart';
import 'package:communiqo/src/data/repository/repository.dart';
import 'package:communiqo/src/data/shared_pref/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// it is a hub that connecting pref,repo,client
/// used to reduce imports in pages
class ObjectFactory {
  static final _objectFactory = ObjectFactory._internal();

  ObjectFactory._internal();

  factory ObjectFactory() => _objectFactory;

  ///Initialisation of Objects
  Prefs _prefs = Prefs();
  ApiClient _apiClient = ApiClient();
  Repository _repository = Repository();

  ///
  /// Getters of Objects
  ///
  ApiClient get apiClient => _apiClient;

  Prefs get prefs => _prefs;

  Repository get repository => _repository;

  ///
  /// Setters of Objects
  ///
  void setPrefs(SharedPreferences sharedPreferences) {
    _prefs.sharedPreferences = sharedPreferences;
  }
}
