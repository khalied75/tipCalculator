import 'package:flutter/material.dart';

class TotalperPerson extends StatelessWidget {
  const TotalperPerson({
    super.key,
    required this.LocalTheme,
    required this.style,
    required this.TotalPerPerson,
  });

  final ThemeData LocalTheme;
  final TextStyle style;
  final double TotalPerPerson;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: LocalTheme.colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text("Total per Person", style: style),
          Text(
            "\$${TotalPerPerson.toStringAsFixed(2)}",
            style: style.copyWith(fontSize: 40),
          ),
        ],
      ),
    );
  }
}
