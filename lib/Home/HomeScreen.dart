import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Authentication/Settings/SettingsScreen.dart';
import 'package:untitled6/Home/DrivingLicenseTest/DrivingLicenseScreen.dart';
import 'package:untitled6/Home/Questions/QuestionsTypes.dart';
import 'package:untitled6/Home/SelfTest/TestsScreen.dart';
import 'package:untitled6/Home/Signs/SignsTypes.dart';
import 'package:untitled6/translations/locale_keys.g.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = '/HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        automaticallyImplyLeading: false,
        title: const Text('Driving app'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SettingsScreen.routeName);
            },
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.asset(
                'assets/images/homeImage.jpg',
                fit: BoxFit.cover,
              ),
            ),
            ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                Container(
                  color: Colors.deepPurple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, SignsTypes.routeName);
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width - 80,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    LocaleKeys.Signs.tr(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    LocaleKeys.AllSigns.tr(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.purple,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: -25,
                              bottom: 50,
                              child: Container(
                                height: 50,
                                width: 50,
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.centerRight,
                                decoration: const BoxDecoration(
                                    color: Colors.purpleAccent,
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Image.asset(
                                        'assets/images/png/traffic-light.png')),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, QuestionsTypes.routeName);
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width - 80,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    LocaleKeys.Education.tr(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    LocaleKeys.Informations.tr(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        color: Colors.purple,
                                        overflow: TextOverflow.visible),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: -25,
                              bottom: 50,
                              child: Container(
                                height: 50,
                                width: 50,
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.centerRight,
                                decoration: const BoxDecoration(
                                    color: Colors.purpleAccent,
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Image.asset(
                                        'assets/images/png/teaching.png')),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, TestsScreen.routeName);
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width - 80,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    LocaleKeys.TestSelf.tr(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    LocaleKeys.TestsRulesSigns.tr(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.purple,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: -25,
                              bottom: 50,
                              child: Container(
                                height: 50,
                                width: 50,
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.centerRight,
                                decoration: const BoxDecoration(
                                    color: Colors.purpleAccent,
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Image.asset(
                                        'assets/images/png/pass-fail.png')),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          //FirebaseAuth.instance.signOut();
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>const LicenseTestScreen()));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DrivingLicenseScreen()));
                        },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width - 80,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    LocaleKeys.DrivingLicenseTest.tr(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    LocaleKeys.DrivingTestTheoretical.tr(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.purple,
                                      overflow: TextOverflow.visible,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: -25,
                              bottom: 50,
                              child: Container(
                                height: 50,
                                width: 50,
                                padding: const EdgeInsets.all(8),
                                alignment: Alignment.centerRight,
                                decoration: const BoxDecoration(
                                    color: Colors.purpleAccent,
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Image.asset(
                                        'assets/images/png/medal.png')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
