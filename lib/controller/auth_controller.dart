import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/auth_model.dart';
import 'package:flutter_application_1/serviece/auth_services.dart';

class AuthController extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

// user register
  Future<void> userRegistration() async {
    AuthModel authModel = AuthModel(
        email: emailController.text,
        password: passwordController.text,
        username: usernameController.text);

    await AuthServices()
        .register(authModel)
        .then((value) => clearControllerData());

    notifyListeners();
  }

  // user login
  Future<String> userLogin() async {
      String status=  await AuthServices()
        .login(email: emailController.text, password: passwordController.text);
  
  return status;
  }

  // function to clear the controller datas
  void clearControllerData() {
    emailController.clear();
    passwordController.clear();
    usernameController.clear();
    notifyListeners();
  }
}
