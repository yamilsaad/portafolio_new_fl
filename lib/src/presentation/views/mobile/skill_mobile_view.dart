import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillMobileView extends StatefulWidget {
  const SkillMobileView({super.key});

  @override
  State<SkillMobileView> createState() => _SkillMobileViewState();
}

class _SkillMobileViewState extends State<SkillMobileView> {
  bool _isVisible = false;

  static const List<String> _skills = [
    "Dart",
    "Flutter",
    "GetX",
    "SQL",
    "Firebase",
    "Python",
    "Flask",
    "Angular",
    "React",
    "HTML",
    "CSS",
    "JS",
    "Nginx",
    "Git",
    "Jira",
  ];

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).colorScheme.surface,
      height: _screenHeight * 0.5,
      width: _screenWidth,
      child: VisibilityDetector(
        key: Key('skill-mobile'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.2) {
            setState(() {
              _isVisible = true;
            });
          }
        },
        child: _isVisible
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeIn(
                      duration: Duration(milliseconds: 1200),
                      child: Text(
                        'Mi Stack',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: _screenWidth * 0.085,
                          fontFamily: "Ruik",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FadeIn(
                      duration: Duration(milliseconds: 1200),
                      child: SizedBox(
                        width: _screenWidth * 0.3,
                        child: Divider(
                          height: _screenHeight * 0.05,
                          color: Color(0xff21E6C1),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.spaceBetween,
                      children: _skills.map((skill) {
                        return FadeIn(
                          duration: Duration(milliseconds: 1200),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: Color(0xff21E6C1), width: 2),
                            ),
                            child: Text(
                              skill,
                              style: TextStyle(
                                fontSize: _screenWidth * 0.045,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff21E6C1),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }
}
