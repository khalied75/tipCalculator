import 'dart:ui';

import 'package:flutter/material.dart';

class PersnolalCount extends StatelessWidget {
  const PersnolalCount({
    super.key,
    required this.personsCount,
    required this.onIncrease,
    required this.onDecrease,
  });
  final VoidCallback onIncrease;
  final VoidCallback onDecrease; 
  final int personsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed:onDecrease,
          icon: const Icon(Icons.remove),
        ),
        Text(
          personsCount.toString(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: onIncrease,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}