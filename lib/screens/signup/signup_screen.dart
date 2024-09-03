import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pillersoft/components/arrow_left_appbar.dart';
import 'package:pillersoft/data/controller/auth_controller/auth_controller.dart';
import 'package:pillersoft/data/services/validation_service/validation_service.dart';
import 'package:pillersoft/utilities/core/kpadding.dart';

import '../../components/custom_button.dart';
import '../../utilities/custom_colors/custom_colors.dart';
import '../../utilities/gap/gap.dart';
import '../home/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final mobile = TextEditingController();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ArrowLeftAppbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Create account",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "3 easy signup process",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const LinearProgressIndicator(
                    value: 0.33, // For step 1 of 3
                    backgroundColor: CustomColors.cyanBlue,
                    color: CustomColors.gradientGreen1,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Enter your basic details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildShadowedTextFormField("First Name",
                      validator: (value) => ValidationService.validateString(
                          value, 'Please enter your first name'),
                      controller: firstName),
                  const SizedBox(height: 20),
                  _buildShadowedTextFormField("Last Name",
                      validator: (value) => ValidationService.validateString(
                          value, 'Please enter your last name'),
                      controller: lastName),
                  const SizedBox(height: 20),
                  _buildShadowedTextFormField(
                    "Email",
                    controller: email,
                    validator: (value) =>
                        ValidationService.validateEmail(value),
                  ),
                  const SizedBox(height: 20),
                  _buildShadowedTextFormField(
                    "Password",
                    controller: password,
                    isPassword: true,
                    validator: (value) => ValidationService.validatePass(value),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child:
                            _buildShadowedTextFormField("+91", enable: false),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        flex: 3,
                        child: _buildShadowedTextFormField("Mobile Number",
                            length: 10,
                            keyboardType: TextInputType.number,
                            validator: (val) =>
                                ValidationService.validateNumber(val),
                            controller: mobile),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        authController.register(
                            firstname: firstName.text,
                            lastname: lastName.text,
                            email: email.text,
                            pass: password.text,
                            phone: mobile.text);
                      }
                    },
                    title: 'Next',
                  ),
                  Gap.height(25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShadowedTextFormField(String label,
      {bool isPassword = false,
      TextEditingController? controller,
      TextInputType? keyboardType,
      String? Function(String?)? validator,
      int? length,
      bool enable = true}) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        enabled: enable,
        validator: validator,
        inputFormatters: [
          LengthLimitingTextInputFormatter(length),
        ],
        decoration: InputDecoration(
          labelText: label,
          contentPadding: KPadding.symmetric(15, 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}
