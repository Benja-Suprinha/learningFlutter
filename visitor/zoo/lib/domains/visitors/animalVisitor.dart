import 'package:zoo/domains/models/lyon.dart';
import 'package:zoo/domains/models/monkey.dart';
import 'package:zoo/domains/models/pig.dart';

abstract class AnimalVisitor{
  String visitLyon(Lyon lyon);
  String visitMonkey(Monkey monkey);
  String visitPig(Pig pig);
}