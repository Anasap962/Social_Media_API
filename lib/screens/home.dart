import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/loging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold( appBar: AppBar(
      automaticallyImplyLeading: false,
      title: Text('Home screen'),
    actions: [IconButton(onPressed: ()async{
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();//access sharedprefrence
      sharedPreferences.remove('Status').then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),)));

    }, icon: Icon(Icons.logout))],
  ),
  
 );
  }
}