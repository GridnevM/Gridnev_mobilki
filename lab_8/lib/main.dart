import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'galery.dart';
import 'news.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyAp());
}

class MyAp extends StatelessWidget {
  const MyAp({Key? key}) : super(key: key);

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
        title: const Text('Выбор приложения'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text('Новости КубГАУ'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyApp()),
            ),
          ),
          ListTile(
            title: const Text('Фотогалерея'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const galery()),
            ),
          ),

        ],
      ),
    );
  }
}