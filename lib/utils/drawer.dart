import 'package:ecommarce_app/screens/cart.dart';
import 'package:ecommarce_app/screens/homepage.dart';
import 'package:ecommarce_app/utils/txts.dart';
import 'package:flutter/material.dart';

Widget listDrawer(IconData icon, String value, VoidCallback? ontap) {
  return InkWell(
    onTap: ontap,
    child: ListTile(
      leading: Icon(icon),
      title: Txts(
        title: value,
      ),
    ),
  );
}

Widget drawerContent(BuildContext context) {
  return Drawer(
    backgroundColor: const Color.fromARGB(255, 209, 181, 190),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: SizedBox(
            child: Column(
              children: [
                const SizedBox(
                  width: 70,
                  height: 70,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 15),
                  child: Txts(
                    title: "Profile Name",
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
        listDrawer(Icons.home, "Home", () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        }),
        listDrawer(Icons.shopping_cart, "List", () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        }),
        listDrawer(Icons.list, "Cart", () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const Cart_Page(),
          ));
        }),
        listDrawer(Icons.person, "Profile", () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        }),
        listDrawer(Icons.menu_book, "Terms & Conditions", () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        }),
        listDrawer(Icons.help, "Help", () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        }),
        listDrawer(Icons.logout, "Log Out", () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        }),
      ],
    ),
  );
}
