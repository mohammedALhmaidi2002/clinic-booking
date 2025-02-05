import 'package:flutter/material.dart'; // استيراد مكتبة فلاتر

class BookNowScreen extends StatefulWidget {
  const BookNowScreen({Key? key}) : super(key: key); // منشئ الكلاس

  @override
  State<BookNowScreen> createState() => _BookNowScreenState(); // إنشاء حالة الشاشة
}

class _BookNowScreenState extends State<BookNowScreen> {
  // أمثلة للتواريخ
  final List<String> _dates = ['اليوم', 'غدًا', '12 يونيو', '13 يونيو', '14']; // قائمة بالخيارات للتواريخ
  int _selectedDateIndex = 0; // مؤشر التاريخ المحدد (البداية هو اليوم)

  // أمثلة للأوقات
  final List<String> _timeSlots = [
    '4:00 مساءً',
    '4:15 مساءً',
    '4:30 مساءً',
    '4:45 مساءً',
    '5:00 مساءً',
    '5:15 مساءً',
    '5:30 مساءً',
    '5:45 مساءً',
    '6:00 مساءً',
  ];
  int? _selectedTimeIndex; // لا يوجد وقت محدد في البداية

  bool _shareFiles = false; // حالة مربع الاختيار (checkbox)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('احجز الآن'), // عنوان التطبيق
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 1) معلومات الطبيب
          _buildDoctorInfo(), // دالة لبناء معلومات الطبيب
          const Divider(thickness: 1, height: 1), // فاصل
          // 2) اختيار التاريخ والوقت
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0), // إضافة الهوامش
              child: Column(
                children: [
                  _buildDateSelector(), // دالة لبناء واجهة اختيار التاريخ
                  const SizedBox(height: 16),
                  _buildTimeSlots(), // دالة لبناء واجهة اختيار الوقت
                  const SizedBox(height: 16),
                  // 3) الشروط
                  _buildTermsAndConditions(), // دالة لبناء واجهة الشروط والأحكام
                ],
              ),
            ),
          ),
          // 4) زر Proceed
          Container(
            width: double.infinity, // ملء العرض الكامل
            color: Colors.blue, // لون الخلفية
            child: TextButton(
              onPressed: () {
                // الانتقال إلى صفحة التأكيد/الدفع
                Navigator.pushNamed(context, '/confirm_booking'); // التنقل إلى صفحة التأكيد
              },
              child: const Text(
                'استمر',
                style: TextStyle(color: Colors.white, fontSize: 18), // نص الزر
              ),
            ),
          )
        ],
      ),
    );
  }

  // ---------------------------
  // بناء معلومات الطبيب بالأعلى
  // ---------------------------
  Widget _buildDoctorInfo() {
    return Container(
      padding: const EdgeInsets.all(16.0), // إضافة الهوامش
      color: Colors.white, // خلفية بيضاء
      child: Row(
        children: [
          // صورة
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
          // نص
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'د. دينيس مارتين', // اسم الطبيب
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // تنسيق النص
                ),
                Text(
                  'MBBS, MD\nأخصائي قلب', // تخصص الطبيب
                  style: TextStyle(color: Colors.grey), // لون النص
                ),
                SizedBox(height: 8), // فراغ عمودي
                Text(
                  'عيادة سيروم، روز دام،\nبجوار مركز الشرطة، ويست هام', // مكان العيادة
                  style: TextStyle(fontSize: 14), // تنسيق النص
                ),
              ],
            ),
          ),
          // الرسوم
          const SizedBox(width: 12), // فراغ بين النص والسعر
          const Text(
            '₹ 500', // الرسوم
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // تنسيق النص
          ),
        ],
      ),
    );
  }

  // ---------------------------
  // اختيار التاريخ
  // ---------------------------
  Widget _buildDateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'اختر تاريخًا', // عنوان اختيار التاريخ
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // تنسيق النص
        ),
        const SizedBox(height: 8), // فراغ عمودي
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // تمرير أفقي
          child: Row(
            children: List.generate(_dates.length, (index) {
              final isSelected = _selectedDateIndex == index; // تحديد ما إذا كان التاريخ مختارًا
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDateIndex = index; // تعيين التاريخ المحدد
                  });
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // هوامش داخلية
                  margin: const EdgeInsets.only(right: 8), // هوامش خارجية
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.blue : Colors.grey[300], // لون الخلفية بناءً على تحديد التاريخ
                    borderRadius: BorderRadius.circular(20), // تدوير الزوايا
                  ),
                  child: Text(
                    _dates[index], // عرض التاريخ
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black, // لون النص بناءً على تحديد التاريخ
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 8), // فراغ عمودي
        // مثال على اليوم المختار
        Text(
          'اليوم\n10/6/2023', // يمكنك تحديثها ديناميكيًا
          style: const TextStyle(color: Colors.grey), // لون النص
        ),
      ],
    );
  }

  // ---------------------------
  // اختيار الأوقات المتاحة
  // ---------------------------
  Widget _buildTimeSlots() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '9 أوقات متاحة', // عدد الأوقات المتاحة
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // تنسيق النص
        ),
        const Text('4 مساءً - 6 مساءً', style: TextStyle(color: Colors.grey)), // نطاق الوقت
        const SizedBox(height: 12), // فراغ عمودي
        Wrap(
          spacing: 10, // تباعد بين العناصر
          runSpacing: 10, // تباعد عمودي بين العناصر
          children: List.generate(_timeSlots.length, (index) {
            final isSelected = _selectedTimeIndex == index; // تحقق من تحديد الوقت
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedTimeIndex = index; // تعيين الوقت المحدد
                });
              },
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // هوامش داخلية
                decoration: BoxDecoration(
                  color: isSelected ? Colors.teal[300] : Colors.grey[200], // لون الوقت بناءً على تحديد
                  borderRadius: BorderRadius.circular(20), // تدوير الزوايا
                ),
                child: Text(
                  _timeSlots[index], // عرض الوقت
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black, // لون النص بناءً على تحديد الوقت
                  ),
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  // ---------------------------
  // الشروط (Terms & Conditions)
  // ---------------------------
  Widget _buildTermsAndConditions() {
    return Column(
      children: [
        const Divider(thickness: 1, height: 40), // فاصل
        const Text(
          'الشروط والأحكام', // عنوان الشروط والأحكام
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // تنسيق النص
        ),
        const SizedBox(height: 8), // فراغ عمودي
        const Text(
          "إن المستند الذي يحكم العلاقة التعاقدية..."
              "\nعلى الويب، غالبًا ما يُطلق على هذا المستند أيضًا اسم “شروط الخدمة” (ToS).", // محتوى الشروط والأحكام
          style: TextStyle(fontSize: 14, color: Colors.grey), // تنسيق النص
          textAlign: TextAlign.center, // محاذاة النص في المنتصف
        ),
        const SizedBox(height: 12), // فراغ عمودي
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // محاذاة العناصر في المنتصف
          children: [
            Checkbox(
              value: _shareFiles, // قيمة مربع الاختيار
              onChanged: (val) {
                setState(() {
                  _shareFiles = val ?? false; // تحديث الحالة
                });
              },
              activeColor: Colors.blue, // لون مربع الاختيار عندما يكون نشطًا
            ),
            const SizedBox(width: 4), // فراغ
            const Expanded(
              child: Text(
                'مشاركة جميع الملفات الطبية مع الطبيب', // نص حول المشاركة
                style: TextStyle(fontSize: 14), // تنسيق النص
              ),
            ),
          ],
        ),
      ],
    );
  }
}