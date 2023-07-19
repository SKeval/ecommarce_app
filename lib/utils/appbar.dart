import 'package:flutter/material.dart';

AppBar apbar() {
  return AppBar(
    centerTitle: true,
    title: const Column(
      children: [
        Text(
          "Hello Keval",
          style: TextStyle(fontSize: 12),
        ),
        Text(
          "Surat, INDIA",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ],
    ),
    actions: [
      Container(
        margin: const EdgeInsets.all(10),
        height: 40,
        width: 40,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/local/pic.jpeg"))),
      ),
    ],
  );
}
