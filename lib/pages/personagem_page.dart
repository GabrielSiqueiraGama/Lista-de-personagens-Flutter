import 'package:flutter/material.dart';
import '../models/personagem.dart';
import '../models/feitos.dart';
import 'add_feitos_page.dart';

// ignore: must_be_immutable
class PersonagemPage extends StatefulWidget {
  Personagem personagem;
  PersonagemPage({required Key key, required this.personagem})
      : super(key: key);

  @override
  State<PersonagemPage> createState() => _PersonagemPageState();
}

class _PersonagemPageState extends State<PersonagemPage> {
  tituloPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddFeitosPage(
            // ignore: unnecessary_this
            personagem: widget.personagem,
            // ignore: unnecessary_this
            onSave: this.addFeitos),
      ),
    );
  }

  addFeitos(Feitos feitos) {
    setState(() {
      widget.personagem.feitos.add(feitos);
    });
    Navigator.pop(context);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Salvo com sucesso.')));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: widget.personagem.cor,
            title: Text(widget.personagem.nome),
            actions: [
              IconButton(icon: const Icon(Icons.add), onPressed: tituloPage)
            ],
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.stacked_line_chart)),
                Text('Feitos'),
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: TabBarView(children: [
            titleSection(),
            titulos(),
          ])),
    );
  }

  Widget titleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.personagem.brasao,
                  width: 600,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 15),
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Nome: ${widget.personagem.nome}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*3*/
        ],
      ),
    );
  }

  Widget titulos() {
    final quantidade = widget.personagem.feitos.length;
    return quantidade == 0
        ? const Center(
            child: Text('Nenhum feito ainda.'),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.emoji_events),
                title: Text(widget.personagem.feitos[index].titulo),
                trailing: Text(widget.personagem.feitos[index].descricao),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: quantidade,
          );
  }
}
