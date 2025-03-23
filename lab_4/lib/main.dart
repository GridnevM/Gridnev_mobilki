import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DormitoryScreen(),
    );
  }
}

Future<void> _makePhoneCall(String phoneNumber) async {
  final Uri url = Uri.parse('tel:$phoneNumber');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Не удалось запустить $url';
  }
}

Future<void> _launchNavigation(double latitude, double longitude) async {
  final Uri url = Uri.parse('geo:$latitude,$longitude?q=$latitude,$longitude');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Не удалось запустить $url';
  }
}

void _shareDormitoryInfo() {
  String text =
      'Общежитие №20\nАдрес: Краснодар, ул. Калинина, 13\nТелефон: +78612215942\nКоординаты: 45.050282, 38.920690';
  Share.share(text);
}

class DormitoryScreen extends StatefulWidget {
  @override
  _DormitoryScreenState createState() => _DormitoryScreenState();
}

class _DormitoryScreenState extends State<DormitoryScreen> {
  bool isFavorite = false; // Переменная для состояния "избранного"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Общежития КубГАУ'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'img/picture.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Общежитие №20',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Краснодар, ул. Калинина, 13',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.call, color: Colors.green),
                        onPressed: () => _makePhoneCall('+78612215942'),
                      ),
                      IconButton(
                        icon: Icon(Icons.navigation_rounded, color: Colors.green),
                        onPressed: () => _launchNavigation(45.050282, 38.920690),
                      ),
                      IconButton(
                        icon: Icon(Icons.share, color: Colors.green),
                        onPressed: _shareDormitoryInfo,
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.grey, // Меняем цвет
                        ),
                        onPressed: () {
                          setState(() {
                            isFavorite = !isFavorite; // Переключаем состояние
                          });
                        },
                      ),
                      Text(isFavorite ? '28' : '27'), // Изменяем количество лайков
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '«Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
