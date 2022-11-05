import 'dart:ffi';

import 'dart:ui';

import 'package:app/pages/home_page.dart';
import 'package:app/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changeshape = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeshape = true;
      });
      await Future.delayed(Duration(milliseconds: 300));
      Navigator.pushNamed(context, MyRoutes.homeroutes);
      setState(() {
        changeshape = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Image.asset(
                  'assets/images/login.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Welcome $name',
                style: GoogleFonts.lato(
                    fontSize: 28,
                    fontWeight: FontWeight.w300,
                    color: Colors.blueAccent),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'login page',
                style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.w300,
                    color: Colors.blueAccent),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "username", labelText: "Username"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter valid username";
                        }
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "password", labelText: "Password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter the password";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Material(
                // shape: changeshape ? BoxShape.circle : BoxShape.rectangle,
                borderRadius: BorderRadius.circular(changeshape ? 60 : 8),
                color: Colors.blueAccent,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: changeshape ? 60 : 150,
                    height: 50,
                    alignment: Alignment.center,
                    child: changeshape
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : Text(
                            'login',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New User?'),
                    TextButton(
                        onPressed: (){
                        try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailAddress,
    password: password
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
                        }
                            
                        child: Text('login'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
