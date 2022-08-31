import 'package:flutter/material.dart';
import 'package:nova_pasta_flutter/pages/home_page.dart';
import 'package:nova_pasta_flutter/repositories/personagens_repositorio.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => PersonagensRepository(),
    child: MeuAplicativo(),
  ));
}

class MeuAplicativo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Times',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.red,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(),
    );
  }
}
