import 'package:flutter/material.dart';

class AnimalImageWidget extends StatelessWidget {
  const AnimalImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const imageType = 'good';
    final assets = [
      'assets/$imageType/buck.jpeg',
      'assets/$imageType/dog.jpeg',
      'assets/$imageType/flamingo.jpeg',
      'assets/$imageType/fox.jpeg',
      'assets/$imageType/gorilla.jpeg',
      'assets/$imageType/horse.jpeg',
      'assets/$imageType/husky.jpeg',
      'assets/$imageType/kangaroo.jpeg',
      'assets/$imageType/lion.jpeg',
      'assets/$imageType/parrot.jpeg',
      'assets/$imageType/puppy.jpeg',
      'assets/$imageType/rooster.jpeg',
      'assets/$imageType/white_tiger.jpeg',
      'assets/$imageType/yak.jpeg',
      'assets/$imageType/zebra.jpeg',
    ];

    return GridView.builder(
      itemCount: assets.length,
      itemBuilder: (context, index) {
        final asset = assets[index % (assets.length - 1)];
        final title = asset.split('.').first.split('/').last;

        return Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  asset,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                title.toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
    );
  }
}
