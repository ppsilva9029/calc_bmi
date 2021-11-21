import 'dart:math';

class Calculadora {
  Calculadora({this.estatura, this.peso});

  final estatura;
  final peso;
  late double _imc;

  String calcImc() {
    _imc = peso / pow(estatura / 100, 2);
    return _imc.toStringAsFixed(2);
  }

  String obtNivel() {
    if (_imc < 18) {
      return "Bajo peso";
    } else if (_imc < 25) {
      return "Normal";
    } else if (_imc < 30) {
      return "Sobrepeso";
    } else if (_imc >= 30) {
      return "Obeso";
    }
    return "Introducción inválida";
  }

  String obtInfo() {
    if (_imc < 18) {
      return "Deberías alimentarte un poco mejor.";
    } else if (_imc < 25) {
      return "Todo bien, sigue así :)";
    } else if (_imc < 30) {
      return "Tal vez deberías cuidar un poco más tu alimentación y consumo de calorías, aunque atletas que entrenan mucho pueden tener un IMC alto por una mayor masa muscular.";
    } else if (_imc >= 30) {
      return "Tu IMC es muy alto, deberías consultar a un médico.";
    }
    return "Introducción inválida";
  }
}
