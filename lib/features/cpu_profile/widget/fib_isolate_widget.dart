import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:odometer/odometer.dart';

class FibonacciWithIsolatesWidget extends StatefulWidget {
  const FibonacciWithIsolatesWidget({super.key});

  @override
  State<FibonacciWithIsolatesWidget> createState() =>
      _FibonacciWithIsolatesWidgetState();
}

class _FibonacciWithIsolatesWidgetState
    extends State<FibonacciWithIsolatesWidget> {
  bool showWidget = false;

  int number = 25;
  int result = 0;

  bool isCalculating = false;

  void startCalculating() {
    setState(() {
      isCalculating = true;
    });
  }

  void stopCalculating() {
    setState(() {
      isCalculating = false;
    });
  }

  void nextFibonacci() async {
    startCalculating();
    result = await compute(fibonacci, number);
    number++;
    stopCalculating();
  }

  @override
  void initState() {
    super.initState();
    result = fibonacci(number + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title:
              showWidget ? const Text('With Isolates') : const Text('#######'),
          value: showWidget,
          onChanged: (value) {
            setState(() {
              showWidget = value;
            });
          },
        ),
        Flexible(
          child: showWidget
              ? Column(
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'fibonacci(${number - 1})',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          if (isCalculating)
                            const Center(child: LinearProgressIndicator())
                          else
                            const SizedBox(height: 4),
                          AnimatedSlideOdometerNumber(
                            odometerNumber: OdometerNumber(result),
                            duration: const Duration(seconds: 1),
                            numberTextStyle: GoogleFonts.pressStart2p(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                            letterWidth: 32,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(56.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: nextFibonacci,
                            child: const Icon(Icons.add),
                          ),
                          const SizedBox(width: 16),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                number = 42;
                                nextFibonacci();
                              });
                            },
                            child: const Icon(Icons.refresh),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Container(),
        ),
      ],
    );
  }
}

int fibonacci(int n) {
  if (n <= 2) return 1;
  return fibonacci(n - 1) + fibonacci(n - 2);
}
