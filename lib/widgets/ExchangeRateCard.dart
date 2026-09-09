import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Controllers/currency_controller.dart';

class ExchangeRateCard extends StatelessWidget {
  const ExchangeRateCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CurrencyController>();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F8FF),
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: const Color(0xFFDCE9FA)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1 ${controller.sourceCurrency} = '
                  '${controller.currentRate} ${controller.targetCurrency}',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF101A2C),
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Last updated: ${controller.lastUpdated}',
                  style: TextStyle(fontSize: 13.sp, color: const Color(0xFF647895)),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 9.h),
            decoration: BoxDecoration(
              color: const Color(0xFFE2F8ED),
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Row(
              children: [
                Icon(Icons.circle, size: 11.r, color: const Color(0xFF20A464)),
                SizedBox(width: 7.w),
                Text(
                  'Live',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF20A464),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
