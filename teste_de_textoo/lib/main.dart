// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String bigText =
      'Lorem Ipsum is simply dummy text of the ake a type book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: 300,
              child: _mountMessagePost(context),
            ),
            SizedBox(
              height: 500,
              width: 300,
              child: RichText(
                // maxLines: 2,
                // overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  text: countWords(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: bigText.length < 80
                          ? bigText
                          : bigText.substring(0, 80),
                    ),
                    const TextSpan(
                      text: '...ver mais',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String countWords() {
    int qtdPalavras = 1;
    List<String>? texto;
    String? palavra;

    bigText.characters.forEach((element) {
      palavra += element;

      if (element == ' ') {
        qtdPalavras++;
        texto?.add(palavra);
      }
    });

    print(texto);
    // return qtdPalavras.toString();
    return qtdPalavras.toString();
  }

  bool checkIfTextWasOverflowed({
    required BoxConstraints size,
    required BuildContext context,
  }) {
    final textSpan = TextSpan(
      text: bigText,
      style: const TextStyle(
        color: Colors.black,
      ),
    );

    final textPainter = TextPainter(
      maxLines: 2,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      text: textSpan,
    );

    textPainter.layout(maxWidth: size.maxWidth);

    return textPainter.didExceedMaxLines;
  }

  Widget _mountMessagePost(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final isOverflowed =
            checkIfTextWasOverflowed(size: size, context: context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              // maxLines: 2,
              // overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: isOverflowed ? bigText : 'falso',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: <TextSpan>[],
              ),
            ),
          ],
        );
      },
    );
  }
}
