import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

import '../../utils/widgets/custom_app_bar.dart';

class PerformanceScreen extends StatelessWidget {
  const PerformanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int itemCount = 100;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Performance'),
      body: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            if (index == 25) {
              return ExpensiveWidget(index: index);
            }
            return PerformanceWidget(index: index);
          }),
    );
  }
}

class ExpensiveWidget extends StatelessWidget {
  const ExpensiveWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    int number = fibonacci(index);
    return ListTile(
      title: Text(faker.lorem.sentence()),
      subtitle: Text(faker.lorem.sentence()),
      trailing: Text(
        number.toString(),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class PerformanceWidget extends StatelessWidget {
  const PerformanceWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(faker.lorem.sentence()),
      subtitle: Text(faker.lorem.sentence()),
      trailing: Text(
        index.toString(),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// fibonacci

int fibonacci(int n, {int depth = 0}) {
  debugPrint('fibonacci $n depth: $depth');
  if (n <= 1) {
    return n;
  } else {
    final result =
        fibonacci(n - 1, depth: depth + 1) + fibonacci(n - 2, depth: depth + 1);
    return result;
  }
}
