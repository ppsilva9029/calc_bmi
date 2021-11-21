import 'dart:async';

import 'package:calc_bmi/pages/result.dart';
import 'package:calc_bmi/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../src/custom_widgets.dart';
import 'dart:math';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

enum Sexo { hombre, mujer, nobin }

class _InputPageState extends State<InputPage> {
  Color colormasc = ColorInact;
  Color colorfem = ColorInact;
  Sexo sSelected = Sexo.nobin;
  int estatura = 170;
  int peso = 60;
  int edad = 20;
  bool presionado = false;
  late Timer timer;

  // void _updatePeso() async {
  //   while (peso < 100 && presionado) {
  //     // Usa el delay que desees
  //     await Future.delayed(const Duration(milliseconds: 100));
  //     setState(() {
  //       peso++;
  //     });
  //   }
  // }

  // void _updateEdad() async {
  //   while (edad < 100 && presionado) {
  //     // Usa el delay que desees
  //     await Future.delayed(const Duration(milliseconds: 100));
  //     setState(() {
  //       edad++;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Calculadora de IMC',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Column(
            children: <Widget>[
              // Contenedor selección de sexo
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                    child: ContenedorChido(
                        pushing: () {
                          setState(() {
                            sSelected = Sexo.hombre;
                          });
                        },
                        escuincle: IconoGenero(
                          icono: FontAwesomeIcons.mars,
                          texto: "Hombre",
                        ),
                        colorx:
                            sSelected == Sexo.hombre ? ColorAct : ColorInact),
                  ),
                  Expanded(
                      child: ContenedorChido(
                    pushing: () {
                      setState(() {
                        sSelected = Sexo.mujer;
                      });
                    },
                    escuincle: IconoGenero(
                      icono: FontAwesomeIcons.venus,
                      texto: "Mujer",
                    ),
                    colorx: sSelected == Sexo.mujer ? ColorAct : ColorInact,
                  ))
                ],
              )),
              // Contenedor selección de estatura
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: ContenedorChido(
                    escuincle: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "ALTURA",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              estatura.toString(),
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.yellowAccent[400]),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "cm",
                              style: TextStyle(fontSize: 30),
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 25),
                              thumbShape: RoundSliderThumbShape(
                                enabledThumbRadius: 12.50,
                              )),
                          child: Slider(
                              activeColor: Color(0xFFD1C647),
                              inactiveColor: Colors.black,
                              min: 120,
                              max: 220,
                              value: estatura.toDouble(),
                              onChanged: (double newVal) {
                                setState(() {
                                  estatura = newVal.round();
                                });
                              }),
                        )
                      ],
                    ),
                    colorx: ColorAct,
                  ))
                ],
              )),
              // Contenedor selección de peso
              Expanded(
                  child: Row(
                children: [
                  // Peso
                  Expanded(
                    child: ContenedorChido(
                      colorx: ColorAct,
                      escuincle: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "PESO",
                            style: TextStyle(fontSize: 20),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                peso.toString(),
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "kg",
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BotonChido(
                                icono: FontAwesomeIcons.minus,
                                accion: () {
                                  setState(() {
                                    peso--;
                                  });
                                },
                                enTapDown: (TapDownDetails details) {
                                  print('down');
                                  timer = Timer.periodic(
                                      Duration(milliseconds: 150), (t) {
                                    setState(() {
                                      peso--;
                                    });
                                    print('value $edad');
                                  });
                                },
                                enTapUp: (TapUpDetails details) {
                                  print('up');
                                  timer.cancel();
                                },
                                enTapCancel: () {
                                  print('cancel');
                                  timer.cancel();
                                },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              BotonChido(
                                icono: FontAwesomeIcons.plus,
                                accion: () {
                                  setState(() {
                                    peso++;
                                  });
                                },
                                enTapDown: (TapDownDetails details) {
                                  print('down');
                                  timer = Timer.periodic(
                                      Duration(milliseconds: 150), (t) {
                                    setState(() {
                                      peso++;
                                    });
                                    print('value $edad');
                                  });
                                },
                                enTapUp: (TapUpDetails details) {
                                  print('up');
                                  timer.cancel();
                                },
                                enTapCancel: () {
                                  print('cancel');
                                  timer.cancel();
                                },
                                // sostPres: (details) {
                                //   presionado = true;
                                //   _updatePeso();
                                // },
                                // sostPresFin: (details) {
                                //   presionado = false;
                                // },
                                // sostPresFin2: () {
                                //   presionado = false;
                                // },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  // Edad
                  Expanded(
                      child: ContenedorChido(
                    colorx: ColorAct,
                    escuincle: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "EDAD",
                          style: TextStyle(fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              edad.toString(),
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "años",
                              style: TextStyle(fontSize: 30),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BotonChido(
                              icono: FontAwesomeIcons.minus,
                              accion: () {
                                setState(() {
                                  edad--;
                                });
                              },
                              enTapDown: (TapDownDetails details) {
                                print('down');
                                timer = Timer.periodic(
                                    Duration(milliseconds: 150), (t) {
                                  setState(() {
                                    edad--;
                                  });
                                  print('value $edad');
                                });
                              },
                              enTapUp: (TapUpDetails details) {
                                print('up');
                                timer.cancel();
                              },
                              enTapCancel: () {
                                print('cancel');
                                timer.cancel();
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            BotonChido(
                              icono: FontAwesomeIcons.plus,
                              accion: () {
                                setState(() {
                                  edad++;
                                });
                              },
                              enTapDown: (TapDownDetails details) {
                                print('down');
                                timer = Timer.periodic(
                                    Duration(milliseconds: 150), (t) {
                                  setState(() {
                                    edad++;
                                  });
                                  print('value $edad');
                                });
                              },
                              enTapUp: (TapUpDetails details) {
                                print('up');
                                timer.cancel();
                              },
                              enTapCancel: () {
                                print('cancel');
                                timer.cancel();
                              },
                              // sostPres: (details) {
                              //   presionado = true;
                              //   _updateEdad();
                              // },
                              // sostPresFin: (details) {
                              //   presionado = false;
                              // },
                              // sostPresFin2: () {
                              //   presionado = false;
                              // },
                            )
                          ],
                        )
                      ],
                    ),
                  ))
                ],
              )),
              Container(
                child: TextButton(
                    onPressed: () {
                      double imc = peso / pow(estatura / 100, 2);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                    IMC: imc,
                                  )));
                    },
                    child: Text(
                      "Calcular IMC",
                      style: TextStyle(fontSize: 20, color: ColorInact),
                    )),
                height: 50,
                width: double.infinity,
                color: Color(0xFFD1C647),
              )
            ],
          )),
    );
  }
}

class BotonChido extends StatelessWidget {
  BotonChido({
    this.icono,
    this.accion,
    this.enTapDown,
    this.enTapUp,
    this.enTapCancel,
    // this.sostPres,
    // this.sostPresFin,
    // this.sostPresFin2
  });
  final icono;
  final accion;
  final enTapDown;
  final enTapUp;
  final enTapCancel;
  // final sostPres;
  // final sostPresFin;
  // final sostPresFin2;

  @override
  Widget build(BuildContext context) {
    return
        // GestureDetector(
        //   onDoubleTapDown: sostPres,
        //   onTapUp: sostPresFin,
        //   onDoubleTapCancel: sostPresFin2,
        //   child:
        GestureDetector(
      onTapDown: enTapDown,
      onTapUp: enTapUp,
      onTapCancel: enTapCancel,
      child: RawMaterialButton(
        child: Icon(
          icono,
          color: Colors.black87,
        ),
        onPressed: accion,
        constraints: BoxConstraints.tightFor(
          width: 56,
          height: 56,
        ),
        shape: CircleBorder(),
        fillColor: ColorPpal,
      ),
    );
    // );
  }
}
