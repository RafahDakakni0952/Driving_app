
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/Authentication/SignIn/SignInScreen.dart';
import 'package:untitled6/routes.dart';
import 'package:untitled6/theme.dart';

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
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

  runApp(const MyApp());
}


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