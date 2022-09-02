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
      widget.personagem.titulos.add(feitos);
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
                Text('Dados'),
              ],
              indicatorColor: Colors.white,
            ),
          ),
          body: TabBarView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Image.network(
                      widget.personagem.brasao.replaceAll("40x40", "100x100")),
                ),
                Text(widget.personagem.nome),
                Text('Nivel de poder do personagem ${widget.personagem.nivel}')
              ],
            ),
            titulos(),
          ])),
    );
  }

  Widget titulos() {
    final quantidade = widget.personagem.titulos.length;
    return quantidade == 0
        ? const Center(
            child: Text('Nenhum feito ainda.'),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.emoji_events),
                title: Text(widget.personagem.titulos[index].titulo),
                trailing: Text(widget.personagem.titulos[index].descricao),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: quantidade,
          );
  }
}
