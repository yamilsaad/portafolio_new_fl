import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portafolio_new_fl/src/config/routes/app_route.dart';

import 'package:portafolio_new_fl/src/core/shared/theme_preference_shared.dart';
import 'package:portafolio_new_fl/src/data/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  await ThemeSharedPreference.init(); // Inicializar SharedPreferences
  //Inicialización de controladores:
  //Get.put(WhatsAppController()); //Controller para mostrar video del storage

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemesProvider(),
        child:
            Consumer<ThemesProvider>(builder: (context, themesProvider, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Yamil Saad',
            initialRoute: '/',
            getPages: AppRoute.routes,
            theme: themesProvider.currentTheme,
          );
        }));
  }
}
