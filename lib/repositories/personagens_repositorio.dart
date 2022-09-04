import 'package:flutter/material.dart';
import '../models/personagem.dart';
import '../models/feitos.dart';

class PersonagensRepository {
  final List<Personagem> _personagens = [];

  get personagens => _personagens;

  void addTitulo({required Personagem personagem, required Feitos feitos}) {
    personagem.feitos.add(feitos);
  }

  PersonagensRepository() {
    _personagens.addAll([
      Personagem(
          nome: 'Zhant',
          brasao:
              'https://criticalhits.com.br/wp-content/uploads/2022/04/blob_7gmc.jpg',
          nivel: 55,
          cor: Colors.red),
      Personagem(
          nome: 'Pelé',
          brasao:
              'https://www.comboinfinito.com.br/principal/wp-content/uploads/2022/05/mob-psycho-100.jpg',
          nivel: 54,
          cor: Colors.blue),
      Personagem(
          nome: 'Luffa luffa',
          brasao:
              'https://nerdhits.com.br/wp-content/uploads/2022/07/luffy-recompensa-3-bilhoes-1200x720.jpg',
          nivel: 54,
          cor: Colors.grey),
      Personagem(
          nome: 'Ronaldinho Gaucho',
          brasao:
              'https://static.wikia.nocookie.net/overtier_br/images/f/f8/Son_Goku.jpg/revision/latest?cb=20200817222539&path-prefix=pt-br',
          nivel: 54,
          cor: Colors.yellow),
    ]);
  }
}
