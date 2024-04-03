import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home.dart';
import 'package:flutter_application_1/screens/loging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  gotLoginHomeScreen()async{
    await Future.delayed(Duration(seconds: 4),);
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
        final login=  sharedPreferences.getString('Status');
    if (login=='success') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
      
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotLoginHomeScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Welcome'),),
    );
  }
}