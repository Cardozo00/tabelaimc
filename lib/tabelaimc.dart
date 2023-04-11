import 'dart:io';

import 'package:tabelaimc/exception/nomeinvalido.dart';
import 'package:tabelaimc/utils.dart';

class Paciente {
  String nome;
  double peso;
  double altura;

  Paciente(this.nome, this.peso, this.altura);

  String resultadoImc() {
    double imc = peso / (altura * altura);

    if (imc < 16) {
      print("Você está com magreza grave");
    }
    if (imc >= 16 && imc < 17) {
      print("Você está com magreza moderada");
    }
    if (imc >= 17 && imc < 18.5) {
      print("Você está com magreza leve");
    }
    if (imc >= 18.5 && imc < 25) {
      print("Você está saudável");
    }
    if (imc >= 25 && imc < 30) {
      print("Você está com sobrepeso");
    }
    if (imc >= 30 && imc < 35) {
      print("Você está com obesidade grau 1");
    }
    if (imc >= 35 && imc < 40) {
      print("Você está com obesidade grau 2 (severa)");
    }
    if (imc >= 40) {
      print("Você está com obesidade grau 3 (mórbida)");
    }

    double imcString = imc;

    return imcString.toStringAsFixed(2);
  }
}

void executar() {
  print("Bem vindo a sua calculadora de imc");

  String nome = Utils.lerConsoleComTexto("Digite seu nome:");
  try {
    if (nome.trim() == "") {
      throw NomeInvalido();
    }
  } on NomeInvalido {
    nome = "Sem Nome";
    print(NomeInvalido);
    exit(0);
  } catch (e) {
    print(e);
    exit(0);
  }

  double? peso =
      Utils.lerDoubleComTextoComSaida("Digite seu peso ou S para sair ", "S");

  double? altura =
      Utils.lerDoubleComTextoComSaida("Digite sua altura ou S para sair ", "S");

  var paciente = Paciente(nome, peso!, altura!);

  print("${paciente.nome} seu imc é de ${paciente.resultadoImc()}");
}
