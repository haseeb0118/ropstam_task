import 'package:flutter/material.dart';
import 'package:rosptam_task/screen/home_screen.dart';
import 'package:rosptam_task/screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('email');
  print(email);
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
      home: email == null ? LoginScreen() : HomeScreen()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp();
  }
}