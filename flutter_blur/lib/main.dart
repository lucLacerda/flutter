import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: const MyHomePage(title: 'Flutter Blur Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  final String texto = 'Lorem Ipsum is simply dummy text of the printing and '
      'typesetting industry. Lorem Ipsum has been the industrys standard dummy '
      'text ever since the 1500s, when an unknown printer took a galley of type'
      ' and scrambled it to make a type specimen book. It has survived not only '
      'five centuries, but also the leap into electronic typesetting, remaining '
      'essentially unchanged. It was popularised in the 1960s with the release '
      'of Letraset sheets containing Lorem Ipsum passages, and more recently '
      'with desktop publishing software like Aldus PageMaker including versions'
      ' of Lorem Ipsum. Contrary to popular belief, Lorem Ipsum is not simply '
      'random text. It has roots in a piece of classical Latin literature from'
      ' 45 BC, making it over 2000 years old. Richard McClintock, a Latin '
      'professor at Hampden-Sydney College in Virginia, looked up one of the'
      ' more obscure Latin words, consectetur, from a Lorem Ipsum passage, and'
      ' going through the cites of the word in classical literature, discovered '
      'the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and '
      '1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and '
      'Evil) by Cicero, written in 45 BC. This book is a treatise on the theory '
      'of ethics, very popular during the Renaissance. The first line of Lorem'
      ' Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section '
      '1.10.32.';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Text(
            widget.texto,
            style: const TextStyle(fontSize: 16),
          ),
          Center(
            child: Container(
              color: Colors.deepPurple,
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.4,
              child: _mountContentPost(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mountContentPost() {
    return ClipRRect(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
            widget.texto,
            style: const TextStyle(fontSize: 16),
          ),
          Image.network(
              'https://cdn-images-1.medium.com/max/1200/1*5-aoK8IBmXve5whBQM90GA.png'),
          if (true)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  tileMode: TileMode.decal,
                  //TODO: Aguardando adicionarem token no ds
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
                child: _mountButtonCenter(),
              ),
            ),
        ],
      ),
    );
  }

  /// **Autor**: Lucas Lacerda / **Data**: 26/08/2022
  Widget _mountButtonCenter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.dangerous,
          color: Colors.red,
          size: 50,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: const Text(
            'Texto do botao',
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            print('botao');
          },
          child: const Text('Abrir modal'),
        ),
      ],
    );
  }
}
