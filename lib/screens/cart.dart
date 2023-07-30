// ignore_for_file: camel_case_types

import 'package:ecommarce_app/utils/appbar.dart';
import 'package:ecommarce_app/utils/bottom_navigation_bar.dart';
import 'package:ecommarce_app/utils/colors.dart';
import 'package:ecommarce_app/utils/datalists.dart';
import 'package:ecommarce_app/utils/drawer.dart';
import 'package:ecommarce_app/utils/txts.dart';
import 'package:flutter/material.dart';

class Cart_Page extends StatefulWidget {
  const Cart_Page({super.key});

  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {
  double _total = 0;
  bool istrue = true;

  void total() {
    _total = 0;
    for (var e in EmpCart) {
      _total += (e.price * e.countCart);
    }
  }

  @override
  void initState() {
    super.initState();
    total();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(index: 2),
      drawer: drawerContent(context),
      appBar: apbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: EmpCart.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8),
                          height: 120,
                          width: 110,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 2,
                                    blurStyle: BlurStyle.outer,
                                    spreadRadius: 2,
                                    color: primaryColor)
                              ],
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: Image.network(EmpCart[index].image)
                                      .image),
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(25)),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CheckboxListTile(
                                title: Txts(
                                    title: EmpCart[index].title,
                                    weight: FontWeight.bold),
                                subtitle: Txts(
                                    title: EmpCart[index]
                                        .description
                                        .substring(0, 50)),
                                value: EmpCart[index].ischecked,
                                onChanged: (value) {
                                  setState(() {
                                    EmpCart[index].ischecked = value!;
                                    if (EmpCart[index].ischecked == false) {
                                      EmpCart.removeAt(index);
                                      total();
                                    }
                                  });
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Txts(
                                      title: "\$ ${EmpCart[index].price}",
                                      weight: FontWeight.bold,
                                      size: 18,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  EmpCart[index].countCart++;
                                                  total();
                                                });
                                              },
                                              icon: const Icon(Icons.add)),
                                          Txts(
                                            title:
                                                "${EmpCart[index].countCart}",
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  EmpCart[index].countCart--;
                                                  if (EmpCart[index]
                                                          .countCart ==
                                                      0) {
                                                    EmpCart.removeAt(index);
                                                  }
                                                  total();
                                                });
                                              },
                                              child: Txts(
                                                title: "-",
                                                weight: FontWeight.bold,
                                                size: 30,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 10, left: 30, right: 30, top: 10),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: Txts(title: "Total"),
                subtitle: Txts(
                  title: "\$${_total.toStringAsFixed(2)}",
                  size: 20,
                  weight: FontWeight.bold,
                ),
                trailing: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: primaryColor),
                    onPressed: () {},
                    child: Txts(
                      title: "Pay Now",
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
