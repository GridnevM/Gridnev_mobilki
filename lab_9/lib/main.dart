import 'package:flutter/material.dart';
import 'classes/Machine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Кофемашина',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const CoffeeHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CoffeeHomePage extends StatefulWidget {
  const CoffeeHomePage({super.key});

  @override
  State<CoffeeHomePage> createState() => _CoffeeHomePageState();
}

class _CoffeeHomePageState extends State<CoffeeHomePage> {
  final Machine machine = Machine(); // Экземпляр класса Machine
  String status = '';

  void _makeEspresso() {
    setState(() {
      machine.makingCoffee();
      status = machine.isAvailable()
          ? ' Эспрессо приготовлен!'
          : 'Недостаточно ресурсов для приготовления эспрессо';
    });
  }

  void _addResources() {
    setState(() {
      machine.water += 300;
      machine.coffeeBeans += 150;
      machine.milk += 100;
      status = ' Ресурсы пополнены';
    });
  }

  void _resetCash() {
    setState(() {
      machine.cash = 0;
      status = 'Деньги обнулены';
    });
  }

  void _showStatus() {
    setState(() {
      machine.showStatus(); // Вывод в консоль
      status = 'Статус выведен в консоль';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Кофемашина'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Выберите действие:', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ElevatedButton(
                  onPressed: _makeEspresso,
                  child: const Text('Эспрессо'),
                ),
                ElevatedButton(
                  onPressed: _addResources,
                  child: const Text('Пополнить ресурсы'),
                ),
                ElevatedButton(
                  onPressed: _resetCash,
                  child: const Text('Обнулить деньги'),
                ),
                ElevatedButton(
                  onPressed: _showStatus,
                  child: const Text('Показать статус'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              status,
              style: const TextStyle(fontSize: 18, color: Colors.green),
            )
          ],
        ),
      ),
    );
  }
}
