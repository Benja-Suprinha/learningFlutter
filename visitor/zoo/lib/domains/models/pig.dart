import 'package:zoo/domains/models/animal.dart';
import 'package:zoo/domains/visitors/animalVisitor.dart';

class Pig extends Animal{
  String comida;

  Pig({
    required this.comida,
    required super.name,
    required super.especie,
    required super.age
  });

  @override
  String sound() {
    print('Oink oink');
    return 'Oink oink';
  }

  @override
  String accept(AnimalVisitor visitor) {
    return visitor.visitPig(this);
  }
}