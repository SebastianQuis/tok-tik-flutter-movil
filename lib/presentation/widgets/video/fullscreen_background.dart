import 'package:flutter/material.dart';

class FullScreenBackground extends StatelessWidget {
  const FullScreenBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.8,
              1.0
            ],
            colors: [
              Colors.transparent,
              Colors.black54
            ]
          )
        ),
      ),
    );
  }
}