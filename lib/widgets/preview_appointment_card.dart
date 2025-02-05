import 'package:flutter/material.dart';

class PreviewAppointmentCard extends StatelessWidget {
  final String daysAgo;
  final String? imagePath;
  final String doctorName;
  final String doctorSpecialty;
  final String date;
  final String timeToken;
  final String place;
  final VoidCallback? onCardTap;
  final VoidCallback? onAddReview;

  const PreviewAppointmentCard({
    super.key,
    required this.daysAgo,
    this.imagePath,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.date,
    required this.timeToken,
    required this.place,
    this.onCardTap,
    this.onAddReview,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onCardTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة الطبيب
              _buildDoctorAvatar(theme),
              const SizedBox(width: 16),

              // تفاصيل الموعد
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // العنوان مع عدد الأيام
                    _buildHeader(textTheme),
                    const SizedBox(height: 8),

                    // معلومات الطبيب
                    _buildDoctorInfo(textTheme),
                    const SizedBox(height: 8),

                    // تفاصيل الموعد
                    _buildAppointmentDetails(textTheme, theme),
                    const SizedBox(height: 8),

                    // زر إضافة مراجعة
                    _buildReviewButton(theme),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorAvatar(ThemeData theme) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: theme.colorScheme.primaryContainer,
      backgroundImage: imagePath != null ? AssetImage(imagePath!) : null,
      child: imagePath == null
          ? const Icon(Icons.person, size: 32)
          : null,
    );
  }

  Widget _buildHeader(TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$daysAgo أيام مضت',
          style: textTheme.bodyLarge?.copyWith(
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(Icons.chevron_right, color: Colors.grey[600]),
      ],
    );
  }

  Widget _buildDoctorInfo(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          doctorName,
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          doctorSpecialty,
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildAppointmentDetails(TextTheme textTheme, ThemeData theme) {
    final detailStyle = textTheme.bodyMedium?.copyWith(
      color: theme.colorScheme.onSurface.withOpacity(0.8),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow(Icons.calendar_today, 'التاريخ: $date', detailStyle),
        const SizedBox(height: 4),
        _buildDetailRow(Icons.access_time, 'الوقت/الرمز: $timeToken', detailStyle),
        const SizedBox(height: 4),
        _buildDetailRow(Icons.location_on, 'المكان: $place', detailStyle),
      ],
    );
  }

  Widget _buildDetailRow(IconData icon, String text, TextStyle? style) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[600]),
        const SizedBox(width: 8),
        Text(text, style: style),
      ],
    );
  }

  Widget _buildReviewButton(ThemeData theme) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onAddReview,
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        icon: const Icon(Icons.edit, size: 18),
        label: const Text('إضافة مراجعة'),
      ),
    );
  }
}
