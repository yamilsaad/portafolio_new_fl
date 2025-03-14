import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portafolio_new_fl/src/presentation/layouts/web/lighting_painter.dart';
import 'package:provider/provider.dart';

import 'package:portafolio_new_fl/src/data/providers/theme_provider.dart';

import '../components/component.dart';
import '../views/view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ThemeswitchWebComponent(themeProvider: themeProvider),
            )
          ],
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 650) {
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

class _WebView extends StatefulWidget {
  const _WebView({super.key});

  @override
  State<_WebView> createState() => _WebViewState();
}

class _WebViewState extends State<_WebView>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<Offset> _mousePositionNotifier =
      ValueNotifier(Offset.zero);

  @override
  void dispose() {
    _mousePositionNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemesProvider>(context).currentTheme;

    return MouseRegion(
      onHover: (event) {
        _mousePositionNotifier.value = event.localPosition;
      },
      child: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                InicioWebView(),
                SecondWebView(),
                ThirdWebView(),
                ExperienciaWebView(),
                SkillWebView(),
                FooterWebView(),
              ],
            ),
          ),
          IgnorePointer(
            child: RepaintBoundary(
              child: ValueListenableBuilder<Offset>(
                valueListenable: _mousePositionNotifier,
                builder: (context, mousePosition, child) {
                  return CustomPaint(
                    painter: LightingPainter(mousePosition, theme),
                    child: Container(),
                  );
                },
              ),
            ),
          ),
        ],
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
