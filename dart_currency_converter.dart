import 'dart:io';

void main() {
  currencyConverter();
}
void currencyConverter() {
  Map<String, Map<String, double>> exchangeRates = {
    'USD': {'buy': 83.5, 'sell': 84.0},
    'EUR': {'buy': 100.0, 'sell': 101.0},
    'RUB': {'buy': 1.1, 'sell': 1.2},
    'KZT': {'buy': 0.2, 'sell': 0.22},
    'CNY': {'buy': 12.0, 'sell': 12.5},
    'TRY': {'buy': 9.0, 'sell': 9.3},
  };
  print('Курс покупки и продажи валют к сомам:');
  exchangeRates.forEach((currency, rates) {
    print('$currency: покупка = ${rates['buy']}, продажа = ${rates['sell']}');
  });
  print('\nВыберите тип операции:');
  print('1. Обмен другой валюты на сомы');
  print('2. Обмен сомов на другую валюту');
  int operationType = int.parse(stdin.readLineSync()!);

  print('\nВыберите валюту:');
  exchangeRates.keys.forEach((currency) => print(currency));
  String currency = stdin.readLineSync()!.toUpperCase();

  if (!exchangeRates.containsKey(currency)) {
    print('Некорректная валюта');
    return;
  }
  print('\nВведите сумму для обмена:');
  double amount = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

  double result;

  if (operationType == 1) {
    result = amount * exchangeRates[currency]!['buy']!;
    print('\nЗа $amount $currency вы получите $result сомов.');
  } else if (operationType == 2) {
    result = amount / exchangeRates[currency]!['sell']!;
    print('\nДля покупки $amount $currency вам нужно $result сомов.');
  } else {
    print('Некорректный тип операции');
  }
}
