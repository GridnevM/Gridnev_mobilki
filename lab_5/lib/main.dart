import 'package:flutter/material.dart';
import 'simple_list.dart';
import 'infinity_list.dart';
import 'infinity_math_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lists',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбор списка'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Простой список'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SimpleList()),
            ),
          ),
          ListTile(
            title: const Text('Бесконечный список'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InfinityList()),
            ),
          ),
          ListTile(
            title: const Text('Степени двойки'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InfinityMathList()),
            ),
          ),
        ],
      ),
    );
  }
}
