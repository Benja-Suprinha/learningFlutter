import 'package:zoo/domains/models/animal.dart';
import 'package:zoo/domains/visitors/animalVisitor.dart';

class Lyon extends Animal {
  String comida;

  Lyon({
    required this.comida,
    required super.name,
    required super.especie,
    required super.age
  });

  @override
  String sound() {
    print('Roar');
    return 'Roar';
  }

  @override
  String accept(AnimalVisitor visitor) {
    return visitor.visitLyon(this);
  }

}