import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/currency_constants.dart';

class CurrencyDropdown extends StatelessWidget {
  const CurrencyDropdown({
    super.key,
    required this.currencies,
    required this.currency,
    required this.onCurrencyChanged,
  });

  final List<String> currencies;
  final String currency;
  final ValueChanged<String>? onCurrencyChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: currencies.contains(currency) ? currency : null,
      underline: const SizedBox(),
      items: currencies.map((code) {
        return DropdownMenuItem(
          value: code,
          child: Row(
            children: [
              Text(
                CurrencyConstants.currencies[code]?['flag'] ?? '🌐',
                style: TextStyle(fontSize: 20.sp),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  CurrencyConstants.currencies[code]?['name'] ?? code,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF101A2C),
                  ),
                ),
              ),
              Text(
                code,
                style: TextStyle(fontSize: 13.sp, color: Colors.grey),
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          onCurrencyChanged?.call(value);
        }
      },
    );
  }
}
