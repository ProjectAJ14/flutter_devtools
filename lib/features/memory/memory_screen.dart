import 'dart:async';

import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../utils/widgets/custom_app_bar.dart';

class MemoryScreen extends StatefulWidget {
  const MemoryScreen({super.key});

  @override
  State<MemoryScreen> createState() => _MemoryScreenState();
}

class _MemoryScreenState extends State<MemoryScreen> {
  List<HighMemoryObject> highMemoryObjects = [];

  bool isCreating = false;

  Future<void> createHighMemoryObject() async {
    setState(() {
      isCreating = true;
    });
    highMemoryObjects = await compute(generateHighMemoryObjects, 2);
    setState(() {
      isCreating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Memory'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: createHighMemoryObject,
                child: isCreating
                    ? const CircularProgressIndicator()
                    : const Text('Add High Memory Object'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: highMemoryObjects.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Object $index'),
                      subtitle: Text(
                          'Number of objects: ${highMemoryObjects[index].objects.length}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class HighMemoryObject {
  final List<String> objects;

  HighMemoryObject(this.objects);

  HighMemoryObject.generate({int size = 10})
      : objects = List.generate(
            size, (index) => Faker().lorem.sentences(size).join());
}

List<HighMemoryObject> generateHighMemoryObjects(int value) {
  final highMemoryObjects = <HighMemoryObject>[];
  for (int i = 0; i < value; i++) {
    highMemoryObjects.add(HighMemoryObject.generate());
  }
  return highMemoryObjects;
}
