// lib/widgets/medicine_search_bar.dart
import 'package:flutter/material.dart'; // استيراد مكتبة فلاتر
import 'package:provider/provider.dart'; // استيراد مكتبة Provider
import '../providers/medical_provider.dart'; // استيراد مزود البيانات الطبية
import '../utils/constants.dart'; // استيراد الثوابت (إذا كانت موجودة)

class MedicineSearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        // تحديث استعلام البحث عن الأدوية عند تغيير النص
        context.read<MedicalProvider>().updateMedicineSearchQuery(value);
      },
      decoration: InputDecoration(
        hintText: 'ابحث عن الأدوية', // نص تلميحي داخل حقل البحث
        prefixIcon: Icon(Icons.medication, color: Colors.grey), // أيقونة تمثل الأدوية قبل نص الإدخال
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 20), // حشوة داخلية للحقل
        filled: true, // ملء الخلفية
        fillColor: Colors.grey[200], // لون خلفية الحقل
        suffixIcon: IconButton(
          icon: Icon(Icons.clear, color: Colors.grey), // أيقونة واضحة
          onPressed: () {
            // استدعاء دالة لمسح استعلام البحث في حالة الضغط على الأيقونة
            context.read<MedicalProvider>().clearMedicineSearch();
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30), // تدوير زوايا الحقل
          borderSide: BorderSide.none, // عدم إظهار حدود
        ),
      ),
    );
  }
}