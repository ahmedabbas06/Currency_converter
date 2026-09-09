class ExchangeRateModel {
  final String result;
  final String documentation;
  final String termsOfUse;
  final int timeLastUpdateUnix;
  final String timeLastUpdateUtc;
  final int timeNextUpdateUnix;
  final String timeNextUpdateUtc;
  final String baseCode;
  final Map<String, double> conversionRates;

  ExchangeRateModel({
    required this.result,
    required this.documentation,
    required this.termsOfUse,
    required this.timeLastUpdateUnix,
    required this.timeLastUpdateUtc,
    required this.timeNextUpdateUnix,
    required this.timeNextUpdateUtc,
    required this.baseCode,
    required this.conversionRates,
  });

  factory ExchangeRateModel.fromJson(Map<String, dynamic> json) {
    final ratesRaw = json['conversion_rates'];
    final Map<String, double> rates = {};

    if (ratesRaw is Map<String, dynamic>) {
      ratesRaw.forEach((key, value) {
        if (value is num) {
          rates[key] = value.toDouble();
        }
      });
    }

    return ExchangeRateModel(
      result: json['result']?.toString() ?? '',
      documentation: json['documentation']?.toString() ?? '',
      termsOfUse: json['terms_of_use']?.toString() ?? '',
      timeLastUpdateUnix: (json['time_last_update_unix'] as num?)?.toInt() ?? 0,
      timeLastUpdateUtc: json['time_last_update_utc']?.toString() ?? '',
      timeNextUpdateUnix: (json['time_next_update_unix'] as num?)?.toInt() ?? 0,
      timeNextUpdateUtc: json['time_next_update_utc']?.toString() ?? '',
      baseCode: json['base_code']?.toString() ?? '',
      conversionRates: rates,
    );
  }
}
