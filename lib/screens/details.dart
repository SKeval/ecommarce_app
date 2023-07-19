// ignore_for_file: must_be_immutable

import 'package:ecommarce_app/models/details_model.dart';
import 'package:ecommarce_app/screens/cart.dart';
import 'package:ecommarce_app/utils/datalists.dart';
import 'package:ecommarce_app/utils/txts.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  Emp ep;
  Details({super.key, required this.ep});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  //late double height;

  bool isLoading = false;

  //API Calling Function
  // callAPI() {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   DetailsRepo().getdata().then((value) {
  //     setState(() {
  //       //ep = value;
  //       isLoading = false;
  //     });
  //   }).onError((error, stackTrace) {
  //     setState(() {
  //       ep = null;
  //       isLoading = false;
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // setState(() {
    //callAPI();
    // });
    // DetailsRepo().getdata();

    //height = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // isLoading
          //     ? const Center(child: CircularProgressIndicator())
          //     : ep == null
          //         ? const Card(
          //             child: Center(
          //             child: ListTile(
          //               title: Text('No product Found !'),
          //             ),
          //           ))
          //         :
          Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 320,
              // color: Colors.red,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ListTile(
                        title: Txts(
                          title: widget.ep.title,
                          weight: FontWeight.bold,
                          size: 20,
                        ),
                        subtitle: Txts(
                          title: "Rating : ${widget.ep.rating.rate}",
                          size: 12,
                        ),
                        trailing: Txts(
                          title: "\$ ${widget.ep.price}",
                          weight: FontWeight.bold,
                          size: 20,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      height: 100,
                      child: SingleChildScrollView(
                        child: Txts(
                            title: widget.ep.description, isOverflow: true),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 55,
                            width: 200,
                            child: ElevatedButton(
                                onPressed: () {},
                                child: Txts(title: "Buy Now")),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              EmpCart.add(widget.ep);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Cart_Page(),
                                  ));
                            },
                            child: const Icon(Icons.shopping_cart),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              //margin: const EdgeInsets.all(20),
              height: 500,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(blurRadius: 50, spreadRadius: 5)],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Image.network(
                  widget.ep.image,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
          Positioned(
              top: 10,
              left: 0,
              child: SizedBox(
                  height: 100,
                  width: 100,
                  child: BackButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ))),
        ],
      ),
    );
  }
}
