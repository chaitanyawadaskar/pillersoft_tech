import 'package:shared_preferences/shared_preferences.dart';

// TO GET USER ID VALUE
Future<int?> getUserId() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getInt("UserId");
}

// TO SAVE USER ID VALUE
Future<bool> saveUserId(int userId) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return await preferences.setInt("UserId", userId);
}

// TO REMOVE USER ID VALUE
Future<bool> removeUserId() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return await preferences.remove("UserId");
}

// TO GET USER TOKEN BOOL VALUE
Future<String> getUserToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString("UserToken") ?? '';
}

// TO SAVE USER TOKEN BOOL VALUE
Future<bool> saveUserToken(String isUser) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return await preferences.setString("UserToken", isUser);
}

// TO REMOVE USER TOKEN BOOL VALUE
Future<bool> removeUserToken() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return await preferences.remove("UserToken");
}

// TO GET USER NAME BOOL VALUE
Future<String> getUserName() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString("UserName") ?? '';
}

// TO SAVE USER NAME BOOL VALUE
Future<bool> saveUserName(String isUser) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return await preferences.setString("UserName", isUser);
}

// TO REMOVE USER NAME BOOL VALUE
Future<bool> removeUserName() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return await preferences.remove("UserName");
}

// TO GET LOCALIZATION STRING VALUE
Future<String> getLocalization() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return preferences.getString("Localization") ?? '1';
}

// TO SAVE LOCALIZATION STRING VALUE
Future<bool> saveLocalization(String lngCode) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return await preferences.setString("Localization", lngCode);
}

// TO REMOVE LOCALIZATION STRING VALUE
Future<bool> removeLocalization() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  return await preferences.remove("Localization");
}
