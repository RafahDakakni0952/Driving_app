
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Home/HomeScreen.dart';
import 'package:untitled6/constants.dart';
import 'package:untitled6/main.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});
  static String routeName = '/EmailVerificationScreen';

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      start();
    });
  }

  void start(){
    if(mounted){
      setState(() {
        isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      });
    }

    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(const Duration(seconds: 3), (timer) {
        checkEmailVerified();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  bool isEmailVerified = false;
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return isEmailVerified ? const HomeScreen()
      : Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
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
                height: 20,
              ),
              const Text(
                'Email Verification',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'An Email was sent to you,\nplease verify your account to continue',
                style: TextStyle(
                        color: Colors.grey.shade200,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                  onTap: () {
                      FirebaseAuth.instance.signOut();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.pink,
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future sendVerificationEmail() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.purple,),)
    );
    try{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      print('sent');
    }catch (e){
      showToast(context, 'Error, please try again');
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  Future checkEmailVerified() async{
    await FirebaseAuth.instance.currentUser!.reload();
    if(mounted){
      setState(() {
        isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
      });
    }
    if(isEmailVerified){
      timer?.cancel();
    }
  }
}
