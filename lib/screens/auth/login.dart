// ignore_for_file: camel_case_types

import 'package:ecommarce_app/repository/login_repo.dart';
import 'package:ecommarce_app/screens/auth/registration.dart';
import 'package:ecommarce_app/screens/homepage.dart';
import 'package:ecommarce_app/utils/colors.dart';
import 'package:ecommarce_app/utils/textfield.dart';
import 'package:ecommarce_app/utils/txts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum Loginvalue { username, password }

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final TextEditingController _usercon = TextEditingController();
  final TextEditingController _passcon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Txts(
              title: "Welcome to Zelzis E-commerce",
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Card(
              color: Colors.pink[100],
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Txt_Field(
                        controller: _usercon,
                        hint: "Enter Userame",
                        label: "Username"),
                    Txt_Field(
                        isVisible: true,
                        controller: _passcon,
                        hint: "Enter Password",
                        label: "Password"),
                  ],
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Registration_Page(),
                )),
                child: RichText(
                  text: TextSpan(
                      text: "Don't have an Account ? ",
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.black),
                      children: [
                        TextSpan(
                            text: "Sign up",
                            style: GoogleFonts.lato(
                                fontSize: 18, color: primaryColor))
                      ]),
                ),
              )),
          //   child: Text.rich(TextSpan(children: [
          //     TextSpan(
          //         text: "Already have an account ? ",
          //         style: GoogleFonts.lato(fontSize: 18)),
          //     TextSpan(
          //         text: "Log in",
          //         style: GoogleFonts.lato(fontSize: 18, color: primaryColor))
          //   ])),
          // ),
          // isloading
          // ?
          //const CircularProgressIndicator()
          // :
          SizedBox(
            height: 50,
            width: 160,
            child: ElevatedButton(
                onPressed: () {
                  // if (!validation(_usercon.text.trim(), null, "Username",
                  //     Loginvalue.username)) {
                  // } else if (validation(_passcon.text.trim(), null, "Password",
                  //     Loginvalue.password)) {
                  // } else {
                  // }
                  //  callRegistration_API();
                  LoginRepo()
                      .checkAuth(_usercon.text.trim(), _passcon.text.trim())
                      .then(
                    (value) {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[100], elevation: 5),
                child: Txts(
                  title: "Log in",
                  size: 18,
                )),
          )
        ],
      ),
    );
  }
}
