import 'package:flutter/material.dart';
import 'package:zoo/domains/models/animal.dart';
import 'package:zoo/domains/models/lyon.dart';
import 'package:zoo/domains/models/monkey.dart';
import 'package:zoo/domains/models/pig.dart';
import 'package:zoo/domains/visitors/animalVisitor.dart';
import 'package:zoo/domains/visitors/impl/comerImpl.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Animal> animals = [
      Monkey(comida: 'Banana', name: 'George', especie: 'Chimpanzee', age: 5),
      Pig(comida: 'Slop', name: 'Wilbur', especie: 'Pig', age: 3),
      Lyon(comida: 'Meat', name: 'Simba', especie: 'Lyon', age: 2)
    ]; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to the Zoo'),
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
        final Animal animal = animals[index];
        return ListTile(
          title: Text(animal.name),
          subtitle: Text(animal.especie),
          trailing: Text(animal.sound()),
          onTap: () {
            AnimalVisitor visitor = comerImpl();
            String comer = animal.accept(visitor);
            print('The ${animal.especie} ${animal.name} eats $comer');
          },
        );
      }),
    );
  }
}