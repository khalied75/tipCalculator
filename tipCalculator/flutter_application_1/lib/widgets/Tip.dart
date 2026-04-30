import 'package:flutter/material.dart';

class Tip extends StatelessWidget {
  const Tip({
    super.key,
    required this.TotalTip,
  });

  final double TotalTip;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Tip",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          "\$${TotalTip.toStringAsFixed(2)}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
