import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_new_fl/src/presentation/views/web/experiencia_web_view.dart';
import 'package:provider/provider.dart';

import 'package:portafolio_new_fl/src/data/providers/theme_provider.dart';

import '../components/component.dart';
import '../views/view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height;
    final _screenWidth = MediaQuery.of(context).size.width;

    final themeProvider = Provider.of<ThemesProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false, // Oculta la flecha de regreso
        elevation: 0.0,
        toolbarHeight: _screenHeight * 0.1,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: _screenHeight * 0.08,
              width: _screenWidth * 0.05,
              child: Image.asset(
                'assets/img/icons/logo_1.png',
                fit: BoxFit.contain,
              ),
            ),
            /*FadeIn(
              duration: Duration(milliseconds: 1500),
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 5.0, left: 10, right: 10),
                child: FaIcon(
                  FontAwesomeIcons.superpowers,
                  color: Colors.white,
                  size: _screenWidth * 0.025,
                ),
              ),
            ),
            SizedBox(
              width: _screenWidth * 0.4,
              child: Row(
                children: [
                  AnimatedTextKit(
                    totalRepeatCount: 1,
                    stopPauseOnTap: true,
                    animatedTexts: [
                      TyperAnimatedText('Yamil Saad',
                          speed: Duration(milliseconds: 200),
                          textStyle: TextStyle(
                              fontSize: _screenWidth * 0.025,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ],
              ),
            ),*/

            SizedBox(
              width: _screenWidth * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ThemeswitchWebComponent(themeProvider: themeProvider),
            ) //SWITCH THEME
          ],
        ),
      ),
      /*endDrawer: MediaQuery.of(context).size.width > 600
          ? DrawerWebWidget(
              screenWidth: _screenWidth) // Versión para escritorio
          : DrawerMobileWidget(screenWidth: _screenWidth),*/ // Versión para móvil
      body: LayoutBuilder(builder: (context, contraints) {
        if (contraints.maxWidth > 650) {
          return _WebView();
        } else {
          return _MobileView();
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: FaIcon(
          FontAwesomeIcons.whatsapp,
          size: _screenWidth * 0.03,
        ),
      ),
    );
  }
}

class _WebView extends StatelessWidget {
  const _WebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            InicioWebView(),
            SecondWebView(),
            ThirdWebView(),
            ExperienciaWebView(),
            SkillWebView(),
            FooterWebView()
            //AsesoramientoDesktopView(),
            //WebDesktopView(),
            //ScrumDesktopView(),
            //FooterDesktopView()
          ],
        ),
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  const _MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          //InicioMobileView(),
          //AsesoramientoMobileView(),
          //WebMobileView(),
          //ScrumMobileView(),
          //FooterMobileView()
        ],
      ),
    );
  }
}
