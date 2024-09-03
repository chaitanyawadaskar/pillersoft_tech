import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pillersoft/data/models/sign_up_model/sign_up_model.dart';
import '../../../screens/home/home_screen.dart';
import '../../../screens/login/login_screen.dart';
import '../../../utilities/loader/custom_loader/custom_loader.dart';
import '../../api/repository.dart';
import '../../local_database/shared_pref.dart';
import '../../models/login_model/login_model.dart';

class AuthController extends GetxController {
  var repository = Repository();

  Future<LoginModel?> login({String email = '', pass = ''}) async {
    CustomLoader.openCustomLoader();
    var map = <String, String>{};
    map['email'] = email;
    map['password'] = pass;
    try {
      var data = await repository.login(
        map,
      );

      CustomLoader.closeCustomLoader();
      if (data.status == true) {
        saveUserToken('${data.token}');
        Get.offAll(() => const HomeScreen(),
            transition: Transition.rightToLeft);
      } else {
        Fluttertoast.showToast(
            msg: data.message ?? 'Error occured while login');
      }
      return data;
    } catch (e) {
      CustomLoader.closeCustomLoader();

      var errorData = jsonDecode(e.toString());
      Fluttertoast.showToast(
          msg:
              '${errorData['message'] != 'null' ? errorData['message'] : 'Error occured'}');

      return null;
    }
  }

  Future<SignUpModel?> register(
      {String firstname = '',
      lastname = '',
      phone = '',
      email = '',
      pass = ''}) async {
    CustomLoader.openCustomLoader();
    var map = <String, String>{};
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['phone'] = phone;
    map['phonecode'] = '91';
    map['email'] = email;
    map['password'] = pass;
    map['password_confirmation'] = pass;
    try {
      var data = await repository.register(
        map,
      );

      CustomLoader.closeCustomLoader();
      if (data.status == true) {
        Fluttertoast.showToast(msg: '${data.message}');

        Get.offAll(() => const LoginScreen(),
            transition: Transition.rightToLeft);
      } else {
        Fluttertoast.showToast(msg: '${data.message}');
      }
      return data;
    } catch (e) {
      CustomLoader.closeCustomLoader();

      var errorData = jsonDecode(e.toString());
      Fluttertoast.showToast(msg: '${errorData['message']}');

      return null;
    }
  }
}
