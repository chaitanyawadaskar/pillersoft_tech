import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pillersoft/data/controller/auth_controller/auth_controller.dart';
import 'package:pillersoft/data/services/validation_service/validation_service.dart';
import 'package:pillersoft/utilities/core/kpadding.dart';
import 'package:pillersoft/utilities/custom_colors/custom_colors.dart';
import 'package:pillersoft/utilities/theme/ktext_theme.dart';

import '../../components/custom_button.dart';
import '../../utilities/assets_paths/assets_paths.dart';
import '../../utilities/gap/gap.dart';
import '../home/home_screen.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();
  bool isShow = false;
  bool isCheck = false;
  final authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: KPadding.horizontal16,
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gap.height(80),
                  Image.asset(
                    ImagePath.logo,
                    height: 80.h,
                  ),
                  Gap.height(60),
                  Text(
                    'Log In',
                    style: KText.r22TextBlue,
                  ),
                  Gap.height(25),
                  TextFormField(
                    controller: email,
                    decoration:
                        const InputDecoration(hintText: 'Email / Phone Number'),
                    validator: (value) => ValidationService.validateString(
                        value, 'Please enter email / phone'),
                  ),
                  Gap.height(),
                  TextFormField(
                    controller: pass,
                    obscureText: isShow,
                    validator: (value) => ValidationService.validatePass(value),
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isShow = !isShow;
                            });
                          },
                          child: Icon(
                            isShow
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                            color: CustomColors.grey,
                          ),
                        )),
                  ),
                  Gap.height(),
                  Row(
                    children: [
                      Checkbox(
                          value: isCheck,
                          visualDensity:
                              const VisualDensity(horizontal: -4, vertical: -4),
                          tristate: true,
                          onChanged: (val) {
                            setState(() {
                              isCheck = !isCheck;
                            });
                          }),
                      Text(
                        'Remember me',
                        style: KText.r16,
                      ),
                      const Spacer(),
                      Text(
                        'Forgot password?',
                        style: KText.r16,
                      ),
                    ],
                  ),
                  Gap.height(50),
                  CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        authController.login(
                            email: email.text, pass: pass.text);
                      }
                      // Get.to(() => const HomeScreen(),
                      //     transition: Transition.rightToLeft);
                    },
                    title: 'Log In',
                  ),
                  Gap.height(25),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Don\'t have an account? ', style: KText.r18),
                    TextSpan(
                        text: 'Register now!',
                        style: KText.r18Green,
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.to(() => SignUpScreen(),
                                transition: Transition.rightToLeft);
                          })
                  ])),
                  Gap.height(25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
