// lib/view/screen/home_screen.dart
import 'package:flutter/material.dart'; // استيراد مكتبة فلاتر
import '../../widgets/specializations_section.dart'; // استيراد قسم التخصصات
import '../../widgets/doctors_section.dart'; // استيراد قسم الأطباء
import '../../widgets/pharmacies_section.dart'; // استيراد قسم الصيدليات
import '../../widgets/medicine_search_bar.dart'; // استيراد شريط بحث الأدوية

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

// الحالة المرتبطة بشاشة الرئيسية
class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // المتغير الذي يخزن الفهرس المحدد حاليًا في BottomNavigationBar

  // قائمة الشاشات المختلفة (للتبويبات السفلية)
  final List<Widget> _widgetOptions = <Widget>[
    _buildHomeContent(), // الصفحة الرئيسية
    Center(child: Text('مواعيدي (سيتم فتح الصفحة)'),), // صفحة مواعيدي (Placeholder)
    _buildCenterText('جميع الأطباء'), // صفحة جميع الأطباء (Placeholder)
    _buildCenterText('جميع المستشفيات'), // صفحة جميع المستشفيات (Placeholder)
    _buildCenterText('الملف الشخصي'), // صفحة الملف الشخصي (Placeholder)
  ];

  // دالة لبناء المحتوى الرئيسي للصفحة الرئيسية
  static Widget _buildHomeContent() {
    return ListView(
      padding: const EdgeInsets.all(16.0), // الهوامش
      children: [
        const Text(
          'مرحبا، مساء الخير!',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        MedicineSearchBar(), // شريط بحث الأدوية
        const SizedBox(height: 16),
        SpecializationsSection(), // قسم التخصصات
        const SizedBox(height: 16),
        DoctorsSection(), // قسم الأطباء
        const SizedBox(height: 16),
        PharmaciesSection(), // قسم الصيدليات
      ],
    );
  }

  // مجرد نص Placeholder للشاشات غير المُفعَّلة
  static Widget _buildCenterText(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  // عند اختيار أيقونة في BottomNavigationBar
  void _onItemTapped(int index) {
    // إذا ضغط على "مواعيدي" (الفهرس 1) سنفتح صفحة MyAppointmentsScreen كنافذة جديدة
    if (index == 1) {
      Navigator.pushNamed(context, '/my_appointments'); // التنقل إلى صفحة المواعيد
      return;
    }
    setState(() {
      _selectedIndex = index; // تحديث الفهرس المحدد
    });
  }

  // بناء الـ AppBar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: Row(
        children: [
          const Icon(Icons.location_on, color: Colors.black), // أيقونة الموقع
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'تسليم إلى مكتب حلال', // عنوان التطبيق
              style: const TextStyle(color: Colors.black),
              overflow: TextOverflow.ellipsis, // نص يتخطى الحد
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications, color: Colors.black), // أيقونة الإشعارات
          onPressed: () {
            // منطق الإشعارات هنا
          },
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            // التنقل إلى صفحة الملف الشخصي
            Navigator.pushNamed(context, '/profile'); // الانتقال إلى صفحة الملف الشخصي
          },
          child: const CircleAvatar(
            backgroundColor: Colors.blue, // لون الخلفية
            child: Icon(Icons.person, color: Colors.white, size: 20), // أيقونة المستخدم
            radius: 15, // نصف القطر
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(), // بناء شريط التطبيقات
      body: _widgetOptions.elementAt(_selectedIndex), // عرض المحتوى بناءً على الفهرس المحدد
      bottomNavigationBar: _buildBottomNavigationBar(), // بناء شريط التنقل السفلية
    );
  }

  // دالة لبناء الـ BottomNavigationBar
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // لضمان ظهور جميع الأيقونات
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home), // أيقونة الرئيسية
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today), // أيقونة المواعيد
          label: 'مواعيدي',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.medical_services), // أيقونة الأطباء
          label: 'الأطباء',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_hospital), // أيقونة المستشفيات
          label: 'المستشفيات',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person), // أيقونة الملف الشخصي
          label: 'الملف الشخصي',
        ),
      ],
      currentIndex: _selectedIndex, // العنصر المحدد حاليًا
      selectedItemColor: Colors.blue, // لون العنصر المحدد
      unselectedItemColor: Colors.grey, // لون العناصر غير المحددة
      showUnselectedLabels: true, // إظهار تسميات العناصر غير المحددة
      onTap: _onItemTapped, // وظيفة عند الضغط على أحد الأزرار
      backgroundColor: Colors.white,
      selectedFontSize: 14,
      unselectedFontSize: 12,
      iconSize: 24,
    );
  }
}