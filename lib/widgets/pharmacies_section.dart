// استيراد حزمة Flutter لإنشاء واجهة المستخدم
import 'package:flutter/material.dart';

// استيراد حزمة Provider لإدارة الحالة
import 'package:provider/provider.dart';

// استيراد المزود المسؤول عن البيانات الطبية
import '../providers/medical_provider.dart';

// استيراد عنصر واجهة المستخدم لعرض تفاصيل الصيدلية
import '../widgets/pharmacy_card.dart';

// تعريف قسم الصيدليات كودجت ثابتة (StatelessWidget)
class PharmaciesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // الحصول على قائمة الصيدليات من MedicalProvider باستخدام Provider
    final pharmacies = context.watch<MedicalProvider>().pharmacies;

    // إذا لم تكن هناك صيدليات، لا يتم عرض أي عنصر
    if (pharmacies.isEmpty) {
      return SizedBox.shrink(); // عنصر فارغ لا يأخذ مساحة
    }

    // إرجاع عمود يحتوي على عنوان القسم وقائمة الصيدليات
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // محاذاة العناصر إلى اليسار
      children: [
        // عنوان القسم
        Text(
          'الصيدليات المتوفرة',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // تنسيق النص
        ),
        SizedBox(height: 10), // مسافة بين العنوان والقائمة

        // عرض الصيدليات باستخدام ListView.builder مع تحديد العدد الأقصى إلى 5
        ListView.builder(
          shrinkWrap: true, // تحديد الحجم بناءً على عدد العناصر
          physics: NeverScrollableScrollPhysics(), // تعطيل التمرير داخل القائمة
          itemCount: pharmacies.length > 5 ? 5 : pharmacies.length, // عرض 5 صيدليات كحد أقصى
          itemBuilder: (context, index) {
            return PharmacyCard(pharmacy: pharmacies[index]); // إنشاء بطاقة صيدلية لكل عنصر
          },
        ),
      ],
    );
  }
}
