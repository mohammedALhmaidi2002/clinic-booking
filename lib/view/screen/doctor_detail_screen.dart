import 'package:flutter/material.dart';
import '../../models/doctor.dart';
import '../../utils/constants.dart';

class DoctorDetailScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildDoctorImage(),
            ),
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: (AppColors.primary ?? Colors.blue).withOpacity(0.8), // قيمة افتراضية
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderSection(),
                  const SizedBox(height: 25),
                  _buildInfoSection(),
                  const SizedBox(height: 30),
                  _buildBookingButton(context),
                  const SizedBox(height: 30),
                  _buildScheduleSection(),
                  const SizedBox(height: 30),
                  _buildReviewsSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorImage() {
    return Hero(
      tag: 'doctor-image-${doctor.id}',
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
        child: Image.asset(
          doctor.imagePaths.first,
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.medical_services,
                      color: AppColors.primary ?? Colors.blue, size: 22), // قيمة افتراضية
                  const SizedBox(width: 10),
                  Text(
                    doctor.specialization,
                    style: TextStyle(
                      fontSize: 20,
                      color: (AppColors.primaryDark ?? Colors.black).withOpacity(0.8), // قيمة افتراضية
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        _buildRatingBadge(),
      ],
    );
  }

  Widget _buildRatingBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.secondary ?? Colors.green, // قيمة افتراضية
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: (AppColors.secondary ?? Colors.green).withOpacity(0.2), // قيمة افتراضية
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 22),
          const SizedBox(width: 6),
          Text(
            doctor.rating.toString(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      children: [
        _buildInfoItem(
          icon: Icons.location_on,
          title: "الموقع",
          content: doctor.location,
        ),
        const SizedBox(height: 20),
        _buildInfoItem(
          icon: Icons.access_time_filled,
          title: "أوقات العمل",
          content: "8:00 صباحًا - 8:00 مساءً (يوميًا)",
        ),
        const SizedBox(height: 20),
        _buildInfoItem(
          icon: Icons.phone,
          title: "اتصال",
          content: "+966 55 123 4567",
        ),
      ],
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    required String content,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: (AppColors.primaryLight ?? Colors.blue[100])!.withOpacity(0.15), // قيمة افتراضية
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: AppColors.primary ?? Colors.blue, size: 26), // قيمة افتراضية
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryDark ?? Colors.black, // قيمة افتراضية
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary ?? Colors.blue, // قيمة افتراضية
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        shadowColor: (AppColors.primary ?? Colors.blue).withOpacity(0.3), // قيمة افتراضية
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: () => _showBookingModal(context),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.calendar_today, size: 26),
          SizedBox(width: 15),
          Text(
            "حجز موعد الآن",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            "المواعيد المتاحة",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              6,
                  (index) => _buildTimeSlot("${8 + index}:00 صباحًا"),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSlot(String time) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        color: (AppColors.primaryLight ?? Colors.blue[100])!.withOpacity(0.1), // قيمة افتراضية
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: (AppColors.primary ?? Colors.blue).withOpacity(0.3)), // قيمة افتراضية
      ),
      child: Text(
        time,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryDark,
        ),
      ),
    );
  }

  Widget _buildReviewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            "التقييمات (4.8)",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
            ),
          ),
        ),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          separatorBuilder: (_, __) => const SizedBox(height: 20),
          itemBuilder: (context, index) => _buildReviewItem(),
        ),
      ],
    );
  }

  Widget _buildReviewItem() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.primary ?? Colors.blue, width: 2), // قيمة افتراضية
                ),
                child: const CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.transparent,
                  child: Icon(Icons.person, color: AppColors.primary),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "محمد أحمد",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: List.generate(
                      5,
                          (index) => const Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            "خدمة ممتازة ودكتور محترف جداً، شرح الحالة بشكل مفصل وواضح",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  void _showBookingModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(25),
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "تأكيد الحجز",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.grey[600]),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("تم الحجز بنجاح"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary ?? Colors.blue, // قيمة افتراضية
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "تأكيد الحجز",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}