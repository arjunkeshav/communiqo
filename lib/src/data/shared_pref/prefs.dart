import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// shared preference storage
class Prefs {
  JsonCodec codec = new JsonCodec();
  SharedPreferences? _sharedPreferences;

  static const String? _AUTH_TOKEN = "auth_token";
  static const String? _USER_ID = "user_id";
  static const String? _LAYOUT_ID = "layout_id";
  static const String? _COMPARE_CATEGORY_ID = "compare_category_id";
  static const String? _CUSTOMER_NOTE = "customer_note";
  static const String? _SORT_ID = "sort_id";
  static const String? _FILTER_CATEGORY_ID = "filter_category_id";
  static const String? _FCM_TOKEN = "fcm_token";

  static const String? _IS_LOGGED_IN = "is_logged_in";





  Prefs();

  set sharedPreferences(SharedPreferences value) {
    _sharedPreferences = value;
  }

  ///saving  the auth token as a String
  void setAuthToken({String? token}) {
    _sharedPreferences!.setString(_AUTH_TOKEN!, "Token " + token!);
  }

  ///get method  for auth token
  String? getAuthToken() => _sharedPreferences?.getString(_AUTH_TOKEN!);

  ///saving  the auth token as a String
  void setUserId({String? userId}) {
    _sharedPreferences!.setString(_USER_ID!, userId!);
  }

  ///get method  for auth token
  String? getUserId() => _sharedPreferences!.getString(_USER_ID!);

  ///saving  layout id
  void saveLayoutId({String? layoutId}) {
    _sharedPreferences!.setString(_LAYOUT_ID!, layoutId!);
  }

  ///get method  layout id
  String? getLayoutId() => _sharedPreferences!.getString(_LAYOUT_ID!);

  ///saving  layout id
  void saveCompareCategoryId({String? categoryId}) {
    _sharedPreferences!.setString(_COMPARE_CATEGORY_ID!, categoryId!);
  }

  ///get method  for auth token
  String? getCompareCategoryId() =>
      _sharedPreferences!.getString(_COMPARE_CATEGORY_ID!);

  ///saving  layout id
  void saveCustomerNote({String? customerNote}) {
    _sharedPreferences!.setString(_CUSTOMER_NOTE!, customerNote!);
  }

  ///get method  for auth token
  String? getCustomerNote() => _sharedPreferences!.getString(_CUSTOMER_NOTE!);

  ///saving  layout id
  void saveSortId({String? sortId}) {
    _sharedPreferences!.setString(_SORT_ID!, sortId!);
  }

  ///get method  for auth token
  String? getSortId() => _sharedPreferences!.getString(_SORT_ID!);

  ///saving  layout id
  void saveFilterCategoryId({String? categoryId}) {
    _sharedPreferences!.setString(_FILTER_CATEGORY_ID!, categoryId!);
  }

  ///get method  for auth token
  String? getFilterCategoryId() =>
      _sharedPreferences!.getString(_FILTER_CATEGORY_ID!);

  ///saving  the auth token as a String
  void setFcmToken({String? token}) async {
    await _sharedPreferences!.setString(_FCM_TOKEN!, token!);
  }

  ///get method  for auth token
  String? getFcmToken() => _sharedPreferences!.getString(_FCM_TOKEN!);

  ///after login set isLoggedIn true
  ///before logout set isLoggedIn false
  void setIsLoggedIn(bool status) {
    _sharedPreferences!.setBool(_IS_LOGGED_IN!, status);
  }

  ///checking that is logged in or not
  bool? isLoggedIn() => _sharedPreferences!.getBool(_IS_LOGGED_IN!) != null &&
          _sharedPreferences!.getBool(_IS_LOGGED_IN!) == true
      ? true
      : false;



  /// for clearing the data in preference
  void clearPrefs() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }


  // ///  save user data
  // void saveUserData(LoginWithEmailResponse result) {
  //   String jsonString = jsonEncode(result);
  //   _sharedPreferences!.setString(_USER_DATA!, jsonString);
  // }
  //
  // /// get user data
  // LoginWithEmailResponse? getUserData() {
  //   Map<String, dynamic>? resultMap =
  //       jsonDecode(_sharedPreferences!.getString(_USER_DATA!)!);
  //   var result = new LoginWithEmailResponse.fromJson(resultMap!);
  //   return result;
  // }









}
