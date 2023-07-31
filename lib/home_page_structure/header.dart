// ignore_for_file: camel_case_types, unused_import

import 'package:ecommarce_app/home_page_structure/body.dart';
import 'package:ecommarce_app/utils/colors.dart';
import 'package:ecommarce_app/utils/images.dart';
import 'package:ecommarce_app/utils/txts.dart';
import 'package:flutter/material.dart';

class Header_Home extends StatefulWidget {
  const Header_Home({super.key});

  @override
  State<Header_Home> createState() => _Header_HomeState();
}

class _Header_HomeState extends State<Header_Home> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Search Bar
        Container(
          margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 4,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                          hintText: "Search Items",
                          icon: Icon(Icons.search),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48,
                width: 48,
                child: FloatingActionButton(
                  onPressed: () {},
                  //shape: ,
                  child: const Icon(Icons.settings_suggest_sharp),
                ),
              )
            ],
          ),
        ),
        //base container
        Padding(
          padding: const EdgeInsets.only(top: 5, right: 15, left: 15.0),
          child: Container(
            height: 200,
            decoration: const BoxDecoration(

                //color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.outer,
                            blurRadius: 20,
                            color: primaryColor,
                          )
                        ],
                        color: primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 200,
                      width: 150,
                      //color: Colors.black,
                      child: Image.asset(
                        model,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Txts(
                          title: "Big Sale",
                          weight: FontWeight.bold,
                          size: 22,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 140,
                          child: Txts(
                            title:
                                "Get the Trandy fashion at a discount of up to 50%",
                            weight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
