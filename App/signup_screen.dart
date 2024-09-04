import 'package:firebase/reusable_widgets/reusable_widgets.dart';
import 'package:firebase/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("D66853"),
          hexStringToColor("C0D6DF"),
          hexStringToColor("4F6D7A"),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.fromLTRB(
              20, MediaQuery.of(context).size.height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              const Text("Welcome to Smart Stethoscope",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              logoWidget("assets/images/logo.png"),
              const SizedBox(
                height: 30,
              ),
              reusableTextField("Enter Email", Icons.person_outline, false,
                  _emailTextController),
              const SizedBox(
                height: 30,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, false,
                  _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              firebaseUIButton(context, "Sign Up", () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text)
                    .then((value) {
                  //print("Created New Account");
                  Fluttertoast.showToast(msg: "Created New Account");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              })
            ],
          ),
        )),
      ),
    );
  }
}
