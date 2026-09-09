import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/currency_model.dart';

class ApiService {
  static const String apiKey = '582a2a8f94fd73539dc79094';

  Future<ExchangeRateModel> fetchExchangeRates(String baseCode) async {
    final url = 'https://v6.exchangerate-api.com/v6/$apiKey/latest/$baseCode';

    final response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body);

    return ExchangeRateModel.fromJson(data);
  }
}
