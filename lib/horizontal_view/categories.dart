import 'package:flutter/material.dart';

class DogCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        height: 80.0,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                primary: Colors.blueAccent),
            child: const Text(
              'Corgi',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: () {
              
            },
          ),
          const SizedBox(
            width: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Shiba',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Poodle',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'German Shepherd',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Chihuahua',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 30,
          ),
        ]),
      ),
    );
  }
}
