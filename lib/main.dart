
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tawaky_portfolio/core/utils/app_colors.dart';
import 'package:tawaky_portfolio/core/utils/app_fonts.dart';
import 'package:tawaky_portfolio/core/utils/app_strings.dart';
import 'package:tawaky_portfolio/core/utils/extensions/num_extensions.dart';
import 'package:tawaky_portfolio/models/professional_experience_model.dart';
import 'package:tawaky_portfolio/models/technincal_skills_model.dart';
import 'package:tawaky_portfolio/view/sections/experience_section.dart';
import 'package:tawaky_portfolio/view/sections/info_section.dart';
import 'package:tawaky_portfolio/view/sections/skills_section.dart';

void main() {
  runApp(MyApp());
}

List<ProfessionalExperienceModel> professionalExperiences = [
  ProfessionalExperienceModel(
    position: 'Flutter Developer',
    company: 'HA Technology',
    dateRange: 'June 2025 – Present',
    description:
        'Designed and implemented a comprehensive PV Solar SCADA System with advanced features:',
    highlights: [
      'Integrated PLC communication via Snap7 for real-time industrial data acquisition',
      'Implemented RBAC authentication system for secure access control',
      'Developed dynamic Excel-imported tag management for flexible system configuration',
      'Created real-time telemetry visualization using LTTB downsampling and Flutter Canvas',
    ],
    skills: [
      'Flutter',
      'Dart',
      'Snap7',
      'RBAC',
      'LTTB',
      'Canvas',
      'SCADA',
      'IoT',
    ],
  ),
];
final List<TechnicalSkillsModel> skillsData = [
  TechnicalSkillsModel(
    icon: FontAwesomeIcons.code,
    title: "Languages & Tools",
    items: ["Flutter", "Dart", "Firebase", "Git", "GitHub", "C", "C++", "OOP"],
  ),
  TechnicalSkillsModel(
    icon: FontAwesomeIcons.projectDiagram,
    title: "Architecture",
    items: ["MVVM", "Clean Architecture", "Design Patterns"],
  ),
  TechnicalSkillsModel(
    icon: FontAwesomeIcons.database,
    title: "State Management",
    items: ["Cubit", "Bloc", "Provider"],
  ),
  TechnicalSkillsModel(
    icon: FontAwesomeIcons.database,
    title: "Databases",
    items: ["Hive", "sqflite", "Shared Preferences"],
  ),
  TechnicalSkillsModel(
    icon: FontAwesomeIcons.microchip,
    title: "Hardware Knowledge",
    items: ["Electronics", "Wireless", "Microcontrollers", "Sensors"],
  ),
  TechnicalSkillsModel(
    icon: FontAwesomeIcons.userGear,
    title: "Soft Skills",
    items: ["Problem-solving", "Teamwork", "Communication", "Time Management"],
  ),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: AppColors.gradientBackground),
          child: SingleChildScrollView(
            child: Column(
              children: [
                InfoSection(),
                SizedBox(height: 20.h(context)),
                ProfessionalExperienceSection( professionalExperiences: professionalExperiences),
                SizedBox(height: 20.h(context)),
                SkillsSection(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}










class SpecialButton extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final String title;

  const SpecialButton({
    super.key,
    required this.textColor,
    required this.backgroundColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.buttonSky, width: 1),
        color: backgroundColor,
        // color: Color(0XFF00BFFF),
        borderRadius: BorderRadius.circular(10.sp(context)),
      ),
      alignment: Alignment.center,
      height: 44,
      width: 163.13,
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: AppFonts.poppins,
        ),
      ),
    );
  }
}

class GradientCard extends StatefulWidget {
  final Widget child;
  final Color color1Begin;
  final Color color2Begin;
  final Color color1End;
  final Color color2End;
  const GradientCard({
    super.key,
    required this.child,
    required this.color1Begin,
    required this.color2Begin,
    required this.color1End,
    required this.color2End,
  });

  @override
  State<GradientCard> createState() => _GradientCardState();
}

class _GradientCardState extends State<GradientCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _color1;
  late Animation<Color?> _color2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _color1 = ColorTween(
      begin: widget.color1Begin,
      end: widget.color1End,
    ).animate(_controller);
    _color2 = ColorTween(
      begin: widget.color2Begin,
      end: widget.color2End,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [_color1.value!, _color2.value!]),
            borderRadius: BorderRadius.circular(16),
          ),
          child: widget.child,
        );
      },
    );
  }
}

class ExperienceCard extends StatelessWidget {
  final ProfessionalExperienceModel Experience;

  const ExperienceCard({super.key, required this.Experience});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 920,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey, width: 0.5),
        color: AppColors.cardBackgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.primaryBackgroundColor,
            radius: 8.r(context),
            child: CircleAvatar(
              backgroundColor: AppColors.borderSkyLight,
              radius: 5.r(context),
            ),
          ),
          SizedBox(width: 8.w(context)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// HEADER ROW
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.briefcase,
                          color: Color(0XFF02AEE9),
                        ),
                        SizedBox(width: 2.w(context)),
                        Text(
                          Experience.position,
                          style: const TextStyle(
                            color: Color(0XFFF2F2F2),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    /// DATE RANGE
                  ],
                ),

                const SizedBox(height: 12),

                /// POSITION

                /// COMPANY
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      Experience.company,
                      style: const TextStyle(
                        color: AppColors.textSky,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          size: 18,
                          color: Color(0XFF8F96A3),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          Experience.dateRange,
                          style: const TextStyle(
                            color: Color(0XFF8F96A3),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                
                Text.rich(
                  TextSpan(
                    text: AppStrings.haDescription1,
                    style: TextStyle(
                      fontSize: 16.sp(context),
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                    children: [
                      TextSpan(
                        text: AppStrings.haDescription2,
                        style: TextStyle(
                          fontSize: 16.sp(context),
                          color: AppColors.textSky,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: AppStrings.haDescription3,
                        style: TextStyle(
                          fontSize: 16.sp(context),
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                /// HIGHLIGHTS
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: Experience.highlights.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "▸  ",
                            style: TextStyle(
                              color: Color(0XFF00BFFF),
                              fontSize: 16,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(
                                color: Color(0XFF8F96A3),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 20),

                /// SKILL TAGS
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: Experience.skills.map((skill) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 14,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0XFF0D5673).withOpacity(0.25),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0XFF0D5673)),
                      ),
                      child: Text(
                        skill,
                        style: const TextStyle(
                          color: Color(0XFF02AEE9),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final TechnicalSkillsModel model;

  const SkillCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ICON
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.15),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(model.icon, color: Colors.blue, size: 30),
          ),

          const SizedBox(height: 16),

          // TITLE
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          // SKILLS AS TAGS
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: model.items
                .map(
                  (item) => Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class SkillsGridView extends StatelessWidget {
  const SkillsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(20),
      itemCount: skillsData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 2 columns
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 2.1,
      ),
      itemBuilder: (context, index) {
        return SkillCard(model: skillsData[index]);
      },
    );
  }
}
