import 'package:flutter/material.dart'; // استيراد مكتبة فلاتر

class ProceedScreen extends StatefulWidget {
  const ProceedScreen({Key? key}) : super(key: key); // منشئ الكلاس

  @override
  State<ProceedScreen> createState() => _ProceedScreenState(); // إنشاء حالة الشاشة
}

class _ProceedScreenState extends State<ProceedScreen> {
  bool _isPatientAdded = false; // مثال: هل تم إضافة مريض؟ (حالة للتحقق)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proceed'), // عنوان التطبيق
        centerTitle: true, // مركز العنوان
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // هوامش
          child: Column(
            children: [
              // 1) معلومات الطبيب
              _buildDoctorInfoSection(), // دالة لبناء قسم معلومات الطبيب

              const SizedBox(height: 16), // فراغ عمودي
              // 2) تفاصيل المريض
              _buildPatientDetailsSection(), // دالة لبناء قسم تفاصيل المريض

              const SizedBox(height: 16), // فراغ عمودي
              // 3) تفاصيل الدفع
              _buildPaymentDetailsSection(), // دالة لبناء قسم تفاصيل الدفع

              const SizedBox(height: 24), // فراغ عمودي
              // 4) الشروط والأحكام
              _buildTermsAndConditions(), // دالة لبناء قسم الشروط والأحكام

              const SizedBox(height: 16), // فراغ عمودي
              // زر حجز الموعد
              _buildBookAppointmentButton(context), // دالة لبناء زر حجز الموعد
            ],
          ),
        ),
      ),
    );
  }

  // ----------------------------------
  // 1) قسم معلومات الطبيب بالأعلى
  // ----------------------------------
  Widget _buildDoctorInfoSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start, // محاذاة العناصر من الأعلى
      children: [
        // صورة الطبيب
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0), // تدوير الزوايا
          child: Image.asset(
            'assets/images/pro4.jpg', // مسار صورة الطبيب
            width: 80, // عرض الصورة
            height: 80, // ارتفاع الصورة
            fit: BoxFit.cover, // كيفية ملء الصورة
          ),
        ),
        const SizedBox(width: 16), // فراغ بين الصورة والنص
        // نصوص معلومات الطبيب
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النص
            children: const [
              Text(
                'Dr Denies Martine', // اسم الطبيب
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // تنسيق النص
              ),
              SizedBox(height: 4), // فراغ
              Text(
                'Cardiologist', // تخصص الطبيب
                style: TextStyle(color: Colors.grey), // لون النص
              ),
              SizedBox(height: 8), // فراغ
              Text(
                'Serum Clinic, Rose Dam,\nNear Police Station, West Ham', // عنوان العيادة
                style: TextStyle(fontSize: 14), // تنسيق النص
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ----------------------------------
  // 2) قسم "Patient Details" + زر "Add Patient"
  // ----------------------------------
  Widget _buildPatientDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النص
      children: [
        const Text(
          'Patient Details', // عنوان قسم تفاصيل المريض
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // تنسيق النص
        ),
        const SizedBox(height: 8), // فراغ
        // صندوق كبير بلون فاتح + أيقونة + نص "Add Patient"
        InkWell(
          onTap: () {
            // منطق إضافة مريض
            setState(() {
              _isPatientAdded = true; // تحديث حالة إضافة المريض
            });
          },
          child: Container(
            height: 60, // ارتفاع الحاوية
            width: double.infinity, // ملء العرض الكامل
            decoration: BoxDecoration(
              color: Colors.teal[100], // لون الخلفية
              borderRadius: BorderRadius.circular(12), // تدوير الزوايا
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // محاذاة العناصر في المنتصف
              children: const [
                Icon(Icons.person_add, color: Colors.black54), // أيقونة إضافة مريض
                SizedBox(width: 8), // فراغ
                Text(
                  'Add Patient', // نص إضافة مريض
                  style: TextStyle(color: Colors.black54, fontSize: 16), // تنسيق النص
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ----------------------------------
  // 3) قسم "Payment Details"
  // ----------------------------------
  Widget _buildPaymentDetailsSection() {
    // رسوم افتراضية
    final double consultationFee = 500.0; // رسوم الاستشارة
    final double bookingCharge = 2.50; // رسوم الحجز
    final String hospitalCharge = '--'; // رسوم المستشفى (غير متوفرة)
    final double total = consultationFee + bookingCharge; // المجموع الكلي

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // محاذاة النص
      children: [
        const Text(
          'Payment Details', // عنوان قسم تفاصيل الدفع
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // تنسيق النص
        ),
        const SizedBox(height: 8), // فراغ
        Container(
          width: double.infinity, // ملء العرض الكامل
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300), // border
            borderRadius: BorderRadius.circular(10), // تدوير الزوايا
          ),
          padding: const EdgeInsets.all(16), // هوامش داخلية
          child: Column(
            children: [
              // رسوم الاستشارة
              _buildPaymentRow('Consultation Fee', '$consultationFee'), // دالة لبناء صف رسوم
              // Booking Charge
              _buildPaymentRow('Booking Charge', '$bookingCharge'), // دالة لبناء صف رسوم
              // Hospital Charge
              _buildPaymentRow('Hospital Charge', hospitalCharge), // دالة لبناء صف رسوم
              const SizedBox(height: 8), // فراغ
              const Divider(), // فاصل
              // المجموع
              _buildPaymentRow('Total Amount', total.toStringAsFixed(2), isBold: true), // دالة لبناء صف عدد المجموع
            ],
          ),
        ),
      ],
    );
  }

  // عنصر نصي لسطر الدفع (label - value)
  Widget _buildPaymentRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4), // هوامش عمودية
      child: Row(
        children: [
          Expanded(
            child: Text(
              label, // تسمية الرسوم
              style: TextStyle(
                fontSize: 14,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal, // تنسيق النص بناءً على ما إذا كان عريض
              ),
            ),
          ),
          Text(
            value, // قيمة الرسوم
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal, // تنسيق النص بناءً على ما إذا كان عريض
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------
  // 4) قسم الشروط والأحكام
  // ----------------------------------
  Widget _buildTermsAndConditions() {
    return Column(
      children: const [
        SizedBox(height: 20), // فراغ
        Text(
          'Terms And Conditions', // عنوان الشروط والأحكام
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // تنسيق النص
        ),
        SizedBox(height: 8), // فراغ
        Text(
          "The Document Governing The Contractual\nRelationship Between The Provider Of A Service And\nIts User. On The Web, This Document Is Often Also\nCalled “Terms Of Service” (ToS).", // محتوى الشروط والأحكام
          textAlign: TextAlign.center, // محاذاة النص في المنتصف
          style: TextStyle(fontSize: 14, color: Colors.grey), // تنسيق النص
        ),
        SizedBox(height: 20), // فراغ
      ],
    );
  }

  // ----------------------------------
  // زر "Book Appointment" في الأسفل
  // ----------------------------------
  Widget _buildBookAppointmentButton(BuildContext context) {
    return SizedBox(
      width: double.infinity, // ملء العرض الكامل
      child: ElevatedButton(
        onPressed: () {
          // منطق الحجز
          // يمكنك الانتقال لصفحة تأكيد نهائي / الدفع
          Navigator.pop(context); // العودة إلى الصفحة السابقة
          // أو Navigator.pushNamed(context, ...) للانتقال إلى صفحة أخرى
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey, // لون الزر
          padding: const EdgeInsets.symmetric(vertical: 16), // هوامش داخلية
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // تدوير الزوايا
          ),
        ),
        child: const Text(
          'Book Appointment', // نص زر حجز الموعد
          style: TextStyle(fontSize: 16, color: Colors.white), // تنسيق النص
        ),
      ),
    );
  }
}