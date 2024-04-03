import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/helpers/snackbar.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/signup.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Consumer<AuthController>(
                builder: (context, loginProvider, child) {
                  return Column(
                    children: [
                      const Text('English(India)'),
                      const SizedBox(height: 25),
                      const Text(
                        'Instagram',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey, // Adjust border color as needed
                            width: 3, // Adjust border width as needed
                          ),
                        ),
                        child: TextFormField(
                          controller: loginProvider.emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'value is empty';
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: 'Phone number, email or username',
                            border: InputBorder.none, // Remove default border
                          ),
                        ),
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
                            color: Colors.grey,
                            width: 3,
                          ),
                        ),
                        child: TextFormField(
                          controller: loginProvider.passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'value is empty';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              hintText: 'Password',
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove_red_eye))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 1),
                          padding: const EdgeInsets.only(
                              bottom: 4, left: 190, right: 190, top: 4),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 251, 251,
                                  252), // Adjust border color as needed
                              width: 3, // Adjust border width as needed
                            ),
                          ),
                          child: TextButton(
                              onPressed: ()async {
                                if (formkey.currentState!.validate()) {
                               final authChecker=await loginProvider.userLogin();

                               if (authChecker=="success") {
                                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                               } else {
                                showSnackbar(context, authChecker.toString());
                                 
                               }
                               
                                
                                }
                              },
                              child: const Text(
                                'Log In',
                                style: TextStyle(color: Colors.white),
                              ))),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forgot your loging details ?',
                                style: TextStyle(color: Colors.black),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Get help logining In ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                      const Divider(
                        thickness: 3,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Log in with facebok ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          )),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Dont have an account ?'),
                          TextButton(
                              onPressed: () {
                                
                                loginProvider.clearControllerData();
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (ctx) {
                                  return signup();
                                }));
                              },
                              child: const Text(
                                'Sign up.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
