import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final VoidCallback onTap;
  const CalculatorButton({
    Key? key,
    required this.label,
    this.labelColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 85,
        width: 85,
        decoration: BoxDecoration(
          color: const Color(0xFF22252D),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: labelColor ?? Colors.white, fontSize: 30, fontWeight: (labelColor != null) ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
