import 'package:zoo/domains/models/animal.dart';
import 'package:zoo/domains/visitors/animalVisitor.dart';

class Monkey extends Animal{
  String comida;

  Monkey({
    required this.comida,
    required super.name,
    required super.especie,
    required super.age
  });

  @override
  String sound() {
    print('Ooh ooh aah aah');
    return 'Ooh ooh aah aah';
  }

  @override
  String accept(AnimalVisitor visitor) {
    return visitor.visitMonkey(this);
  }
}