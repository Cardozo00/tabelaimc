class NomeInvalido implements Exception {
  String error() => "Nome Invalido";

  @override
  String toString() {
    return "NomeInvalido: ${error()}";
  }
}
