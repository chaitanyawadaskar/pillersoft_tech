extension MapWithIndex<T> on List<T> {
  List<R> mapWithIndex<R>(R Function(T, int i) callback) {
    List<R> result = [];

    for (int i = 0; i < length; i++) {
      R item = callback(this[i], i);
      result.add(item);
    }
    return result;
  }

  Iterable<R> mapWithIndexIterable<R>(R Function(T, int i) callback) {
    return asMap().keys.toList().map((index) => callback(this[index], index));
  }
}

extension Numeric on String {
  bool get isNumeric => num.tryParse(this) != null ? true : false;
}

extension StringExtension on String {
  String firstLetterCap() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String convertKtoNumber() {
    if (toLowerCase().endsWith('k')) {
      return (int.parse(toLowerCase().replaceAll('k', '')) * 1000).toString();
    }
    return this;
  }

  String convertNumberToK() {
    int number = int.parse(this);
    if (number % 1000 == 0) {
      return '${number ~/ 1000}K'; // Using truncating division
    }
    return this;
  }

  String stripHTMLCode() {
    return replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ');
  }
}

extension CurrencyExtension on String {
  String get rupeeWithSlash => '₹ $this /-';
  String get rupee => '₹$this';
}

extension TimeExtension on int {
  String get timeToString => '00 : ${toString().padLeft(2, '0')}';
}
