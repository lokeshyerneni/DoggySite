// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DogDetails extends StatefulWidget {
  final dog_name;
  final dog_age;
  final dog_breed;
  final dog_category;
  final dog_description;
  final dog_photoLink;

  DogDetails(
      {this.dog_name,
      this.dog_age,
      this.dog_breed,
      this.dog_category,
      this.dog_description,
      this.dog_photoLink});

  @override
  _DogDetailsState createState() => _DogDetailsState();
}

class _DogDetailsState extends State<DogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 5,
        title: Text("Pawzzz"),
      ),
      body: Row(
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                const ListTile(
                  title: Text(
                    "Information",
                  ),
                  leading: Icon(FontAwesomeIcons.infoCircle),
                ),
                ListTile(
                  title: Text("Name: ${widget.dog_name}"),
                ),
                const Divider(
                  color: Colors.blueAccent,
                  thickness: 2,
                ),
                ListTile(
                  title: Text("Age: ${widget.dog_age}"),
                ),
                const Divider(
                  color: Colors.blueAccent,
                  thickness: 2,
                ),
                ListTile(
                  title: Text("Breed: ${widget.dog_breed}"),
                ),
                const Divider(
                  color: Colors.blueAccent,
                  thickness: 2,
                ),
                ListTile(
                  title: Text("Category: ${widget.dog_category}"),
                ),
                const Divider(
                  color: Colors.blueAccent,
                  thickness: 2,
                ),
                ListTile(
                  title: Text("Description: ${widget.dog_description}"),
                ),
                const Divider(
                  color: Colors.blueAccent,
                  thickness: 2,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: const ListTile(
                                  title: Text(
                                      "Your purchase has been added to the cart."),
                                  subtitle: Text(
                                      "I will deliver when I feel like it"),
                                ),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Ok"))
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text("Add to Shopping Cart"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.blueAccent,
            width: 2,
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Image.network(
              widget.dog_photoLink,
            ),
          ),
        ],
      ),
    );
  }
}
