import 'package:flutter/material.dart';

class MixLoadingWidget extends StatelessWidget {
  const MixLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: const Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFFF4B400),
              ),
              strokeCap: StrokeCap.round,
              strokeAlign: 1,
            ),
            CircularProgressIndicator(
              strokeWidth: 15,
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFFDB4437),
              ),
              strokeCap: StrokeCap.round,
              strokeAlign: 10,
            ),
            CircularProgressIndicator(
              strokeWidth: 10,
              valueColor: AlwaysStoppedAnimation<Color>(
                //4285F4
                Color(0xFF4285F4),
              ),
              strokeCap: StrokeCap.round,
              strokeAlign: 10,
            ),
            CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFF0F9D58),
              ),
              strokeCap: StrokeCap.round,
              strokeAlign: 10,
            ),
          ],
        ),
      ),
    );
  }
}
