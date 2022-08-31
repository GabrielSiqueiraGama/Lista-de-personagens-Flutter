import 'package:flutter/material.dart';
import 'package:nova_pasta_flutter/models/personagem.dart';
import 'package:nova_pasta_flutter/models/titulo.dart';

class AddTituloPage extends StatefulWidget {
  Personagem personagem;
  ValueChanged<Titulo> onSave;

  AddTituloPage({super.key, required this.personagem, required this.onSave});

  @override
  State<AddTituloPage> createState() => _AddTituloPageState();
}

class _AddTituloPageState extends State<AddTituloPage> {
  final _feitos = TextEditingController();
  final _habilidade = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar titulo.'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextFormField(
                  controller: _feitos,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Feitos: ',
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
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: TextFormField(
                  controller: _habilidade,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Habilidade: ',
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
                    widget.onSave(Titulo(
                        feitos: _feitos.text, habilidade: _habilidade.text));
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
