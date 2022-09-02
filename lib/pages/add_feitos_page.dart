import 'package:flutter/material.dart';
import 'package:nova_pasta_flutter/models/personagem.dart';
import 'package:nova_pasta_flutter/models/feitos.dart';

class AddFeitosPage extends StatefulWidget {
  Personagem personagem;
  ValueChanged<Feitos> onSave;

  AddFeitosPage({super.key, required this.personagem, required this.onSave});

  @override
  State<AddFeitosPage> createState() => _AddFeitosPageState();
}

class _AddFeitosPageState extends State<AddFeitosPage> {
  final _descricao = TextEditingController();
  final _titulo = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar feitos.'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: TextFormField(
                  controller: _titulo,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Titulo: ',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'O campo não pode ser vazio';
                    }
                    return null;
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextFormField(
                  controller: _descricao,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descrição: ',
                  ),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'O campo não pode ser vazio';
                    }
                    return null;
                  }),
            ),
            Expanded(
                child: Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onSave(Feitos(
                        descricao: _descricao.text, titulo: _titulo.text));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check),
                    Padding(
                      padding: EdgeInsets.all(16.00),
                      child: Text('Salvar'),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
