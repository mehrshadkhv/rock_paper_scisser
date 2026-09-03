import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(GameApplication());
}

class GameApplication extends StatefulWidget {
  const GameApplication({super.key});

  @override
  State<GameApplication> createState() => _GameApplicationState();
}

class _GameApplicationState extends State<GameApplication> {
  int top = 1;
  int bottom = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Vazir'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepOrange[600],
        appBar: AppBar(
          title: Text(
            'سنگ    کاغذ    قیچی',
            style: TextStyle(
              fontFamily: 'Vazir',
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
          elevation: 100.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image(height: 100.0, image: AssetImage('assets/images/$top.png')),
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                onPressed: () {
                  setState(() {
                    top = Random().nextInt(3)+1;//0-2 -> 1-3
                    bottom = Random().nextInt(3)+1;//0-2 -> 1-3
                  });
                },
                child: Text(
                  'شروع بازی',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Vazir',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Image(
                height: 100.0,
                image: AssetImage('assets/images/$bottom.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
