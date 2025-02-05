import 'package:flutter/material.dart';
import '../../../../widgets/active_appointment_card.dart';

class ActivesTab extends StatelessWidget {
  const ActivesTab({Key? key}) : super(key: key);

  // مثال لموعد حالي
  final List<Map<String, String>> _activeAppointments = const [
    {
      'imagePath': 'assets/images/pro4.jpg',
      'doctorName': 'د. دينيس مارتين',
      'specialty': 'أخصائي قلب',
      'date': '15/02/2026',
      'daysRemaining': 'تبقى 2 يوم',
      'timeToken': '08:30 صباحًا',
      'place': 'عيادة سيروم، روز دام،\nبجوار مركز الشرطة، ويست هام',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: _activeAppointments.map((data) {
          return ActiveAppointmentCard(
            imagePath: data['imagePath']!,
            doctorName: data['doctorName']!,
            doctorSpecialty: data['specialty']!,
            date: data['date']!,
            daysRemaining: data['daysRemaining']!,
            timeToken: data['timeToken']!,
            place: data['place']!,
            // عندما يتم الضغط على "إعادة الجدولة"
            onReschedule: () {
              // الانتقال إلى صفحة BookNowScreen
              Navigator.pushNamed(context, '/book_now');
            },
            onCancel: () {
              // منطق الإلغاء
            },
            onCardTap: () {
              // عند الضغط على البطاقة نفسها
            },
          );
        }).toList(),
      ),
    );
  }
}