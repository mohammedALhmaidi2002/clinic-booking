import 'package:flutter/material.dart'; // استيراد مكتبة فلاتر

class CategoryItem extends StatelessWidget {
  final String label; // عنوان الفئة
  final Color color; // لون الفئة
  final bool isSelected; // حالة التحديد
  final VoidCallback onTap; // دالة يتم استدعاؤها عند الضغط على العنصر

  // بناء الكائن مع جميع المتغيرات المطلوبة
  CategoryItem({
    required this.label,
    required this.color,
    this.isSelected = false, // القيمة الافتراضية لعدم التحديد
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0), // إضافة هوامش
      child: GestureDetector(
        onTap: onTap, // استدعاء الدالة عند الضغط
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // إضافة هوامش داخلية
          decoration: BoxDecoration(
            color: isSelected ? color : Colors.grey[200], // لون الخلفية بناءً على حالة التحديد
            borderRadius: BorderRadius.circular(30), // تدوير زوايا العنصر
          ),
          child: Text(
            label, // نص العنصر
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black, // لون النص بناءً على حالة التحديد
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // وزن النص بناءً على حالة التحديد
            ),
          ),
        ),
      ),
    );
  }
}