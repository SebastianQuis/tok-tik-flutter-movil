

import 'package:intl/intl.dart';

class NumbersFormats {

  // FORMAT A NUMEROS GRANDES!!
  static String numberReadble( int number ) {
    return NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: ''
    ).format(number);
  }


}

