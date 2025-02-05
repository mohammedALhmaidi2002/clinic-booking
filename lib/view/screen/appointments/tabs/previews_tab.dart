// lib/view/screen/appointments/tabs/previews_tab.dart
import 'package:flutter/material.dart';

import '../../../../widgets/preview_appointment_card.dart';

class PreviewsTab extends StatelessWidget {
  const PreviewsTab({Key? key}) : super(key: key);

  // مثال لمواعيد سابقة
  final List<Map<String, String>> _previewAppointments = const [
    {
      'daysAgo': '3 Days Ago',
      'imagePath': 'assets/images/pro4.jpg',
      'doctorName': 'Dr Denies Martine',
      'specialty': 'Cardiologist',
      'date': '15/02/2026',
      'timeToken': '08:30 AM',
      'place': 'Serum Clinic, Rose Dam,\nNear Police Station, West Ham',
    },
    {
      'daysAgo': '8 Days Ago',
      'imagePath': 'assets/images/pro4.jpg',
      'doctorName': 'Dr Denies Martine',
      'specialty': 'Cardiologist',
      'date': '15/02/2026',
      'timeToken': '32',
      'place': 'Serum Clinic, Rose Dam,\nNear Police Station, West Ham',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: _previewAppointments.map((data) {
          return PreviewAppointmentCard(
            daysAgo: data['daysAgo']!,
            imagePath: data['imagePath']!,
            doctorName: data['doctorName']!,
            doctorSpecialty: data['specialty']!,
            date: data['date']!,
            timeToken: data['timeToken']!,
            place: data['place']!,
            onCardTap: () {
              // منطق الضغط على البطاقة
            },
            onAddReview: () {
              // منطق إضافة مراجعة
            },
          );
        }).toList(),
      ),
    );
  }
}
