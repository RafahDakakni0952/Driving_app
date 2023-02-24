import 'package:cloud_firestore/cloud_firestore.dart';
<<<<<<< HEAD
=======
import 'package:easy_localization/easy_localization.dart';
>>>>>>> 76185ab (Rafah)
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Authentication/SignIn/SignInScreen.dart';
import 'package:untitled6/Home/DrivingLicenseTest/LicenseTestScreen.dart';
import 'package:untitled6/firebaseCRUD.dart';
<<<<<<< HEAD
=======
import 'package:untitled6/translations/locale_keys.g.dart';
>>>>>>> 76185ab (Rafah)

class DrivingLicenseScreen extends StatefulWidget {
  const DrivingLicenseScreen({Key? key}) : super(key: key);

  @override
  State<DrivingLicenseScreen> createState() => _DrivingLicenseScreenState();
}

class _DrivingLicenseScreenState extends State<DrivingLicenseScreen> {
  late Future<Widget> isBooked;

  @override
  void initState() {
    super.initState();
    isBooked = readTestInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: const Text('Driving License'),
=======
        title: Text(LocaleKeys.DrivingLicenseTest.tr(),),
>>>>>>> 76185ab (Rafah)
        centerTitle: true,
      ),
      body: FutureBuilder<Widget>(
          future: readTestInfo(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.purple,
                  ),
                );
              case ConnectionState.done:
              default:
                if (snapshot.hasError) {
                  return Container(
                    constraints: const BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/background/background1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Error, please try again',
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return snapshot.data!;
                } else {
                  return Container(
                    constraints: const BoxConstraints.expand(),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/background/background1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'No Data',
                        ),
                      ),
                    ),
                  );
                }
            }
          }),
    );
  }

  Future<Widget> readTestInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      //signed in
      final doc = FirebaseFirestore.instance
          .collection('Bookings')
          .doc('${user.email}');
      final snapshot = await doc.get();
      if (snapshot.exists) {
        final data = snapshot.data()!;
        DateTime date = (data['date'] as Timestamp).toDate();
        final date2 = DateTime.now();
        final x = date2.isAfter(date);
        final difference = date.difference(date2).inHours;
        if (difference <= 0) {
          return const CanEnrollWidget();
        } else {
          return TimeLeftWidget(
            timeLeft: difference,
          );
        }
      } else {
        //NoAppointment
        return Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background/background1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
                height: 50,
              ),
              SizedBox(
                width: 200,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/homeImage.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
<<<<<<< HEAD
                child: const Text(
                  'You can perform reservation for the test now,'
                  '\n make sure of your information well before proceeding,'
                  '\n Prepare yourself for the examination, it will be available after 24 hours',
                  textAlign: TextAlign.center,
                  style: TextStyle(
=======
                child: Text(
                  LocaleKeys.PerformReservation.tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
>>>>>>> 76185ab (Rafah)
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {
                  FireBaseCRUD.addTest();
                  setState(() {});
                },
                child: Container(
                  width: 150,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.pink.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
<<<<<<< HEAD
                  child: const Center(
                    child: Text(
                      'Reservation',
                      style: TextStyle(
=======
                  child: Center(
                    child: Text(
                      LocaleKeys.Next.tr(),
                      style: const TextStyle(
>>>>>>> 76185ab (Rafah)
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }
    } else {
      //Not login
      return Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
              height: 50,
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/homeImage.jpg',
                    fit: BoxFit.cover,
                  ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
<<<<<<< HEAD
              child: const Text(
                'Welcome to Driving app,'
                '\n Please login first to reservation for test',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
=======
              child: Text(
                LocaleKeys.LoginFirst.tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
>>>>>>> 76185ab (Rafah)
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, SignInScreen.routeName);
              },
              child: Container(
                width: 150,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
<<<<<<< HEAD
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
=======
                child: Center(
                  child: Text(
                    LocaleKeys.SignIn.tr(),
                    style: const TextStyle(
>>>>>>> 76185ab (Rafah)
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}

class CanEnrollWidget extends StatelessWidget {
  const CanEnrollWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background/background1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          SizedBox(
            width: 200,
            height: 200,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/homeImage.jpg',
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.pink.withOpacity(0.3),
              borderRadius: BorderRadius.circular(15),
            ),
<<<<<<< HEAD
            child: const Text(
              'You can perform the test now,'
              '\n make sure of your information well before proceeding,'
              '\n upon confirmation you will not be able to undo',
              textAlign: TextAlign.center,
              style: TextStyle(
=======
            child: Text(
              LocaleKeys.PerformTest.tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(
>>>>>>> 76185ab (Rafah)
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, LicenseTestScreen.routeName);
            },
            child: Container(
              width: 150,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.5),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
<<<<<<< HEAD
              child: const Center(
                child: Text(
                  'Start',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
=======
              child: Center(
                child: Text(
                  LocaleKeys.Start.tr(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white,
                  ),
>>>>>>> 76185ab (Rafah)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TimeLeftWidget extends StatelessWidget {
  const TimeLeftWidget({super.key, required this.timeLeft});
  final int timeLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background/background1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
              height: 50,
            ),
            SizedBox(
              width: 200,
              height: 200,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/homeImage.jpg',
                    fit: BoxFit.cover,
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.pink.withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
<<<<<<< HEAD
                'You can\'t perform the test now,'
                '\n Time Left : $timeLeft Hours',
=======
                '${LocaleKeys.NotPerformTest.tr()} $timeLeft ${LocaleKeys.Hours.tr()}',
>>>>>>> 76185ab (Rafah)
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
