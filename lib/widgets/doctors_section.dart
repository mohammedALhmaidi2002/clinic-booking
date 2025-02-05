// lib/widgets/doctors_section.dart
import 'package:flutter/material.dart'; // استيراد مكتبة فلاتر
import 'package:provider/provider.dart'; // استيراد مكتبة Provider
import '../providers/medical_provider.dart'; // استيراد مزود البيانات الطبية
import '../widgets/doctor_card.dart'; // استيراد واجهة بطاقة الطبيب

class DoctorsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // الحصول على قائمة الأطباء من مزود البيانات الطبية
    final doctors = context.watch<MedicalProvider>().doctors;

    // التحقق مما إذا كانت القائمة فارغة
    if (doctors.isEmpty) {
      return Center(
        child: Text(
          'لا يوجد أطباء في هذا التخصص.', // الرسالة التي ستظهر إذا كانت القائمة فارغة
          style: TextStyle(fontSize: 16, color: Colors.grey), // تنسيق النص
        ),
      );
    }

    // بناء واجهة المستخدم لعرض الأطباء
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // محاذاة العناصر إلى اليسار
      children: [
        // عنوان القسم
        Text(
          'الأطباء المتاحون', // نص العنوان
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // تنسيق النص
        ),
        SizedBox(height: 10), // إضافة فراغ بين العنوان وقائمة الأطباء
        // عرض الأطباء باستخدام DoctorCard مع تحديد العدد إلى 5
        ListView.builder(
          shrinkWrap: true, // تقليص حجم القائمة لتناسب المحتوى
          physics: NeverScrollableScrollPhysics(), // تعطيل تمرير القائمة
          itemCount: doctors.length > 5 ? 5 : doctors.length, // تحديد عدد العناصر المراد عرضها
          itemBuilder: (context, index) {
            return DoctorCard(doctor: doctors[index]); // إنشاء بطاقة الطبيب لكل طبيب
          },
        ),
      ],
    );
  }
}