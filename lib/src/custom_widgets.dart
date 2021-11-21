import 'package:flutter/material.dart';

class IconoGenero extends StatelessWidget {
  IconoGenero({required this.icono, required this.texto});
  final icono;
  final texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icono,
            size: 80,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            texto,
            style: TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}

class ContenedorChido extends StatelessWidget {
  ContenedorChido({this.escuincle, this.colorx, this.pushing});
  final escuincle;
  final colorx;
  final pushing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pushing,
      child: Container(
        child: this.escuincle,
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorx,
        ),
      ),
    );
  }
}
