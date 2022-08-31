import '../repositories/personagens_repositorio.dart';
import '../models/personagem.dart';
import '../models/titulo.dart';

class HomeController {
  PersonagensRepository personagensRepository = PersonagensRepository();
  List<Personagem> get tabela => personagensRepository.personagens;

  HomeController() {
    personagensRepository = PersonagensRepository();
  }
}
