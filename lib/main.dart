import 'package:flutter/material.dart';

void main() {
  runApp(GameApplication());
}

class GameApplication extends StatelessWidget {
  const GameApplication({super.key});

  @override
  Widget build(BuildContext context) {
    int top = 1;
    int bottom = 3;
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
                onPressed: () {},
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
              Image(height: 100.0, image: AssetImage('assets/images/$bottom.png')),
            ],
          ),
        ),
      ),
    );
  }
}
