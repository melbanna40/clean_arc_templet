import 'package:flutter/material.dart';

class LoveWidget extends StatelessWidget {
  const LoveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white),
      ),
      child: const Center(
        child: Icon(Icons.favorite, size: 12, color: Colors.white),
      ),
    );
  }
}
