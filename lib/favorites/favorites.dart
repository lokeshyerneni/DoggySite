import 'dart:convert';

import 'package:dogtradingapp/dogfile.dart';
import 'package:dogtradingapp/dogs.dart';
import 'package:dogtradingapp/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class Favorites extends StatefulWidget {
  Set<Dog> faveDogs;

  Favorites({this.faveDogs = const {}});
  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  Future<List<Dog>> readJsonData() async {
    final jsonData = await rootBundle.rootBundle.loadString("assets/dogs.json");
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => Dog.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 5,
        title: Text("Pawzzz"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FutureBuilder(
            future: readJsonData(),
            builder: (context, data) {
              if (data.hasError) {
                return Center(child: Text("${data.error}"));
              } else if (data.hasData) {
                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: widget.faveDogs.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (widget.faveDogs.isEmpty) {
                      return const Center(
                        child: Text("No dogs here"),
                      );
                    } else {
                      return SingleDog(
                        dog_name: widget.faveDogs.elementAt(index).name,
                        dog_age: widget.faveDogs.elementAt(index).age,
                        dog_breed: widget.faveDogs.elementAt(index).breed,
                        dog_category: widget.faveDogs.elementAt(index).category,
                        dog_description: widget.faveDogs.elementAt(index).description,
                        dog_photoLink: widget.faveDogs.elementAt(index).photoLink,
                        enableLike: false,
                      );
                    }
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (1 / 1),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
