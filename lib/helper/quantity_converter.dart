import 'package:intl/intl.dart';

class QuantityConverter {
  static String convertNum(int num) {
    return NumberFormat.compact(locale: "en_US", explicitSign: false).format(num); // vi_VN
  }
}