import 'package:flutter/material.dart';
import 'package:tawaky_portfolio/continuous_bounce_effect.dart';
import 'package:tawaky_portfolio/core/utils/app_assets.dart';
import 'package:tawaky_portfolio/core/utils/app_colors.dart';
import 'package:tawaky_portfolio/core/utils/app_enums.dart';
import 'package:tawaky_portfolio/core/utils/app_strings.dart';
import 'package:tawaky_portfolio/core/utils/extensions/num_extensions.dart';
import 'package:tawaky_portfolio/main.dart';
import 'package:tawaky_portfolio/view/widgets/social_media_button.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    text: AppStrings.greeting,
                    style: TextStyle(
                      fontSize: 60.sp(context),
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                    children: [
                      // TextSpan(
                      //   text: AppStrings.myName,
                      //   style: TextStyle(
                      //     backgroundColor: AppColors.textBlack,
                      //     fontSize: 80,
                      //     color: AppColors.borderSkyLight,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                GradientCard(
                  color1Begin: AppColors.buttonSky,
                  color2Begin: AppColors.borderSkyMedium,
                  color1End: AppColors.borderSkyDark,
                  color2End: AppColors.backGroundSkyDark,
                  child: Text(
                    AppStrings.myName,
                    style: TextStyle(
                      fontSize: 60.sp(context),
                      color: AppColors.primaryBackgroundColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            Text(
              AppStrings.jobTitle,
              style: TextStyle(
                fontSize: 30.sp(context),
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              AppStrings.subtitle,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                SpecialButton(
                  textColor: AppColors.textBlack,
                  backgroundColor: AppColors.buttonSky,
                  title: AppStrings.viewMyWork,
                ),
                SizedBox(width: 10),
                SpecialButton(
                  textColor: AppColors.textSky,
                  title: AppStrings.cv,
                  backgroundColor: AppColors.primaryBackgroundColor,
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SocialMediaButton(platform: SocialMediaPlatform.github),
                SocialMediaButton(platform: SocialMediaPlatform.linkedin),
                SocialMediaButton(platform: SocialMediaPlatform.gmail),
                SocialMediaButton(platform: SocialMediaPlatform.whatsapp),
                SocialMediaButton(platform: SocialMediaPlatform.x),
              ],
            ),
          ],
        ),
        Spacer(),
        ContinuousBounceEffect(
          duration: 1200,
          speedFactor: 1.5,
          bounceDistance: -8,
          child: Container(
            height: 350,
            width: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.borderSkyDark, width: 4),
              image: DecorationImage(
                image: AssetImage(Assets.imagesTawaky),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
