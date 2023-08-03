import 'package:ecommarce_app/utils/appbar.dart';
import 'package:ecommarce_app/utils/txts.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help_Page extends StatefulWidget {
  const Help_Page({super.key});

  @override
  State<Help_Page> createState() => _Help_PageState();
}

class _Help_PageState extends State<Help_Page> {
  final Uri _urlContact = Uri.parse('tel:+91-7573907800');
  final Uri _urlEmail =
      Uri.parse('mailto:kevalsavaliya4445@gmail.com?subject="SUPPORT NOW');

  Future<void> showURL(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: apbar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Txts(
              title: "Contact Info",
              weight: FontWeight.bold,
              size: 20,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(48.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Txts(
                      title: "Contact No :- +91 7573907800",
                    ),
                    Txts(
                      title: "Email :- kevalsavaliya4445@gmail.com",
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, elevation: 5),
                    onPressed: () {
                      showURL(_urlContact);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.contact_mail_outlined,
                          color: Colors.black,
                        ),
                        Txts(
                          title: "  Contact",
                          weight: FontWeight.bold,
                        ),
                      ],
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, elevation: 5),
                    onPressed: () {
                      showURL(_urlEmail);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.email_outlined, color: Colors.black),
                        Txts(
                          title: " Email",
                          weight: FontWeight.bold,
                        ),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
