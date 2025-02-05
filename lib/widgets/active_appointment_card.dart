import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ActiveAppointmentCard extends StatelessWidget {
  final String imagePath;
  final String doctorName;
  final String doctorSpecialty;
  final String date;
  final String daysRemaining;
  final String timeToken;
  final String place;
  final VoidCallback? onReschedule;
  final VoidCallback? onCancel;
  final VoidCallback? onCardTap;

  const ActiveAppointmentCard({
    super.key,
    required this.imagePath,
    required this.doctorName,
    required this.doctorSpecialty,
    required this.date,
    required this.daysRemaining,
    required this.timeToken,
    required this.place,
    this.onReschedule,
    this.onCancel,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final colors = theme.colorScheme;

    return Card(
      elevation: 1,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isDarkMode ? colors.outline : colors.outlineVariant,
          width: 0.5,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onCardTap,
        splashFactory: InkSparkle.splashFactory,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صورة الطبيب مع إطار
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDarkMode ? colors.surfaceVariant : colors.outline,
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // معلومات الموعد
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // العنوان الرئيسي
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            doctorName,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: colors.onSurface,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.verified_rounded,
                          color: colors.primary,
                          size: 20,
                        ),
                      ],
                    ),
                    Text(
                      doctorSpecialty,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // تفاصيل الموعد
                    _buildDetailItem(
                      icon: Icons.calendar_month_rounded,
                      title: 'التاريخ',
                      value: date,
                      color: colors.primary,
                    ),
                    _buildDetailItem(
                      icon: Icons.access_time_rounded,
                      title: 'الوقت المتبقي',
                      value: '$daysRemaining أيام',
                      color: colors.secondary,
                    ),
                    _buildDetailItem(
                      icon: Icons.location_on_rounded,
                      title: 'المكان',
                      value: place,
                      color: colors.tertiary,
                    ),
                    const SizedBox(height: 8),

                    // أزرار الإجراءات
                    if (onReschedule != null || onCancel != null)
                      Row(
                        children: [
                          if (onReschedule != null)
                            _buildActionButton(
                              context: context,
                              icon: Icons.edit_calendar_rounded,
                              label: 'إعادة الجدولة',
                              color: isDarkMode ? Colors.green[300]! : Colors.green,
                            ),
                          if (onReschedule != null && onCancel != null)
                            const SizedBox(width: 8),
                          if (onCancel != null)
                            _buildActionButton(
                              context: context,
                              icon: Icons.close_rounded,
                              label: 'إلغاء',
                              color: isDarkMode ? Colors.red[300]! : Colors.red,
                            ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(
            '$title: ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Flexible(
      child: FilledButton.icon(
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          elevation: 0,
          enableFeedback: true,
        ),
        onPressed: () {
          // إضافة تأثير اهتزاز عند الضغط
          HapticFeedback.lightImpact();
          // تنفيذ الإجراء المطلوب
          if (label == 'إلغاء') {
            onCancel?.call();
          } else {
            onReschedule?.call();
          }
        },
      ),
    );
  }
}