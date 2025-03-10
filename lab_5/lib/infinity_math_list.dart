import 'package:flutter/material.dart';

class InfinityMathList extends StatelessWidget {
  const InfinityMathList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Степени двойки'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('2**$index = ${BigInt.from(2).pow(index)}'),

          );
        },
      ),
    );
  }
}
