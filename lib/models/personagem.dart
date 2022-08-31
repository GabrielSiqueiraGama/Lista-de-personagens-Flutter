import 'package:flutter/material.dart';
import 'titulo.dart';

class Personagem {
  String nome;
  String brasao;
  int nivel;
  Color cor;
  List<Titulo> titulos = [];

  Personagem(
      {required this.nome,
      required this.brasao,
      required this.nivel,
      required this.cor});
}
