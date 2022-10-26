import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mountAppBar(),
      body: mountBase(),
      backgroundColor: Colors.orange,
    );
  }

  AppBar mountAppBar() {
    return AppBar(
      backgroundColor: Colors.orange,
      automaticallyImplyLeading: false,
      excludeHeaderSemantics: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.fastfood_rounded,
            size: 30,
            color: Colors.white,
          ),
          Text(
            'Comes e bebes',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontFamily: 'Roboto',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget mountBase() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: ListView(scrollDirection: Axis.horizontal,
              children: [
                mountPrimaryCard(cor: Colors.deepPurple),
                mountPrimaryCard(cor: Colors.red),
                mountPrimaryCard(cor: Colors.cyan),
                mountPrimaryCard(cor: Colors.green),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget mountPrimaryCard({required Color cor}) {
    return Expanded(
      child: Container(height: 150,
        width: 220,
        decoration: BoxDecoration(
            color: cor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
              color: Colors.black,
              width: 1.5,
            ),
      ),
      ),
    );
  }
}
