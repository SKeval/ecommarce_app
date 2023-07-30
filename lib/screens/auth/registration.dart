// ignore_for_file: unused_field, camel_case_types, unused_import, non_constant_identifier_names, avoid_print

import 'package:ecommarce_app/repository/registration_repo.dart';
import 'package:ecommarce_app/screens/auth/validatation.dart';
import 'package:ecommarce_app/utils/colors.dart';
import 'package:ecommarce_app/utils/showmsg.dart';
import 'package:ecommarce_app/utils/textfield.dart';
import 'package:ecommarce_app/utils/txts.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum valuetype {
  email,
  username,
  password,
  fname,
  lname,
  city,
  street,
  number,
  zipcode,
  phone
}

class Registration_Page extends StatefulWidget {
  const Registration_Page({super.key});

  @override
  State<Registration_Page> createState() => _Registration_PageState();
}

class _Registration_PageState extends State<Registration_Page> {
  final TextEditingController _usercon = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _street = TextEditingController();
  final TextEditingController _numbercon = TextEditingController();
  final TextEditingController _zipcode = TextEditingController();
  final TextEditingController _FirstNamecon = TextEditingController();
  final TextEditingController _LastNamecon = TextEditingController();
  final TextEditingController _idcon = TextEditingController();
  final TextEditingController _passcon = TextEditingController();
  final TextEditingController _emailcon = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  bool isloading = false;

  callRegistration_API() {
    setState(() {
      isloading = true;
    });
    Registration_Repo()
        .getdDetails(
            _FirstNamecon.text.trim(),
            _LastNamecon.text.trim(),
            _emailcon.text.trim(),
            _usercon.text.trim(),
            _street.text.trim(),
            _city.text.trim(),
            _passcon.text.trim(),
            _numbercon.text.trim(),
            _zipcode.text.trim(),
            _phone.text.trim())
        .then(
      (value) {
        setState(() {
          isloading = false;
          // showMsg("Registration Successfully");
        });

        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      Row(
                        children: [
                          Expanded(
                            child: Txt_Field(
                                controller: _FirstNamecon,
                                hint: "Enter First Name",
                                label: "First Name"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Txt_Field(
                                controller: _LastNamecon,
                                hint: "Enter Last Name",
                                label: "Last Name"),
                          ),
                        ],
                      ),
                      Txt_Field(
                          controller: _emailcon,
                          hint: "Enter Email ID",
                          keyboard: TextInputType.emailAddress,
                          label: "Email"),
                      Txt_Field(
                          controller: _usercon,
                          hint: "Enter Userame",
                          label: "Username"),
                      Row(
                        children: [
                          Expanded(
                            child: Txt_Field(
                                controller: _numbercon,
                                keyboard: TextInputType.number,
                                hint: "Enter Number",
                                label: "Number"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Txt_Field(
                                controller: _street,
                                hint: "Enter street Name",
                                label: "Street"),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Txt_Field(
                                controller: _city,
                                hint: "Enter City",
                                label: "City"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Txt_Field(
                                controller: _zipcode,
                                keyboard: TextInputType.number,
                                hint: "Enter Zipcode",
                                label: "Zipcode"),
                          ),
                        ],
                      ),
                      Txt_Field(
                          controller: _passcon,
                          hint: "Enter Password",
                          label: "Password"),
                      Txt_Field(
                          controller: _phone,
                          keyboard: TextInputType.number,
                          hint: "Enter Phone Number",
                          label: "Phone Number")
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: RichText(
                    text: TextSpan(
                        text: "Already have an account ? ",
                        style:
                            GoogleFonts.lato(fontSize: 18, color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Log in",
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
            isloading
                ? const CircularProgressIndicator()
                : SizedBox(
                    height: 50,
                    width: 160,
                    child: ElevatedButton(
                        onPressed: () {
                          try {
                            if (!validation(_FirstNamecon.text.trim(),
                                valuetype.fname, "First Name")) {
                              //print("UnSuccess");
                            } else if (!validation(_LastNamecon.text.trim(),
                                valuetype.lname, 'Last Name')) {
                            } else if (!validation(_emailcon.text.trim(),
                                valuetype.email, 'Email')) {
                            } else if (!validation(_usercon.text.trim(),
                                valuetype.username, 'Username')) {
                            } else if (!validation(_numbercon.text.trim(),
                                valuetype.number, 'Number')) {
                            } else if (!validation(_street.text.trim(),
                                valuetype.street, 'Street')) {
                            } else if (!validation(
                                _city.text.trim(), valuetype.city, 'City')) {
                            } else if (!validation(_zipcode.text.trim(),
                                valuetype.zipcode, 'Zipcode')) {
                            } else if (!validation(_passcon.text.trim(),
                                valuetype.password, 'Password')) {
                            } else if (!validation(_phone.text.trim(),
                                valuetype.phone, 'Phone Number')) {
                            } else {
                              showMsg("Registration Successful !!");
                              //print("Success");
                              callRegistration_API();
                            }
                          } catch (e) {
                            print("Exception $e");
                          }

                          /*
                         */
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink[100], elevation: 5),
                        child: Txts(
                          title: "Register",
                          size: 18,
                        )),
                  )
          ],
        ),
      ),
    );
  }
}
