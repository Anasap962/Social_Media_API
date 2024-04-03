import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/screens/loging.dart';
import 'package:flutter_application_1/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthController(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  SplashScreen()
      ),
    );
  }
}
