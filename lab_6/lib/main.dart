import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AreaCalculator(),
    );
  }
}

class AreaCalculator extends StatefulWidget {
  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  String result = "";

  void calculateArea() {
    String widthText = widthController.text;
    String heightText = heightController.text;

    if (widthText.isEmpty || heightText.isEmpty) {
      setState(() {
        result = "Введите значения";
      });
      return;
    }

    final int? width = int.tryParse(widthText);
    final int? height = int.tryParse(heightText);

    if (width == null || height == null) {
      setState(() {
        result = "Введите корректные числовые значения";
      });
      return;
    }

    int area = width * height;
    setState(() {
      result = "S = $width * $height = $area (мм2)";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Вычисление успешно выполнено!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Калькулятор площади")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: widthController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: "Ширина (мм):",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: "Высота (мм):",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: calculateArea,
                child: Text("Вычислить"),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                result,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
