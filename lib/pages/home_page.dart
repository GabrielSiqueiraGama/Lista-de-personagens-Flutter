import 'package:flutter/material.dart';
import 'package:nova_pasta_flutter/models/personagem.dart';
import 'package:nova_pasta_flutter/pages/personagem_page.dart';
import 'home_controller.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: prefer_typing_uninitialized_variables
  var controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personagens.'),
      ),
      body: ListView.separated(
        itemCount: controller.tabela.length,
        itemBuilder: (BuildContext contexto, int personagem) {
          //const Text('a');
          final List<Personagem> tabela = controller.tabela;
          return ListTile(
            leading: Image.network(tabela[personagem].brasao,
                width: 100, height: 100, fit: BoxFit.cover),
            title: Text(tabela[personagem].nome),
            trailing: Text(
              tabela[personagem].nivel.toString(),
            ),
            onTap: () {
              Navigator.push(
                  contexto,
                  MaterialPageRoute(
                      builder: (_) => PersonagemPage(
                            key: Key(tabela[personagem].nome),
                            personagem: tabela[personagem],
                          )));
            },
          );
        },
        separatorBuilder: (_, __) => const Divider(),
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
