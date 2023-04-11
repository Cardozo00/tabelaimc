import 'dart:convert';
import 'dart:io';

class Utils {
  static String lerConsoleComTexto(String texto) {
    print(texto);
    return lerConsole();
  }

  static String lerConsole() {
    return stdin.readLineSync(encoding: utf8) ?? "";
   
  }

  static double? lerDouble() {
    var value = lerConsole();
    try {
      return double.parse(value);
    } catch (e) {
      return null;
    }
  }

  static double? lerDoubleComTextoComSaida(String texto, String valorSaida) {
    do {
      try {
        var value = lerConsoleComTexto(texto);
        if (value == valorSaida) {
          exit(0);
        }
        return double.parse(value);
      } catch (e) {
        print(texto);
      }
    } while (true);
  }

  static double? lerDoubleComTexto(String texto) {
    print(texto);
    return lerDouble();
  }
}
