import 'package:zoo/domains/models/lyon.dart';
import 'package:zoo/domains/models/monkey.dart';
import 'package:zoo/domains/models/pig.dart';
import 'package:zoo/domains/visitors/animalVisitor.dart';

class comerImpl implements AnimalVisitor{
  @override
  String visitLyon(Lyon lyon) {
    return 'El león come ${lyon.comida}';
  }

  @override
  String visitMonkey(Monkey monkey) {
    return 'El mono come ${monkey.comida}';
  }

  @override
  String visitPig(Pig pig) {
    return 'El cerdo come ${pig.comida}';
  }
}