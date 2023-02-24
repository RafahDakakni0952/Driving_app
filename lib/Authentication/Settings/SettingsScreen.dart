import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled6/Authentication/SignIn/SignInScreen.dart';
import 'package:untitled6/Home/Questions/QuestionsTypes.dart';
import 'package:untitled6/Home/SelfTest/TestsScreen.dart';
import 'package:untitled6/Home/Signs/SignsTypes.dart';
import 'package:untitled6/theme.dart';
import 'package:untitled6/translations/locale_keys.g.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static String routeName = '/SettingsScreen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 16,
            color: Colors.black,
          ),
        ),
        title: Text(
          LocaleKeys.Settings.tr(),
          style: const TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                Container(
                    height: 150,
                    width: 150,
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF804FB3),
                          Color(0xFFD9C4EC),
                          Color(0xFFB589D6),
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(
                        'assets/images/background/background1.jpg',
                      ),
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  user.displayName!,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, SignsTypes.routeName);
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 90,
                            padding: const EdgeInsets.only(bottom: 20.0),
                            decoration: BoxDecoration(
                                color: const Color(0xFFBFBFFF),
                                borderRadius: BorderRadius.circular(50),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                LocaleKeys.Signs.tr(),
                                style: const TextStyle(
                                    color: Colors.black38
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF1F1FFF),
                                  Color(0xFF7879FF),
                                  Color(0xFFBFBFFF),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                  'assets/images/png/settings_traffic.png',
                                width: 48,
                                height: 48,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, QuestionsTypes.routeName);
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 90,
                            padding: const EdgeInsets.only(bottom: 20.0),
                            decoration: BoxDecoration(
                                color: const Color(0xFFE6D1F2),
                                borderRadius: BorderRadius.circular(50),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                LocaleKeys.Education.tr(),
                                style: const TextStyle(
                                  color: Colors.black38
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xFF804FB3),
                                  Color(0xFFB589D6),
                                  Color(0xFFD9C4EC),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                  'assets/images/png/settings_teaching.png',
                                width: 48,
                                height: 48,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, TestsScreen.routeName);
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 150,
                            width: 90,
                            padding: const EdgeInsets.only(bottom: 20.0),
                            decoration: BoxDecoration(
                                color: const Color(0xFFFFCEE6),
                                borderRadius: BorderRadius.circular(50),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                LocaleKeys.Tests.tr(),
                                style: const TextStyle(
                                    color: Colors.black38
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 90,
                            width: 90,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.pink,
                                  Color(0xFFE65AB3),
                                  Color(0xFFEF87BE),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                  'assets/images/png/presentation.png',
                                width: 48,
                                height: 48,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.deepPurple.withOpacity(0.5),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.nights_stay_outlined,
                      color: Colors.deepPurple,
                    ),
                  ),
                  title: Text(
                    LocaleKeys.DarkMode.tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: const ChangeThemeButton(),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context)=> SimpleDialog(
                        backgroundColor: const Color(0xFFFFF8E1),
                        title: Text(
                          LocaleKeys.Language.tr(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'r',
                              color: Color(0xFF795548)
                          ),
                        ),
                        children: [
                          ListTile(
                            title: const Text(
                              'Arabic',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF795548)
                                //fontFamily: 'r'
                              ),
                            ),
                            leading: Image.asset('assets/images/png/arabic2.png'),
                            onTap: (){
                              Navigator.pop(context,'Arabic');
                            },
                          ),
                          ListTile(
                            title: const Text(
                              'English',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xFF795548)
                                //fontFamily: 'r'
                              ),
                            ),
                            leading: Image.asset('assets/images/png/english.png'),
                            onTap: (){
                              Navigator.pop(context,'English');
                            },
                          ),
                        ],
                      ),
                    ).then((value){
                      if(value != null){
                        switch(value){
                          case 'Arabic':
                            context.setLocale(const Locale('ar'));
                            break;
                          case 'English':
                            context.setLocale(const Locale('en'));
                            break;
                        }
                      }
                    });
                  },
                  leading: Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.5),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.language,
                      color: Colors.orange,
                    ),
                  ),
                  title: Text(
                    LocaleKeys.Language.tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AboutListTile(
                  icon: Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.5),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.help_center_outlined,
                      color: Colors.red,
                    ),
                  ),
                  applicationIcon: Image.asset(
                    'assets/images/png/presentation.png',
                    width: 48,
                    height: 48,
                  ),
                  applicationLegalese: 'Rafah Dakakni',
                  applicationName: 'Driving app',
                  applicationVersion: 'version 1.0.0',
                  aboutBoxChildren: const [
                    Text(
                        'This app was created by Rafah Dakakni'
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  },
                  child: Container(
                    height: 45,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.pink,
                    ),
                    child: Center(
                      child: Text(
                        LocaleKeys.SignOut.tr(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        activeColor: Colors.purpleAccent,
        onChanged: (value) {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(value);
        });
  }
}
