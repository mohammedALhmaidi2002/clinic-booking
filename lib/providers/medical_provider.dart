// lib/providers/medical_provider.dart
import 'package:flutter/material.dart';
import '../models/doctor.dart';
import '../models/pharmacy.dart';

class MedicalProvider with ChangeNotifier {
  // قائمة الأطباء
  List<Doctor> _allDoctors = [
    Doctor(
      name: 'د. أحمد علي',
      specialization: 'أمراض القلب',
      rating: 4.8,
      location: 'القاهرة',
      imagePaths: [
        'assets/images/pro4.jpg',
        'assets/images/pro4.jpg',
      ],
    ),
    Doctor(
      name: 'د. فاطمة محمد',
      specialization: 'الأمراض الجلدية',
      rating: 4.6,
      location: 'الإسكندرية',
      imagePaths: [
        'assets/images/pro6.jpg',
        'assets/images/pro11.jpg',
      ],
    ),
    Doctor(
      name: 'د. خالد سعيد',
      specialization: 'الجراحة العامة',
      rating: 4.7,
      location: 'الجيزة',
      imagePaths: [
        'assets/images/pro12.jpg',
        'assets/images/pro13.jpg',
      ],
    ),
    Doctor(
      name: 'د. سارة إبراهيم',
      specialization: 'طب الأطفال',
      rating: 4.9,
      location: 'السويس',
      imagePaths: [
        'assets/images/prsss.jpg',
        'assets/images/pro15.jpg',
      ],
    ),
    Doctor(
      name: 'د. محمد حسن',
      specialization: 'أمراض القلب',
      rating: 4.5,
      location: 'طنطا',
      imagePaths: [
        'assets/images/pro16.jpg',
        'assets/images/pro17.jpg',
      ],
    ),
    // يمكنك إضافة المزيد من الأطباء هنا إذا لزم الأمر
  ];

  // قائمة الصيدليات
  List<Pharmacy> _allPharmacies = [
    Pharmacy(
      name: 'صيدلية الأولى',
      medicines: ['أسبرين', 'باراسيتامول', 'أموكسيسيلين'],
      location: 'الجيزة',
      rating: 4.5,
      imagePaths: [
        'assets/images/pro18.jpg',
        'assets/images/pro19.jpg',
      ],
    ),
    Pharmacy(
      name: 'صيدلية الحياة',
      medicines: ['فيتامين C', 'إيبوبروفين', 'سيتالوبرام'],
      location: 'القاهرة',
      rating: 4.7,
      imagePaths: [
        'assets/images/pro21.jpg',
        'assets/images/pro22.jpg',
      ],
    ),
    Pharmacy(
      name: 'صيدلية النهضة',
      medicines: ['باراسيتامول', 'سيتالوبرام', 'أوميبرازول'],
      location: 'الإسكندرية',
      rating: 4.6,
      imagePaths: [
        'assets/images/pro23.jpg',
        'assets/images/pro24.jpg',
      ],
    ),
    Pharmacy(
      name: 'صيدلية الوفاء',
      medicines: ['أموكسيسيلين', 'أسبرين', 'فيتامين D'],
      location: 'السويس',
      rating: 4.8,
      imagePaths: [
        'assets/images/pro1.jpg',
        'assets/images/pro2.jpg',
      ],
    ),
    Pharmacy(
      name: 'صيدلية الأمل',
      medicines: ['إيبوبروفين', 'باراسيتامول', 'أوميبرازول'],
      location: 'طنطا',
      rating: 4.4,
      imagePaths: [
        'assets/images/pro25.jpg',
        'assets/images/pro26.jpg',
      ],
    ),
    // يمكنك إضافة المزيد من الصيدليات هنا إذا لزم الأمر
  ];

  String _selectedSpecialization = 'All';
  String _medicineSearchQuery = '';

  // الحصول على قائمة الأطباء بناءً على التخصص المحدد
  List<Doctor> get doctors {
    if (_selectedSpecialization == 'All') {
      return _allDoctors;
    } else {
      return _allDoctors.where((doctor) =>
      doctor.specialization.toLowerCase() ==
          _selectedSpecialization.toLowerCase()).toList();
    }
  }

  // الحصول على قائمة الصيدليات بناءً على البحث عن الدواء
  List<Pharmacy> get pharmacies {
    if (_medicineSearchQuery.isEmpty) {
      return _allPharmacies;
    } else {
      return _allPharmacies.where((pharmacy) =>
          pharmacy.medicines.any((medicine) =>
              medicine.toLowerCase().contains(_medicineSearchQuery.toLowerCase()))
      ).toList();
    }
  }

  String get selectedSpecialization => _selectedSpecialization;

  // تحديد التخصص
  void selectSpecialization(String specialization) {
    _selectedSpecialization = specialization;
    notifyListeners();
  }

  // تحديث استعلام البحث عن الدواء
  void updateMedicineSearchQuery(String query) {
    _medicineSearchQuery = query;
    notifyListeners();
  }

  // مسح استعلام البحث عن الدواء
  void clearMedicineSearch() {
    _medicineSearchQuery = '';
    notifyListeners();
  }
}
