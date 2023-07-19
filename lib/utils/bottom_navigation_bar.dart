import 'package:ecommarce_app/screens/cart.dart';
import 'package:ecommarce_app/screens/homepage.dart';
import 'package:ecommarce_app/utils/colors.dart';
import 'package:ecommarce_app/utils/datalists.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  int index;
  BottomNavigation({super.key, required this.index});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: navigaton,
        onTap: (value) {
          setState(() {
            widget.index = value;
            if (widget.index == 2) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Cart_Page(),
                  ));
            } else if (widget.index == 0) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            }
          });
        },
        currentIndex: widget.index,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black);
  }
}
