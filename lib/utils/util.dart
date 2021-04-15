bool isNumeric(String numero) {
  if (numero.isEmpty) return false;

  final parseNumber = num.tryParse(numero);
  return (parseNumber == null) ? false : true;
}
