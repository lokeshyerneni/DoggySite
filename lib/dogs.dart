// ignore_for_file: use_key_in_widget_constructors

import 'dart:convert';

import 'package:dogtradingapp/dogDetails.dart';
import 'package:dogtradingapp/dogfile.dart';
import 'package:dogtradingapp/main.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:flutter/services.dart' as rootBundle;

bool isIphone(BuildContext context) =>
    MediaQuery.of(context).size.width < iphoneLimit;

bool isIpad(BuildContext context) =>
    MediaQuery.of(context).size.width < ipadLimit &&
    MediaQuery.of(context).size.width >= iphoneLimit;

bool isMacbook(BuildContext context) =>
    MediaQuery.of(context).size.width >= ipadLimit;

int iphoneLimit = 910;
int ipadLimit = 1200;

// ignore: must_be_immutable
class Dogs extends StatefulWidget {
  List breed;
  List age;

  Dogs({this.breed = const [], this.age = const []});

  @override
  _DogsState createState() => _DogsState();
}

class _DogsState extends State<Dogs> {
  Future<List<Dog>> readJsonData() async {
    final jsonData = await rootBundle.rootBundle.loadString("assets/dogs.json");
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => Dog.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder(
          future: readJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(child: Text("${data.error}"));
            } else if (data.hasData) {
              var items = data.data as List<Dog>;
              if (isIphone(context)) {
                List<Dog> gridSize = [];
                if (widget.breed.isNotEmpty) {
                  for (int x = 0; x < items.length; x++) {
                    if (widget.breed.contains(items[x].breed)) {
                      gridSize.add(items[x]);
                    }
                  }
                }
                if (widget.age.isNotEmpty) {
                  for (int x = 0; x < items.length; x++) {
                    if (widget.age.contains(items[x].age)) {
                      gridSize.add(items[x]);
                    }
                  }
                }
                if (widget.breed.isNotEmpty && widget.age.isNotEmpty) {
                  gridSize.clear();
                  for (int x = 0; x < items.length; x++) {
                    if (widget.age.contains(items[x].age) &&
                        widget.breed.contains(items[x].breed)) {
                      gridSize.add(items[x]);
                    } else if (widget.age.contains(items[x].age)) {
                      gridSize.add(items[x]);
                    } else if (widget.breed.contains(items[x].breed)) {
                      gridSize.add(items[x]);
                    }
                  }
                }
                if (widget.age.isEmpty && widget.breed.isEmpty) {
                  gridSize = items;
                }

                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: items == null
                        ? 0
                        : gridSize.length, //as per your requirement

                    itemBuilder: (BuildContext context, int index) {
                      // if (widget.breed.isNotEmpty || widget.age.isNotEmpty) {
                      //   if (widget.breed.contains(items[index].breed) ||
                      //       widget.age.contains(items[index].breed)) {
                      //     return SingleDog(
                      //         dog_name: gridSize[index].name,
                      //         dog_age: gridSize[index].age,
                      //         dog_breed: gridSize[index].breed,
                      //         dog_category: gridSize[index].category,
                      //         dog_description: gridSize[index].description,
                      //         dog_photoLink: gridSize[index].photoLink);
                      //   }
                      // } else {
                      //   return SingleDog(
                      //       dog_name: items[index].name,
                      //       dog_age: items[index].age,
                      //       dog_breed: items[index].breed,
                      //       dog_category: items[index].category,
                      //       dog_description: items[index].description,
                      //       dog_photoLink: items[index].photoLink);
                      // }
                      // return Container();
                      return SingleDog(
                          dog_name: gridSize[index].name,
                          dog_age: gridSize[index].age,
                          dog_breed: gridSize[index].breed,
                          dog_category: gridSize[index].category,
                          dog_description: gridSize[index].description,
                          dog_photoLink: gridSize[index].photoLink);
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: (1 / 1),
                    ));
              }
              if (isIpad(context)) {
                List<Dog> gridSize = [];
                if (widget.breed.isNotEmpty) {
                  for (int x = 0; x < items.length; x++) {
                    if (widget.breed.contains(items[x].breed)) {
                      gridSize.add(items[x]);
                    }
                  }
                }
                if (widget.age.isNotEmpty) {
                  for (int x = 0; x < items.length; x++) {
                    if (widget.age.contains(items[x].age)) {
                      gridSize.add(items[x]);
                    }
                  }
                }
                if (widget.breed.isNotEmpty && widget.age.isNotEmpty) {
                  gridSize.clear();
                  for (int x = 0; x < items.length; x++) {
                    if (widget.age.contains(items[x].age) &&
                        widget.breed.contains(items[x].breed)) {
                      gridSize.add(items[x]);
                    } else if (widget.age.contains(items[x].age)) {
                      gridSize.add(items[x]);
                    } else if (widget.breed.contains(items[x].breed)) {
                      gridSize.add(items[x]);
                    }
                  }
                }
                if (widget.age.isEmpty && widget.breed.isEmpty) {
                  gridSize = items;
                }

                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: items == null
                        ? 0
                        : gridSize.length, //as per your requirement

                    itemBuilder: (BuildContext context, int index) {
                      // if (widget.breed.isNotEmpty || widget.age.isNotEmpty) {
                      //   if (widget.breed.contains(items[index].breed) ||
                      //       widget.age.contains(items[index].breed)) {
                      //     return SingleDog(
                      //         dog_name: gridSize[index].name,
                      //         dog_age: gridSize[index].age,
                      //         dog_breed: gridSize[index].breed,
                      //         dog_category: gridSize[index].category,
                      //         dog_description: gridSize[index].description,
                      //         dog_photoLink: gridSize[index].photoLink);
                      //   }
                      // } else {
                      //   return SingleDog(
                      //       dog_name: items[index].name,
                      //       dog_age: items[index].age,
                      //       dog_breed: items[index].breed,
                      //       dog_category: items[index].category,
                      //       dog_description: items[index].description,
                      //       dog_photoLink: items[index].photoLink);
                      // }
                      // return Container();
                      return SingleDog(
                        dog_name: gridSize[index].name,
                        dog_age: gridSize[index].age,
                        dog_breed: gridSize[index].breed,
                        dog_category: gridSize[index].category,
                        dog_description: gridSize[index].description,
                        dog_photoLink: gridSize[index].photoLink,
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (1 / 1),
                    ));
              } else {
                List<Dog> gridSize = [];
                if (widget.breed.isNotEmpty) {
                  for (int x = 0; x < items.length; x++) {
                    if (widget.breed.contains(items[x].breed)) {
                      gridSize.add(items[x]);
                    }
                  }
                }
                if (widget.age.isNotEmpty) {
                  for (int x = 0; x < items.length; x++) {
                    if (widget.age.contains(items[x].age)) {
                      gridSize.add(items[x]);
                    }
                  }
                }
                if (widget.breed.isNotEmpty && widget.age.isNotEmpty) {
                  gridSize.clear();
                  for (int x = 0; x < items.length; x++) {
                    if (widget.age.contains(items[x].age) &&
                        widget.breed.contains(items[x].breed)) {
                      gridSize.add(items[x]);
                    }
                  }
                }
                if (widget.age.isEmpty && widget.breed.isEmpty) {
                  gridSize = items;
                }

                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: items == null
                        ? 0
                        : gridSize.length, //as per your requirement

                    itemBuilder: (BuildContext context, int index) {
                      // if (widget.breed.isNotEmpty || widget.age.isNotEmpty) {
                      //   if (widget.breed.contains(items[index].breed) ||
                      //       widget.age.contains(items[index].breed)) {
                      //     return SingleDog(
                      //         dog_name: gridSize[index].name,
                      //         dog_age: gridSize[index].age,
                      //         dog_breed: gridSize[index].breed,
                      //         dog_category: gridSize[index].category,
                      //         dog_description: gridSize[index].description,
                      //         dog_photoLink: gridSize[index].photoLink);
                      //   }
                      // } else {
                      //   return SingleDog(
                      //       dog_name: items[index].name,
                      //       dog_age: items[index].age,
                      //       dog_breed: items[index].breed,
                      //       dog_category: items[index].category,
                      //       dog_description: items[index].description,
                      //       dog_photoLink: items[index].photoLink);
                      // }
                      // return Container();
                      return SingleDog(
                        dog_name: gridSize[index].name,
                        dog_age: gridSize[index].age,
                        dog_breed: gridSize[index].breed,
                        dog_category: gridSize[index].category,
                        dog_description: gridSize[index].description,
                        dog_photoLink: gridSize[index].photoLink,
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (1 / 1),
                    ));
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
