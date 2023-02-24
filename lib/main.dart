
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/Authentication/SignIn/SignInScreen.dart';
import 'package:untitled6/routes.dart';
import 'package:untitled6/theme.dart';

import 'translations/codegen_loader.g.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    name: 'driving-app',
    options: const FirebaseOptions(
        apiKey: "AIzaSyD31R88uS0CeBU8lQly7VVDhI-lahN5xTY",
        authDomain: "driving-app-cd65b.web.app",
        projectId: "driving-app-cd65b",
        storageBucket: "driving-app-cd65b.appspot.com",
        messagingSenderId: "851962569793",
        appId: "1:851962569793:web:c8037f76c4c39f1c2892c0"
    ),
  );

  //await Hive.initFlutter();
  //var idNum = await Hive.openBox('id');
  //var box = await Hive.openBox('Users');

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        saveLocale: true,
        assetLoader: const CodegenLoader(),
      child: const MyApp()
  ),
  );
}

/*
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations"

 flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart" -f keys

 */


final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            navigatorKey: navigatorKey,
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            scrollBehavior: AppScrollBehavior(),
            routes: routes,
            initialRoute: SignInScreen.routeName,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        }
      ),
    );

  }


}


class AppScrollBehavior extends MaterialScrollBehavior{
  @override
  Set<PointerDeviceKind> get dragDevices =>{
    PointerDeviceKind.mouse,
    PointerDeviceKind.touch,
  };
}