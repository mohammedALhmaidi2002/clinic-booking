import 'package:flutter/material.dart';
import '../../models/pharmacy.dart';
import '../../utils/constants.dart';

class PharmacyDetailScreen extends StatelessWidget {
  final Pharmacy pharmacy;

  const PharmacyDetailScreen({super.key, required this.pharmacy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildPharmacyImage(),
            ),
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.share),
                ),
                onPressed: () => _sharePharmacyDetails(),
              ),
            ],
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
                  const SizedBox(height: 25),
                  _buildMedicinesSection(),
                  const SizedBox(height: 25),
                  _buildAdditionalInfoSection(),
                  const SizedBox(height: 30),
                  _buildActionButtons(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPharmacyImage() {
    return Hero(
      tag: 'pharmacy-${pharmacy.id}',
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
        child: Image.asset(
          pharmacy.imagePaths.first,
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
                pharmacy.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryDark,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.location_pin,
                      color: Colors.red.withOpacity(0.8), size: 22),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      pharmacy.location,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.amber, size: 20),
          const SizedBox(width: 4),
          Text(
            pharmacy.rating.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildInfoRow(Icons.access_time_filled, "أوقات العمل", "24 ساعة"),
          const Divider(height: 30),
          _buildInfoRow(Icons.credit_card, "طرق الدفع", "نقدي - بطاقات ائتمان"),
          const Divider(height: 30),
          _buildInfoRow(Icons.delivery_dining, "التوصيل", "متاح داخل المدينة"),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String title, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.primary),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMedicinesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "الأدوية المتوفرة",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
          ),
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: pharmacy.medicines.map((medicine) => Chip(
            labelPadding: const EdgeInsets.symmetric(horizontal: 12),
            backgroundColor: AppColors.primaryLight,
            label: Text(
              medicine,
              style: const TextStyle(color: Colors.white),
            ),
            avatar: const Icon(Icons.medical_services, size: 18, color: Colors.white),
          )).toList(),
        ),
      ],
    );
  }

  Widget _buildAdditionalInfoSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildAdditionalInfoItem("الصيدلية مرخصة", Icons.verified_user),
          const Divider(height: 30),
          _buildAdditionalInfoItem("صيدلية معتمدة", Icons.medical_information),
          const Divider(height: 30),
          _buildAdditionalInfoItem("خدمة عملاء 24/7", Icons.support_agent),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfoItem(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: AppColors.primary),
        const SizedBox(width: 15),
        Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.phone, size: 24),
            label: const Text("اتصال فوري"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () => _showContactOptions(context),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.directions, size: 24),
            label: const Text("التوجيه"),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () => _openMaps(),
          ),
        ),
      ],
    );
  }

  void _showContactOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "خيارات الاتصال",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.green),
              title: const Text("مكالمة صوتية"),
              onTap: () => _makePhoneCall(),
            ),
            ListTile(
              leading: const Icon(Icons.message, color: Colors.blue),
              title: const Text("رسالة نصية"),
              onTap: () => _sendSMS(),
            ),
            ListTile(
              leading: const Icon(Icons.water_drop_sharp, color: Colors.green),
              title: const Text("واتساب"),
              onTap: () => _openWhatsApp(),
            ),
          ],
        ),
      ),
    );
  }

  void _sharePharmacyDetails() {
    // Implementation for sharing
  }

  void _openMaps() {
    // Implementation for maps
  }

  void _makePhoneCall() {
    // Implementation for phone call
  }

  void _sendSMS() {
    // Implementation for SMS
  }

  void _openWhatsApp() {
    // Implementation for WhatsApp
  }
}