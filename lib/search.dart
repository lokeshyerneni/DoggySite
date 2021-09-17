import 'package:dogtradingapp/dogDetails.dart';
import 'package:dogtradingapp/dogfile.dart';
import 'package:dogtradingapp/dogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class DogSearch extends SearchDelegate<String> {
  final names = [];
  final ages = [];
  final categories = [];
  final breed = [];
  final descriptions = [];
  final photoLinks = [];
  final recentDogs = [];
  var my_data;
  int counter = 0;
  int globalIndex = 0;

  void getData() async {
    my_data = json.decode(await getJson());
    for (int x = 0; x < my_data.length; x++) {
      names.add(my_data[x]["name"]);
      ages.add(my_data[x]["age"]);
      breed.add(my_data[x]["breed"]);
      categories.add(my_data[x]["category"]);
      descriptions.add(my_data[x]["description"]);
      photoLinks.add(my_data[x]["photo"]);
    }
  }

  Future<String> getJson() {
    return rootBundle.loadString('dogs.json');
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    query = "";
    return DogDetails(
      dog_name: names[globalIndex],
      dog_age: ages[globalIndex],
      dog_breed: breed[globalIndex],
      dog_category: categories[globalIndex],
      dog_description: descriptions[globalIndex],
      dog_photoLink: photoLinks[globalIndex],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (counter == 0) {
      getData();
      counter++;
    }
    final dogSuggestion = query.isEmpty
        ? recentDogs
        : names.where((d) => d.startsWith(query)).toList();
    return ListView.builder(
        itemBuilder: (context, index) => ListTile(
              onTap: () {
                for (int x = 0; x < names.length; x++) {
                  print(dogSuggestion[index]);
                  if (names[x].contains(query) &&
                      dogSuggestion[index].contains(names[x])) {
                    globalIndex = x;
                    if (!recentDogs.contains(names[x])) {
                      recentDogs.add(names[x]);
                    }
                  }
                }
                query = "";
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DogDetails(
                          dog_name: names[globalIndex],
                          dog_age: ages[globalIndex],
                          dog_breed: breed[globalIndex],
                          dog_category: categories[globalIndex],
                          dog_description: descriptions[globalIndex],
                          dog_photoLink: photoLinks[globalIndex],
                        )));
              },
              leading: const Icon(Icons.pets),
              title: RichText(
                text: TextSpan(
                  text: dogSuggestion[index].substring(0, query.length),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                        text: dogSuggestion[index].substring(query.length),
                        style: const TextStyle(
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
            ),
        itemCount: dogSuggestion.length);
  }
}
