import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Controllers/currency_controller.dart';

class convert_button extends StatelessWidget {
  const convert_button({super.key, required this.controller});

  final CurrencyController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 64.h,
      child: ElevatedButton(
        onPressed: controller.status == CurrencyStatus.loading
            ? null
            : () {
                controller.convert();
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2878F0),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.status == CurrencyStatus.loading
                  ? 'Converting...'
                  : 'Convert',
              style: TextStyle(fontSize: 21.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 12.w),
            Icon(Icons.arrow_forward, size: 28.r),
          ],
        ),
      ),
    );
  }
}
