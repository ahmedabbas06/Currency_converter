import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Coin extends StatelessWidget {
  final IconData icon;
  final Color color;

  const Coin({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.r,
      height: 50.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: const Color(0x25000000),
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white, size: 28.r),
    );
  }
}
