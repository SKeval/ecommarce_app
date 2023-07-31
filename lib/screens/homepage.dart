import 'package:ecommarce_app/home_page_structure/body.dart';
import 'package:ecommarce_app/home_page_structure/header.dart';
import 'package:ecommarce_app/utils/appbar.dart';
import 'package:ecommarce_app/utils/drawer.dart';
import 'package:flutter/material.dart';

import '../utils/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawerContent(context),
      appBar: apbar(),
      bottomNavigationBar: BottomNavigation(
        index: 0,
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Header_Home(),
            Expanded(child: Body_Home()),
          ],
        ),
      ),
    );
  }
}
