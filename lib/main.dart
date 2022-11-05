import 'package:app/pages/home_page.dart';
import 'package:app/pages/login.dart';
import 'package:app/pages/payment.dart';
import 'package:app/pages/service.dart';
import 'package:app/pages/signup.dart';
import 'package:app/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      routes: {
        "/": (context) => Login(),
        MyRoutes.loginroutes: (context) => Login(),
        MyRoutes.homeroutes: (context) => HomePage(),
        MyRoutes.serviceroutes: (context) => Service(),
        MyRoutes.paymentroutes: (context) => Payment(),
        MyRoutes.signuproutes: (context) => Signup()
      },
    );
  }
}
