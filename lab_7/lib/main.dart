import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Навигация',
      theme: ThemeData(primarySwatch: Colors.green),
      home: FirstScreen(),
      color: Colors.blue,
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String? result;

  void _navigateToSecondScreen() async {
    final selectedValue = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SecondScreen()),
    );
    if (selectedValue != null) {
      setState(() {
        result = selectedValue;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Вы выбрали: $selectedValue')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Первый экран', style: TextStyle(color: Colors.blue))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _navigateToSecondScreen,
              child: Text('Перейти на второй экран'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Второй экран', style: TextStyle(color: Colors.blue))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Да'),
              child: Text('Да'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Нет'),
              child: Text('Нет'),
            ),
          ],
        ),
      ),
    );
  }
}
