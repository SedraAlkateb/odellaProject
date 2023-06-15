import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/presentation/resources/language_manager.dart';

const String PREFS_KEY_LANG="PREFS_KEY_LANG";
const String PREFS_KEY_LS_USER_LOGGED_IN="PREFS_KEY_IS_USER_LOGGED_IN";
const String PREFS_KEY_TOKEN="PREFS_KEY_TOKEN";
const String PREFS_KEY_USER="PREFS_KEY_USER";

class  AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      // set english
    await  _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      // set arabic
   await   _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
 //   reload();
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCALE;
    } else {
      return ENGLISH_LOCALE;
    }
  }
  // on board is logging
  Future<bool> setLoggedIn(String token,String user)async{
    await   _sharedPreferences.setBool(PREFS_KEY_LS_USER_LOGGED_IN, true);
    await  _sharedPreferences.setString(PREFS_KEY_TOKEN,token );
    await _sharedPreferences.setString(PREFS_KEY_USER,user );
   // reload();
    return true;
  }
  Future<bool> setToken(String token)async{
    await  _sharedPreferences.setString(PREFS_KEY_TOKEN,token );
    // reload();
    return true;
  }
  String getUser(){
    return _sharedPreferences.getString(PREFS_KEY_USER) ??"";
  }
  Future<bool> isUserLoggedIn()async{

    return _sharedPreferences.getBool(PREFS_KEY_LS_USER_LOGGED_IN) ?? false;

  }
/////////////////Token
/*
  Future<void> setToken(String token)async{
    _sharedPreferences.setString(PREFS_KEY_TOKEN,token );

  }
 */

  Future<String> getToken()async{
 //   reload();
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? "";

  }
  Future<void> signOut()async{
    await _sharedPreferences.remove(PREFS_KEY_TOKEN);
    await _sharedPreferences.remove(PREFS_KEY_LS_USER_LOGGED_IN);
    await _sharedPreferences.remove(PREFS_KEY_USER);

  }
  reload()async{
    await _sharedPreferences.reload();

  }


}