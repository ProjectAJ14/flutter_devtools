import 'package:flutter/material.dart';

import '../../utils/widgets/custom_app_bar.dart';
import 'widget/fib_isolate_widget.dart';
import 'widget/fib_widget.dart';

class CpuProfileScreen extends StatelessWidget {
  const CpuProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'CPU Profiler'),
      body: Column(
        children: [
          Flexible(child: FibonacciWidget()),
          Flexible(child: FibonacciWithIsolatesWidget()),
        ],
      ),
    );
  }
}
