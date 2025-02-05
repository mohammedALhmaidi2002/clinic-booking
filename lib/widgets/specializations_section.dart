// lib/widgets/specializations_section.dart
import 'package:flutter/material.dart'; // استيراد مكتبة فلاتر
import 'package:provider/provider.dart'; // استيراد مكتبة Provider
import '../providers/medical_provider.dart'; // استيراد مزود البيانات الطبية

class SpecializationsSection extends StatelessWidget {
  // قائمة بالتخصصات، كل تخصص يحتوي على تسميات، ألوان، ومسارات للصور
  final List<Map<String, dynamic>> specializations = [
    {'label': 'All', 'color': Colors.orange, 'imagePath': 'assets/images/pro1.jpg'},
    {'label': 'أمراض القلب', 'color': Colors.green, 'imagePath': 'assets/images/pro2.jpg'},
    {'label': 'الأمراض الجلدية', 'color': Colors.red, 'imagePath': 'assets/images/pro4.jpg'},
    {'label': 'طب الأطفال', 'color': Colors.blue, 'imagePath': 'assets/images/pro6.jpg'},
    {'label': 'طب العيون', 'color': Colors.purple, 'imagePath': 'assets/images/pro11.jpg'},
    {'label': 'الأمراض العصبية', 'color': Colors.yellow, 'imagePath': 'assets/images/pro12.jpg'},
    {'label': 'الصيدلة العامة', 'color': Colors.teal, 'imagePath': 'assets/images/pro13.jpg'},
    {'label': 'الصيدلة السريرية', 'color': Colors.brown, 'imagePath': 'assets/images/pro15.jpg'},
    {'label': 'جراحة عامة', 'color': Colors.orangeAccent, 'imagePath': 'assets/images/pro16.jpg'},
    {'label': 'الطب النفسي', 'color': Colors.lightBlue, 'imagePath': 'assets/images/pro17.jpg'},
    {'label': 'طب الأسنان', 'color': Colors.pink, 'imagePath': 'assets/images/pro18.jpg'},
    // أضف المزيد من التخصصات حسب الحاجة
  ];

  @override
  Widget build(BuildContext context) {
    // الحصول على التخصص المحدد من المزود
    final selectedSpecialization = context.watch<MedicalProvider>().selectedSpecialization;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'التخصصات الطبية', // عنوان القسم
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // تنسيق النص
        ),
        SizedBox(height: 10), // فراغ بين العنوان والقائمة
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // دعم التمرير الأفقي
          child: Row(
            children: specializations.map((spec) {
              bool isSelected = selectedSpecialization == spec['label']; // تحقق مما إذا كان التخصص المحدد هو التخصص الحالي
              return GestureDetector(
                onTap: () {
                  // عند الضغط على التخصص، يتم تحديث التخصص المحدد في المزود
                  context.read<MedicalProvider>().selectSpecialization(spec['label']);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), // حشوة داخلية
                  margin: EdgeInsets.symmetric(horizontal: 8), // الهوامش
                  decoration: BoxDecoration(
                    color: isSelected ? spec['color'] : Colors.grey[300], // اللون بناءً على ما إذا كان محددًا
                    borderRadius: BorderRadius.circular(20), // تدوير الحواف
                    boxShadow: isSelected // ظل عند اختيار التخصص
                        ? [
                      BoxShadow(
                        color: spec['color'].withOpacity(0.6), // لون الظل
                        spreadRadius: 2, // مدى انتشار الظل
                        blurRadius: 5, // مدى تلطيف الظل
                      ),
                    ]
                        : [],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        spec['imagePath'], // تحميل الصورة من المسار المحدد
                        width: 60, // عرض الصورة
                        height: 60, // ارتفاع الصورة
                        fit: BoxFit.cover, // كيفية ملاءمة الصورة
                      ),
                      SizedBox(height: 6), // فراغ بين الصورة والتسمية
                      Text(
                        spec['label'], // عرض اسم التخصص
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black, // لون النص بناءً على الاختيار
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // وزن النص
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(), // تحويل قائمة التخصصات إلى قائمة Widgets
          ),
        ),
      ],
    );
  }
}