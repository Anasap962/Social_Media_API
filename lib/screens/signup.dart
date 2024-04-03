import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/screens/loging.dart';
import 'package:provider/provider.dart';

class signup extends StatelessWidget {
  signup({super.key});

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Consumer<AuthController>(
              builder: (context, authProvider, child) {
                return Column(
                  children: [
                    const Text(
                      'Create an account',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 33),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey, // Adjust border color as needed
                          width: 3, // Adjust border width as needed
                        ),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'value is empty';
                          } else {
                            return null;
                          }
                        },
                        controller: authProvider.usernameController,
                        decoration: const InputDecoration(
                          hintText: 'User name',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey, // Adjust border color as needed
                          width: 3, // Adjust border width as needed
                        ),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'value is empty';
                          } else {
                            return null;
                          }
                        },
                        controller: authProvider.emailController,
                        decoration: const InputDecoration(
                            hintText: 'Email', border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 1),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey, // Adjust border color as needed
                          width: 3, // Adjust border width as needed
                        ),
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'value is empty';
                          } else {
                            return null;
                          }
                        },
                        controller: authProvider.passwordController,
                        decoration: const InputDecoration(
                            hintText: 'Password', border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            authProvider
                                .userRegistration()
                                .then((value) => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    )));
                          }
                        },
                        child: const Text('SignUp'))
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
