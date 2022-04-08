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
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF22252D),
              borderRadius: BorderRadius.circular(10000),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                    color: labelColor ?? Colors.white, fontSize: 30, fontWeight: (labelColor != null) ? FontWeight.bold : FontWeight.normal),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
