// lib/widgets/pharmacy_card.dart
import 'package:flutter/material.dart'; // استيراد مكتبة فلاتر
import '../models/pharmacy.dart'; // استيراد نموذج الصيدلية
import '../view/screen/pharmacy_detail_screen.dart'; // استيراد شاشة تفاصيل الصيدلية
import '../utils/constants.dart'; // استيراد الثوابت (إذا كانت موجودة)

class PharmacyCard extends StatelessWidget {
  final Pharmacy pharmacy; // تخزين كائن الصيدلية

  PharmacyCard({required this.pharmacy}); // موفر لتحديد الصيدلية المطلوبة

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // التنقل إلى شاشة تفاصيل الصيدلية عند الضغط على البطاقة
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PharmacyDetailScreen(pharmacy: pharmacy),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), // شكل البطاقة
        elevation: 4, // ارتفاع الظل
        margin: EdgeInsets.symmetric(vertical: 8), // الهوامش العمودية
        child: Padding(
          padding: const EdgeInsets.all(16.0), // حشوة داخل البطاقة
          child: Row(
            children: [
              // صورة الصيدلية
              ClipRRect(
                borderRadius: BorderRadius.circular(15), // تدوير زوايا الصورة
                child: Image.asset(
                  pharmacy.imagePaths[0], // الصورة تستخدم المسار المخزن في كائن الصيدلية
                  width: 100, // عرض الصورة
                  height: 100, // ارتفاع الصورة
                  fit: BoxFit.cover, // ملاءمة الصورة بالمقاس
                ),
              ),
              SizedBox(width: 16), // فراغ بين الصورة والمحتوى
              // معلومات الصيدلية
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النص إلى اليسار
                  children: [
                    Text(
                      pharmacy.name, // اسم الصيدلية
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // تنسيق النص
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 16), // أيقونة النجمة للتقييم
                        SizedBox(width: 4), // فراغ بين الأيقونة والنص
                        Text(
                          pharmacy.rating.toString(), // عرض تقييم الصيدلية
                          style: TextStyle(fontSize: 16), // تنسيق النص
                        ),
                      ],
                    ),
                    SizedBox(height: 8), // فراغ بين العناصر
                    Text(
                      '${pharmacy.location}', // عرض موقع الصيدلية
                      style: TextStyle(fontSize: 14, color: Colors.grey), // تنسيق النص
                    ),
                    SizedBox(height: 8), // فراغ بين العناصر
                    Text(
                      'الأدوية المتوفرة: ${pharmacy.medicines.join(', ')}', // عرض الأدوية المتوفرة
                      style: TextStyle(fontSize: 14, color: Colors.grey), // تنسيق النص
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey), // أيقونة تشير للذهاب إلى التفاصيل
            ],
          ),
        ),
      ),
    );
  }
}