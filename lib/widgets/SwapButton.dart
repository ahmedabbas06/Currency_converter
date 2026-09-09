import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwapButton extends StatelessWidget {
  const SwapButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.translate(
        offset: Offset(0, -1.h),
        child: Container(
          width: 68.r,
          height: 68.r,
          decoration: BoxDecoration(
            color: const Color(0xFFF8FBFF),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2.w),
            boxShadow: [
              BoxShadow(
                color: const Color(0x182878F0),
                blurRadius: 14.r,
                offset: Offset(0, 5.h),
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.all(7.r),
            decoration: const BoxDecoration(
              color: Color(0xFF2878F0),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.swap_vert, color: Colors.white, size: 34.r),
          ),
        ),
      ),
    );
  }
}
