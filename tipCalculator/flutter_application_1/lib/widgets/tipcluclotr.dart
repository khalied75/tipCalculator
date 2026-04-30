 
 
 
 
 import 'package:flutter/material.dart';

class tipcaluctor extends StatelessWidget {
  const tipcaluctor({
    super.key,
    required this.tipprecentge,
    required this.onChanged,
  });

  final double tipprecentge;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: tipprecentge,
      onChanged: onChanged,
      min: 0,
      max: 1,
      label: "${(tipprecentge * 100).toStringAsFixed(1)}%",
      divisions: 5,
    );
  }
}
