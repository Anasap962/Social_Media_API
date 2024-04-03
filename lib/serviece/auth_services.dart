import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  Dio dio = Dio();

  // User Registration
  Future<void> register(AuthModel authDatas) async {
    try {
      final response = await dio.post(
          'https://socialmedia-api-v1.onrender.com/auth/register/',
          data: authDatas.toJson(),
          options: Options(headers: {
            'Content-Type': 'application/json',
          }));

      if (response.statusCode == 201) {
        log('Register Succesfully');
      } else {
        log('Register Failed');
      }
    } catch (e) {
      log(e.toString());
    }
  }

// user login
  Future<String> login({required String email, required String password}) async {
    final loginData = {"email": email, "password": password};
    try {
      final response =
          await dio.post('https://socialmedia-api-v1.onrender.com/auth/login/',
              data: jsonEncode(loginData),
              options: Options(headers: {
                'Content-Type': 'application/json',
              }));
      if (response.statusCode == 200) {
        log('Loging succesfull');
        final responseData = response.data as Map<String, dynamic>;
        String token = responseData['token'];
        String status  = responseData['status'];
        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('Token', token);
        sharedPreferences.setString('Status', status);

        return status;

      } else {
        log('login failed');
        return 'User Not Found ';
        
      }

    } catch (e) {
      log(e.toString());
      return 'User Not Found ';
    }
  }
}
