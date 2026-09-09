import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/Coin.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225.h,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 35.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Convert',
                  style: TextStyle(
                    fontSize: 48.sp,
                    height: 1,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF101A2C),
                  ),
                ),
                Text(
                  'Currencies',
                  style: TextStyle(
                    fontSize: 45.sp,
                    height: 1.1,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF2878F0),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'Get live exchange rates\naround the world.',
                  style: TextStyle(
                    fontSize: 18.sp,
                    height: 1.35,
                    color: Colors.blueGrey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 20.h,
            child: SizedBox(
              width: 150.r,
              height: 150.r,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 115.r,
                    height: 115.r,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF63D3FF), Color(0xFF2878F0)],
                      ),
                    ),
                    child: Icon(
                      Icons.public,
                      size: 90.r,
                      color: const Color(0xFF75D65B),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 4.w,
                    child: Coin(
                      icon: Icons.attach_money,
                      color: const Color(0xFF2878F0),
                    ),
                  ),
                  Positioned(
                    top: 35.h,
                    right: -2.w,
                    child: Coin(icon: Icons.euro, color: const Color(0xFFFFB52E)),
                  ),
                  Positioned(
                    bottom: 8.h,
                    right: 8.w,
                    child: Coin(
                      icon: Icons.currency_pound,
                      color: const Color(0xFF28B477),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
