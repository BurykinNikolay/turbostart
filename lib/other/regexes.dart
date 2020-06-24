class Regexes {
  static final amountWithPointAnd2DigitsAfter = RegExp(r'^[0-9]*(\.[0-9]{0,2})?$');

  static final amountWithWhitespacesAndPointAnd2DigitsAfter = RegExp(r'^[0-9\s]*(\.[0-9]{0,2})?$');

  static final amountWithThousandsFormatAndPoint = RegExp(r'^(?!0+\.00)(?=.{1,9}(\.|$))(?!0(?!\.))\d{1,3}(,\d{3})*(\.\d+)?$');

  static final comaAndDigits = RegExp(r'[\s\b|\b\s\,]*');

  static final digitsOnly = RegExp(r'^[0-9]*?$');
  static final digits = RegExp(r'^[0-9]');
  static final emptyString = RegExp(r'^$');
  static final digitsAndWhiteSpaces = RegExp(r'[0-9\s\b|\b\s]*?$');

  static final whitespaces = RegExp(r'\s\b|\b\s');

  static final amountWithPointAndMoreThan2DigitsAfter = RegExp(r'[0-9]*(\.[0-9]{3,})$');

  static final spaces = RegExp(r'\s');
  static final moneyDot = RegExp(r',');
  static final dot = RegExp(r'.');
  static final phone = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  static final email =  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}
