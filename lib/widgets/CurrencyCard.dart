import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CurrencyDropdown.dart';

class CurrencyCard extends StatelessWidget {
  final String title;
  final String amount;
  final String currency;
  final String flag;
  final List<String> currencies;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCurrencyChanged;
  final bool readOnly;

  const CurrencyCard({
    super.key,
    required this.title,
    required this.amount,
    required this.currency,
    required this.flag,
    required this.currencies,
    this.onChanged,
    this.onCurrencyChanged,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(22.w, 20.h, 18.w, 20.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .82),
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(color: const Color(0xFFDCE8FA), width: 1.3.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0x0D2878F0),
            blurRadius: 20.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(flag, style: TextStyle(fontSize: 20.sp)),
              SizedBox(width: 6.w),
              SizedBox(
                width: 200.w,
                child: CurrencyDropdown(
                  currencies: currencies,
                  currency: currency,
                  onCurrencyChanged: onCurrencyChanged,
                ),
              ),
              SizedBox(width: 4.w),
            ],
          ),
          SizedBox(height: 12.h),
          TextFormField(
            key: readOnly ? ValueKey(amount) : null,
            initialValue: amount,
            readOnly: readOnly,
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF101A2C),
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter Amount',
              contentPadding: EdgeInsets.zero,
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
