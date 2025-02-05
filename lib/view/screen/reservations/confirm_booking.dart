// lib/view/screen/confirm_booking_screen.dart
import 'package:flutter/material.dart';

class ConfirmBookingScreen extends StatelessWidget {
  const ConfirmBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Booking'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'هنا صفحة تأكيد الحجز أو الدفع',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
