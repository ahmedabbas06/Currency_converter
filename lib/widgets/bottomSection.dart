import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/Landmark.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 185.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 48.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Landmark(icon: Icons.account_balance, size: 65.r),
                Landmark(icon: Icons.castle, size: 70.r),
                Landmark(icon: Icons.location_city, size: 75.r),
                Landmark(icon: Icons.account_balance, size: 70.r),
              ],
            ),
          ),
          Positioned(
            bottom: 20.h,
            child: Text(
              'ONE WORLD. MANY CURRENCIES.',
              style: TextStyle(
                fontSize: 13.sp,
                letterSpacing: 2.5.w,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF8BA4C9),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Text(
              'developer: Ahemd Abbas 👑',
              style: TextStyle(
                fontSize: 13.sp,
                letterSpacing: 2.5.w,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF8BA4C9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
