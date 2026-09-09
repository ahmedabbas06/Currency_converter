import 'package:flutter/material.dart';

import '../api_service/api_service.dart';
import '../models/currency_model.dart';

enum CurrencyStatus { initial, loading, success, error }

class CurrencyController extends ChangeNotifier {
  final ApiService apiService = ApiService();

  ExchangeRateModel? exchangeRateModel;

  String sourceCurrency = 'USD';
  String sourceFlag = '🇺🇸';

  String targetCurrency = 'EGP';
  String targetFlag = '🇪🇬';

  double amount = 1.0;
  double convertedAmount = 0.0;
  double currentRate = 0.0;
  String lastUpdated = '';

  CurrencyStatus status = CurrencyStatus.initial;
  String errorMessage = '';

  void setAmount(double newAmount) {
    amount = newAmount;
    notifyListeners();
  }

  void setSourceCurrency(String code, String name, String flag) {
    sourceCurrency = code;
    sourceFlag = flag;
    fetchRates();
  }

  void setTargetCurrency(String code, String name, String flag) {
    targetCurrency = code;
    targetFlag = flag;
    notifyListeners();
  }

  void swapCurrencies() {
    final tempCode = sourceCurrency;
    final tempFlag = sourceFlag;

    sourceCurrency = targetCurrency;
    sourceFlag = targetFlag;

    targetCurrency = tempCode;
    targetFlag = tempFlag;

    fetchRates();
  }

  List<String> currencies = [];

  Future<void> fetchRates() async {
    status = CurrencyStatus.loading;
    errorMessage = '';
    notifyListeners();

    try {
      exchangeRateModel = await apiService.fetchExchangeRates(sourceCurrency);
      currencies = exchangeRateModel?.conversionRates.keys.toList() ?? [];
      lastUpdated = exchangeRateModel?.timeLastUpdateUtc ?? '';
      calculateConversion();
      status = CurrencyStatus.success;
    } catch (e) {
      status = CurrencyStatus.error;
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  void calculateConversion() {
    if (exchangeRateModel != null) {
      final rate = exchangeRateModel!.conversionRates[targetCurrency] ?? 0.0;

      currentRate = rate;
      convertedAmount = amount * rate;
    }
  }

  void convert() {
    calculateConversion();
    notifyListeners();
  }
}
