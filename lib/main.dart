// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dogtradingapp/dogDetails.dart';
import 'package:dogtradingapp/dogs.dart';
import 'package:dogtradingapp/favorites/favorites.dart';
import 'package:dogtradingapp/horizontal_view/ageCategories.dart';
import 'package:dogtradingapp/horizontal_view/categories.dart';
import 'package:dogtradingapp/search.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'dogfile.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';

Set<Dog> favorites = {};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Pawzzz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title = 'Pawzzz'});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool corgiPressed = false,
      shibaPressed = false,
      chihuahuaPressed = false,
      poodlePressed = false,
      GerShepPressed = false;
  bool fivePressed = false,
      sixPressed = false,
      sevenPressed = false,
      tenPressed = false,
      fifteenPressed = false;
  int activeIndex = 0;
  List breeds = [];
  List ages = [];
  Future<List<Dog>> readJsonData() async {
    final jsonData = await rootBundle.rootBundle.loadString("assets/dogs.json");
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => Dog.fromJson(e)).toList();
  }

  Widget randomImages(int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          'https://source.unsplash.com/random/400x400?dog&' +
              Random().nextInt(100).toString(),
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          elevation: 5,
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DogSearch());
                },
                icon: const Icon(Icons.search, color: Colors.white)),
          ]),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Lokesh Yerneni"),
              accountEmail: const Text("lokeshyerneni0429@gmail.com"),
              currentAccountPicture: GestureDetector(
                  child: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ))),
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const ListTile(
                title: Text("Home Page"),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("My Account"),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Favorites(
                          faveDogs: favorites,
                        ),
                      ));
                });
              },
              child: const ListTile(
                title: Text("My Favorite Dogs"),
                leading: Icon(Icons.pets),
              ),
            ),
            const Divider(),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text("About"),
                leading: Icon(Icons.help),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
          CarouselSlider.builder(
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              pageSnapping: true,
              enlargeCenterPage: true,
              autoPlayInterval: const Duration(milliseconds: 2000),
            ),
            itemCount: 10,
            itemBuilder: (context, index, realIndex) {
              return randomImages(index);
            },
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Filter by Dog Types",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          //DogCategories(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              height: 80.0,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary:
                        corgiPressed ? Colors.orangeAccent : Colors.blueAccent,
                  ),
                  child: const Text(
                    'Corgi',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      corgiPressed = !corgiPressed;
                      if (corgiPressed) {
                        breeds.add("Corgi");
                      } else {
                        breeds.remove("Corgi");
                      }
                    });
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: shibaPressed
                          ? Colors.orangeAccent
                          : Colors.blueAccent,
                    ),
                    child: const Text(
                      'Shiba',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        shibaPressed = !shibaPressed;
                        if (shibaPressed) {
                          breeds.add("Shiba");
                        } else {
                          breeds.remove("Shiba");
                        }
                      });
                    }),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary:
                        poodlePressed ? Colors.orangeAccent : Colors.blueAccent,
                  ),
                  child: const Text(
                    'Poodle',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    setState(() {
                      poodlePressed = !poodlePressed;
                      if (poodlePressed) {
                        breeds.add("Poodle");
                      } else {
                        breeds.remove("Poodle");
                      }
                    });
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: GerShepPressed
                          ? Colors.orangeAccent
                          : Colors.blueAccent),
                  child: const Text(
                    'German Shepherd',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    setState(() {
                      GerShepPressed = !GerShepPressed;
                      if (GerShepPressed) {
                        breeds.add("German Shepherd");
                      } else {
                        breeds.remove("German Shepherd");
                      }
                    });
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: chihuahuaPressed
                        ? Colors.orangeAccent
                        : Colors.blueAccent,
                  ),
                  child: const Text(
                    'Chihuahua',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    setState(() {
                      chihuahuaPressed = !chihuahuaPressed;
                      if (chihuahuaPressed) {
                        breeds.add("Chihuahua");
                      } else {
                        breeds.remove("Chihuahua");
                      }
                    });
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Filter by Dog Ages",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          //AgeCategories(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Container(
              height: 80.0,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary:
                        fivePressed ? Colors.orangeAccent : Colors.blueAccent,
                  ),
                  child: const Text(
                    '5',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      fivePressed = !fivePressed;
                      if (fivePressed) {
                        ages.add(5);
                      } else {
                        ages.remove(5);
                      }
                    });
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary:
                        sixPressed ? Colors.orangeAccent : Colors.blueAccent,
                  ),
                  child: const Text(
                    '6',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    setState(() {
                      sixPressed = !sixPressed;
                      if (sixPressed) {
                        ages.add(6);
                      } else {
                        ages.remove(6);
                      }
                    });
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary: sevenPressed
                          ? Colors.orangeAccent
                          : Colors.blueAccent,
                    ),
                    child: const Text(
                      '7',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        sevenPressed = !sevenPressed;
                        if (sevenPressed) {
                          ages.add(7);
                        } else {
                          ages.remove(7);
                        }
                      });
                    }),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      primary:
                          tenPressed ? Colors.orangeAccent : Colors.blueAccent,
                    ),
                    child: const Text(
                      '10',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {
                      setState(() {
                        tenPressed = !tenPressed;
                        if (tenPressed) {
                          ages.add(10);
                        } else {
                          ages.remove(10);
                        }
                      });
                    }),
                const SizedBox(
                  width: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    primary: fifteenPressed
                        ? Colors.orangeAccent
                        : Colors.blueAccent,
                  ),
                  child: const Text(
                    '15',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    setState(() {
                      fifteenPressed = !fifteenPressed;
                      if (fifteenPressed) {
                        ages.add(15);
                      } else {
                        ages.remove(15);
                      }
                    });
                  },
                ),
                const SizedBox(
                  width: 30,
                ),
              ]),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Dogs(breed: breeds, age: ages),
        ],
      ),
    );
  }
}

