import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
void _makePhoneCall() async {
  final Uri phoneUri = Uri.parse("tel:+78612215942");
  if (await canLaunchUrl(phoneUri)) {
    await launchUrl(phoneUri);
  } else {
    throw "Не удалось запустить $phoneUri";
  }
}
class DormitoryScreen extends StatelessWidget {
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
            Image.asset('img/picture.jpg', fit: BoxFit.cover, width: double.infinity),
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
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.navigation_rounded, color: Colors.green),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(Icons.share, color: Colors.green),
                        onPressed: () {},
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.favorite, color: Colors.red),
                        onPressed: () {},
                      ),
                      Text('27'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    '«Студенческий городок или так называемый кампус Кубанского ГАУ состои из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежития университета, при поселении между администрацией и студентами заключаетсядоговор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствияасоциальных явлений в молодежной среде. Условия проживания в общежитияхуниверситетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов инаглядной агитации. С целью улучшения условий быта студентов активно работаетсистема студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию',
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
