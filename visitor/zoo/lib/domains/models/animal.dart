import 'package:zoo/domains/visitors/animalVisitor.dart';

abstract class Animal {
  String name;
  String especie;
  int age;

  Animal({
    required this.name,
    required this.especie,
    required this.age
  });

  String sound();

  String accept(AnimalVisitor visitor);

}