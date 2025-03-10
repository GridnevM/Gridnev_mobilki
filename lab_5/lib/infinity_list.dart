import 'package:flutter/material.dart';

class InfinityList extends StatelessWidget {
  const InfinityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Список элементов'),
          backgroundColor: Colors.green,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Text('строка $index');
          },
        ),
      ),
    );
  }
}