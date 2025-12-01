import 'package:flutter/material.dart';
import 'package:tawaky_portfolio/core/utils/app_colors.dart';
import 'package:tawaky_portfolio/core/utils/app_strings.dart';
import 'package:tawaky_portfolio/core/utils/extensions/num_extensions.dart';
import 'package:tawaky_portfolio/main.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            text: AppStrings.technical,
            style: TextStyle(
              fontSize: 48.sp(context),
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
            children: [
              TextSpan(
                text: AppStrings.skills,
                style: TextStyle(
                  fontSize: 48.sp(context),
                  color: AppColors.borderSkyLight,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Text(
          AppStrings.technicalSkillsSubtitle,
          style: TextStyle(
            fontSize: 18.sp(context),
            color: AppColors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SkillsGridView(),
        // TechnicalSkillsCard(model: technicalSkills[0]),
      ],
    );
  }
}