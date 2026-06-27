import '../constants/denominations.dart';
import '../models/denomination.dart';

List<Denomination> calculateChange(int amount) {
  var remaining = amount;
  final result = <Denomination>[];

  for (final value in takaDenominations) {
    final count = remaining ~/ value;
    result.add(Denomination(value: value, count: count));
    remaining -= count * value;
  }

  return result;
}
