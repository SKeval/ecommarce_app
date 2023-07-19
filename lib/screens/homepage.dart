import 'package:ecommarce_app/home_page_structure/body.dart';
import 'package:ecommarce_app/home_page_structure/footer.dart';
import 'package:ecommarce_app/home_page_structure/header.dart';
import 'package:ecommarce_app/utils/appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: apbar(),
      body: const Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Header_Home(),
            Body_Home(),
            Expanded(child: Footer_Body())
          ],
        ),
      ),
    );
  }
}
