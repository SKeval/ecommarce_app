// ignore_for_file: camel_case_types

import 'package:ecommarce_app/models/details_model.dart';
import 'package:ecommarce_app/repository/homepage_repo.dart';
import 'package:ecommarce_app/screens/details.dart';
import 'package:ecommarce_app/utils/colors.dart';
import 'package:ecommarce_app/utils/datalists.dart';
import 'package:ecommarce_app/utils/txts.dart';
import 'package:flutter/material.dart';

class Body_Home extends StatefulWidget {
  const Body_Home({super.key});

  @override
  State<Body_Home> createState() => _Body_HomeState();
}

class _Body_HomeState extends State<Body_Home> {
  int _selected = 0;
  Future<List<Emp>?>? empfuture;

  @override
  void initState() {
    super.initState();
    empfuture = HomePage_Repo().getAPIList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 20.0, right: 20),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              _selected = index;
                              setState(() {});
                            },
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(40)),
                                color: _selected == index
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                              child: Center(
                                  child: Txts(
                                title: category[index],
                                size: 14,
                                color: _selected == index
                                    ? Colors.white
                                    : Colors.grey[850]!,
                              )),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 5,
                          );
                        },
                        itemCount: category.length)),
              ],
            ),
          ),
        ),
        RefreshIndicator(
          onRefresh: () {
            return Future.delayed(const Duration(seconds: 3)).then((value) {
              setState(() {
                empfuture = null;
              });

              setState(() {
                empfuture = HomePage_Repo().getAPIList();
              });
            });
          },
          child: SizedBox(
            height: 350,
            child: FutureBuilder(
                future: empfuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: GridView.builder(
                        itemCount: EmpList.length,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                mainAxisSpacing: 30,
                                crossAxisSpacing: 10,
                                maxCrossAxisExtent: 200),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Details(ep: EmpList[index]),
                              ));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: const [
                                    BoxShadow(blurRadius: 1, spreadRadius: 1)
                                  ],
                                  border: Border.all(
                                    style: BorderStyle.solid,
                                  )),
                              height: 300,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: Image.network(
                                                      EmpList[index].image)
                                                  .image),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15))),
                                    ),
                                    ListTile(
                                        title: Txts(
                                          // isOverflow: false,
                                          title: EmpList[index]
                                              .title
                                              .split(" ")[0],
                                        ),
                                        subtitle: Txts(
                                            title:
                                                "\$ ${EmpList[index].price}"))
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Txts(
                      title: '${snapshot.error}',
                    ));
                  } else if (snapshot.data == null) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        )
      ],
    );
  }
}
