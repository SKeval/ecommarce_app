// ignore_for_file: non_constant_identifier_names

import 'package:ecommarce_app/models/details_model.dart';
import 'package:flutter/material.dart';

List<String> category = ["All", "Popular", "Recent", "Recomended"];
List<Emp> EmpList = [];

List<BottomNavigationBarItem> navigaton = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
  const BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
  const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
  const BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
];

List<Emp> EmpCart = [];
