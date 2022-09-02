import 'package:flutter/material.dart';
import 'feitos.dart';

class Personagem {
  String nome;
  String brasao;
  int nivel;
  Color cor;
  List<Feitos> titulos = [];

  Personagem(
      {required this.nome,
      required this.brasao,
      required this.nivel,
      required this.cor});
}
