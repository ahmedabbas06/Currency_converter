import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../Controllers/currency_controller.dart';
import '../constants/Flag_constant.dart';
import '../widgets/CurrencyCard.dart';
import '../widgets/ExchangeRateCard.dart';
import '../widgets/SwapButton.dart';
import '../widgets/bottomSection.dart';
import '../widgets/convert_button.dart';
import '../widgets/header.dart';

class CurrencyConverterScreen extends StatelessWidget {
  const CurrencyConverterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CurrencyController>();
 
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24.w, 20.h, 24.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(),

              SizedBox(height: 34.h),

              CurrencyCard(
                title: 'YOU SEND',
                amount: controller.amount.toString(),
                currency: controller.sourceCurrency,
                flag: controller.sourceFlag,
                currencies: controller.currencies,

                onCurrencyChanged: (value) {
                  controller.setSourceCurrency(
                    value,
                    '',
                    AppFlags.getFlag(value),
                  );
                },

                onChanged: (val) {
                  final parsed = double.tryParse(val);
                  if (parsed != null) {
                    controller.setAmount(parsed);
                  }
                },
              ),

              GestureDetector(
                onTap: () {
                  controller.swapCurrencies();
                },
                child: const SwapButton(),
              ),

              CurrencyCard(
                title: 'YOU GET',
                amount: controller.convertedAmount.toStringAsFixed(2),
                currency: controller.targetCurrency,
                flag: controller.targetFlag,
                readOnly: true,
                currencies: controller.currencies,

                onCurrencyChanged: (value) {
                  controller.setTargetCurrency(
                    value,
                    '',
                    AppFlags.getFlag(value),
                  );
                },
              ),

              SizedBox(height: 28.h),

              const ExchangeRateCard(),

              SizedBox(height: 28.h),

              convert_button(controller: controller),

              SizedBox(height: 38.h),

              const BottomSection(),
            ],
          ),
        ),
      ),
    );
  }
}
