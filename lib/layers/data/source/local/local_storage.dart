import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:posts_app/resources/langauge_manager.dart';

const appKey = 'HappyLandDbAppBox';
const userBox = 'userBox';
const userKey = 'userKey';
const countriesBox = 'countriesBox';
const authToken = 'Token';
const countryCode = 'countryCode';
const appLanguage = 'appLanguage';
const appSettings = 'appSettings';

abstract class LocalStorage {
  Future<void> setToken(String token);

  // Future<void> setLoginData(LoginHiveObject loginAdapter);
  //
  // Future<LoginHiveObject?> getLoginData();

  Future<void> clearLoginData();

  Future<String?> getToken();

  Future<void> setAppLanguage(String locale);

  Future<String> getAppLanguage();

  Future<Locale> getLocal();
}

class LocalStorageImpl implements LocalStorage {
  LocalStorageImpl({
    required Box<dynamic> hiveBox,
  }) : _hiveBox = hiveBox;

  final Box<dynamic> _hiveBox;

  @override
  Future<String?> getToken() async {
    return _hiveBox.get(authToken);
  }

  @override
  Future<void> setToken(String token) {
    return _hiveBox.put(authToken, token);
  }

  @override
  Future<void> setAppLanguage(String locale) {
    return _hiveBox.put(appLanguage, locale);
  }

  @override
  Future<String> getAppLanguage() async {
    final String? language = _hiveBox.get(appLanguage);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.en.getValue();
    }
  }

  @override
  Future<Locale> getLocal() async {
    final currentLang = await getAppLanguage();

    if (currentLang == LanguageType.en.getValue()) {
      return enLocale;
    } else {
      return arLocale;
    }
  }

  // @override
  // Future<void> setLoginData(LoginHiveObject loginAdapter) async {
  //   return _hiveBox.put(userKey, loginAdapter);
  // }
  //
  // @override
  // Future<LoginHiveObject?> getLoginData() async {
  //   return _hiveBox.get(userKey);
  // }
  //
  @override
  Future<void> clearLoginData() async {
    await _hiveBox.delete(userKey);
    await _hiveBox.delete(authToken);
  }
}
