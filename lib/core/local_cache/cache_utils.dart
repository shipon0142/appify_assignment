import 'dart:async';
import 'dart:convert';
import 'package:code_base/core/utility/constants/constants_manager.dart';
import 'package:code_base/features/auth/data/res/login_response_model/login_response_model.dart';
import 'package:code_base/features/auth/domain/entity/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheUtils {
  final SharedPreferences _prefs;
  static CacheUtils? _instance;

  CacheUtils._(this._prefs);

  static Future<CacheUtils> getInstance() async {
    if (_instance == null) {
      SharedPreferences cacheUtils = await SharedPreferences.getInstance();
      _instance = CacheUtils._(cacheUtils);
    }
    return _instance!;
  }
  final String token = 'token';

  saveToken(LoginResponseEntity loginResponse) {

     _prefs.setString(token, loginResponse.token??'');
  }

  String getToken() {
    String tokenData = _prefs.getString(token)??'';
    return tokenData;
  }

}
