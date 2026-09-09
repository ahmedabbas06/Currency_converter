import 'package:flutter/material.dart';

class Landmark extends StatelessWidget {
  final IconData icon;
  final double size;

  const Landmark({super.key, required this.icon, required this.size});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: const Color(0xFFD1E1F7));
  }
}
