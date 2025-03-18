import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillWebView extends StatefulWidget {
  const SkillWebView({super.key});

  @override
  State<SkillWebView> createState() => _SkillWebViewState();
}

class _SkillWebViewState extends State<SkillWebView> {
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
      height: _screenHeight,
      width: _screenWidth,
      child: VisibilityDetector(
        key: Key('experiencia_view'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.2) {
            setState(() {
              _isVisible = true;
            });
          }
        },
        child: _isVisible
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          FadeIn(
                            duration: Duration(milliseconds: 1200),
                            child: Text(
                              'Mi Stack',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: _screenWidth * 0.03,
                                  fontFamily: "Ruik",
                                  fontWeight: FontWeight.bold),
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
                          SizedBox(
                            height: _screenHeight * 0.6,
                            width: _screenWidth * 0.28,
                            child: ListView.builder(
                              itemCount: _skills.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: Color(0xff21E6C1),
                                          width: 2.0)),
                                  child: ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        _skills[index],
                                        style: TextStyle(
                                          fontSize: _screenWidth * 0.013,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: _screenWidth * 0.3,
                            child: Divider(
                              height: _screenHeight * 0.05,
                              color: Color(0xff21E6C1),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: _screenWidth * 0.05,
                      ),
                      SizedBox(
                        height: _screenHeight,
                        width: _screenWidth * 0.5,
                        child: FadeIn(
                          duration: Duration(milliseconds: 1200),
                          child: Image.asset(
                            'assets/img/photos/logo_grande.webp',
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            : Container(),
      ),
    );
  }
}
