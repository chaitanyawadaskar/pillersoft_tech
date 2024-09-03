import 'package:get/get.dart';

class ValidationService {
  static String? validateEmail(String? value) {
    final RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
    );
    if (value!.isEmpty) {
      return 'Please enter a email'.tr;
    } else if ((emailRegExp.hasMatch(value) &&
            !value.contains('.com.com') &&
            !value.contains('.in.com') &&
            !value.contains('.com.in')) ==
        false) {
      return 'Please enter valid email'.tr;
    }
    return null;
  }

  static String? validatePass(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Please enter more than 8 character';
    }
    return null;
  }

  static String? validateRePass(String? value1, String? value2) {
    if (value1!.isEmpty) {
      return 'confirm_pass_validation_msg1'.tr;
    } else if (value2 != value1) {
      return 'confirm_pass_validation_msg2'.tr;
    }

    return null;
  }

  static String? validateNumber(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a mobile number';
    }

    if (value.length < 10) {
      return 'Please enter correct number';
    }
    return null;
  }

  static String? validateOTP(String? value, String validOtp) {
    if (value!.isEmpty) {
      return 'Please enter a otp';
    }

    if (value != validOtp) {
      return 'Please enter a correct otp';
    }
    return null;
  }

  static String? validateDropDown(Object? value, String? message) {
    if (value == null) {
      return "  $message";
    }
    return null;
  }

  static String? validateString(String? value, String? message) {
    if (value!.isEmpty) {
      return '$message';
    }
    return null;
  }
}
