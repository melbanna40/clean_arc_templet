import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({super.key, this.isActive = false});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.thumb_up,
              color: isActive ? Colors.blue : Colors.grey,
              size: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Like',
              style: TextStyle(color: isActive ? Colors.blue : Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
