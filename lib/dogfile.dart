// ignore_for_file: file_names

class Dog {
  String? name;
  int? age;
  String? breed;
  String? description;
  String? photoLink;
  String? category;

  Dog({
    this.name,
    this.age,
    this.breed,
    this.category,
    this.description,
    this.photoLink,
  });

  Dog.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    age = json["age"];
    breed = json["breed"];
    category = json["category"];
    description = json["description"];
    photoLink = json["photo"];
  }
}
