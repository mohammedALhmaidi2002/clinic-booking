// lib/view/screen/profile_screen.dart
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // صورة المستخدم وبياناته
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile_placeholder.png'),
              ),
              SizedBox(height: 16),
              Text(
                'فيشال خادوك',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'أحب الطعام السريع',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 24),

              // قائمة الخيارات
              _buildOptionCard(
                context,
                items: [
                  _buildOptionItem(Icons.person_outline, 'المعلومات الشخصية', () {
                    Navigator.pushNamed(context, '/personal_info');
                  }, Colors.orange),
                  _buildOptionItem(Icons.location_on_outlined, 'العناوين', () {
                    Navigator.pushNamed(context, '/addresses');
                  }, Colors.blue),
                ],
              ),
              SizedBox(height: 16),
              _buildOptionCard(
                context,
                items: [
                  _buildOptionItem(Icons.shopping_cart_outlined, 'السلة', () {
                    Navigator.pushNamed(context, '/cart');
                  }, Colors.purple),
                  _buildOptionItem(Icons.favorite_border, 'المفضلة', () {
                    Navigator.pushNamed(context, '/favourites');
                  }, Colors.pink),
                  _buildOptionItem(Icons.notifications_none, 'الإشعارات', () {
                    Navigator.pushNamed(context, '/notifications');
                  }, Colors.yellow),
                  _buildOptionItem(Icons.payment_outlined, 'طريقة الدفع', () {
                    Navigator.pushNamed(context, '/payment_method');
                  }, Colors.green),
                ],
              ),
              SizedBox(height: 16),
              _buildOptionCard(
                context,
                items: [
                  _buildOptionItem(Icons.help_outline, 'الأسئلة الشائعة', () {
                    Navigator.pushNamed(context, '/faqs');
                  }, Colors.red),
                  _buildOptionItem(Icons.star_border, 'مراجعات المستخدمين', () {
                    Navigator.pushNamed(context, '/user_reviews');
                  }, Colors.blueAccent),
                  _buildOptionItem(Icons.settings_outlined, 'الإعدادات', () {
                    Navigator.pushNamed(context, '/settings');
                  }, Colors.teal),
                ],
              ),
              SizedBox(height: 16),
              _buildOptionCard(
                context,
                items: [
                  _buildOptionItem(Icons.exit_to_app, 'تسجيل الخروج', () {
                    Navigator.pushReplacementNamed(context, '/login');
                  }, Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // بناء AppBar
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        'الملف الشخصي',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {
            // منطق زر الخيارات الإضافية
          },
        ),
      ],
    );
  }

  // بناء البطاقة التي تحتوي على الخيارات
  Widget _buildOptionCard(BuildContext context, {required List<Widget> items}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: items,
      ),
    );
  }

  // بناء العنصر الفردي في القائمة مع تحسين الأيقونات
  Widget _buildOptionItem(IconData icon, String title, VoidCallback onTap, Color iconColor) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: iconColor.withOpacity(0.2), // تدرج اللون الخلفي للأيقونة
        child: Icon(icon, color: iconColor),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: onTap,
    );
  }
}
