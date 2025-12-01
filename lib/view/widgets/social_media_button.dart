import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tawaky_portfolio/core/utils/app_colors.dart';
import 'package:tawaky_portfolio/core/utils/app_enums.dart';
import 'package:tawaky_portfolio/core/utils/extensions/num_extensions.dart';

class SocialMediaButton extends StatelessWidget {
  final SocialMediaPlatform platform;
  const SocialMediaButton({super.key, required this.platform});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey, width: 1),
        borderRadius: BorderRadius.circular(14.sp(context)),
        color: AppColors.cardBackgroundColor,
      ),
      child: switch (platform) {
        SocialMediaPlatform.github => Icon(
          FontAwesomeIcons.github,
          color: AppColors.grey,
          size: 24.sp(context),
        ),

        SocialMediaPlatform.linkedin => Icon(
          FontAwesomeIcons.linkedin,
          color: AppColors.grey,
          size: 24.sp(context),
        ),

        SocialMediaPlatform.whatsapp => Icon(
          FontAwesomeIcons.whatsapp,
          color: AppColors.grey,
          size: 24.sp(context),
        ),
        SocialMediaPlatform.x => Icon(
          FontAwesomeIcons.xTwitter,
          color: AppColors.grey,
          size: 24.sp(context),
        ),
        SocialMediaPlatform.gmail => Icon(
          Icons.mail,
          color: AppColors.grey,
          size: 24.sp(context),
        ),
        // default case (fallback)
        _ => Icon(Icons.error, color: Colors.red),
      },
    );
  }
}