class SingleDog extends StatefulWidget {
  final dog_name;
  final dog_age;
  final dog_breed;
  final dog_category;
  final dog_description;
  final dog_photoLink;
  final enableLike;

  SingleDog(
      {this.dog_name,
      this.dog_age,
      this.dog_breed,
      this.dog_category,
      this.dog_description,
      this.dog_photoLink,
      this.enableLike = true});

  @override
  State<SingleDog> createState() => _SingleDogState();
}

class _SingleDogState extends State<SingleDog> {
  bool iconPressed = false;

  @override
  Widget build(BuildContext context) {
    var heading = widget.dog_name;
    var subheading = 'Breed: ${widget.dog_breed}, Age: ${widget.dog_age}';
    var cardImage = NetworkImage(widget.dog_photoLink);
    var supportingText = widget.dog_description;

    return Card(
        elevation: 4.0,
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DogDetails(
                    dog_name: widget.dog_name,
                    dog_age: widget.dog_age,
                    dog_breed: widget.dog_breed,
                    dog_category: widget.dog_category,
                    dog_description: widget.dog_description,
                    dog_photoLink: widget.dog_photoLink,
                  ))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(heading),
                subtitle: Text(subheading),
                trailing: widget.enableLike
                    ? IconButton(
                        icon: iconPressed
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_outline),
                        onPressed: () {
                          if (iconPressed == false) {
                            favorites.add(
                              Dog(
                                name: widget.dog_name,
                                age: widget.dog_age,
                                category: widget.dog_category,
                                breed: widget.dog_breed,
                                description: widget.dog_description,
                                photoLink: widget.dog_photoLink,
                              ),
                            );
                          } else {
                            for (int x = 0; x < favorites.length; x++) {
                              if (favorites.elementAt(x).name == heading) {
                                favorites.remove(favorites.elementAt(x));
                              }
                            }
                          }

                          setState(() {
                            iconPressed = !iconPressed;
                          });
                        },
                      )
                    : const SizedBox(
                        width: 1,
                        height: 1,
                      ),
              ),
              SizedBox(
                height: 243,
                child: Ink.image(
                  image: cardImage,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
                child: Text(supportingText),
              ),
              ButtonBar(
                children: [
                  TextButton(
                    child: const Text('CONTACT AGENT'),
                    onPressed: () {/* ... */},
                  ),
                  TextButton(
                    child: const Text('LEARN MORE'),
                    onPressed: () {/* ... */},
                  )
                ],
              )
            ],
          ),
        ));
  }
}

const double baseHeight = 650.0;

double screenAwareSize(double size, BuildContext context) {
  return size * MediaQuery.of(context).size.height / baseHeight;
}
