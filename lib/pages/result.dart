import 'package:calc_bmi/src/constants.dart';
import 'package:calc_bmi/src/custom_widgets.dart';
import 'package:flutter/material.dart';

String obtNivel(double imc) {
  if (imc < 18) {
    return "Bajo peso";
  } else if (imc < 25) {
    return "Normal";
  } else if (imc < 30) {
    return "Sobrepeso";
  } else if (imc >= 30) {
    return "Obeso";
  }
  return "Introducción inválida";
}

String obtInfo(double imc) {
  if (imc < 18) {
    return "Deberías alimentarte un poco mejor.";
  } else if (imc < 25) {
    return "Todo bien, sigue así :)";
  } else if (imc < 30) {
    return "Tal vez deberías cuidar un poco más tu alimentación y consumo de calorías, aunque atletas que entrenan mucho pueden tener un IMC alto por una mayor masa muscular.";
  } else if (imc >= 30) {
    return "Tu IMC es muy alto, deberías consultar a un médico.";
  }
  return "Introducción inválida";
}

class ResultPage extends StatelessWidget {
  ResultPage({this.IMC});

  final IMC;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculadora de IMC',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                "Tu resultado es:",
                style: TextStyle(color: ColorPpal, fontSize: 50),
              ),
            )),
            Expanded(
                flex: 4,
                child: ContenedorChido(
                  colorx: ColorAct,
                  escuincle: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        obtNivel(IMC),
                        style: kText1,
                      ),
                      Text(
                        IMC.toStringAsFixed(3),
                        style: kText2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          obtInfo(IMC),
                          style: kText3,
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
