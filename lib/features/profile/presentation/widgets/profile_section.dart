// lib/features/profile/presentation/widgets/profile_section_card.dart

import 'package:flutter/material.dart';
import 'package:dak_karmayogi_app/core/theme/app_colors.dart';

class ProfileSectionCard extends StatelessWidget {
  final String title;
  final Widget child;
  final IconData icon;
  final bool initiallyExpanded;

  const ProfileSectionCard({
    super.key,
    required this.title,
    required this.child,
    this.icon = Icons.info_outline,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.05),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200, width: 1),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          backgroundColor: Colors.white,
          collapsedBackgroundColor: Colors.white,
          iconColor: AppColors.primary,
          collapsedIconColor: Colors.grey.shade600,
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: AppColors.primary, size: 20),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 24),
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}