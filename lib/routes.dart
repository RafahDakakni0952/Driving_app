

import 'package:flutter/widgets.dart';
import 'package:untitled6/Authentication/EmailVerification/EmailVerificationScreen.dart';
import 'package:untitled6/Authentication/ForgetPassword/ForgetPasswordScreen.dart';
import 'package:untitled6/Authentication/Settings/SettingsScreen.dart';
import 'package:untitled6/Authentication/SignIn/SignInScreen.dart';
import 'package:untitled6/Authentication/SignUp/SignUpScreen.dart';
import 'package:untitled6/Home/DrivingLicenseTest/LicenseTestScreen.dart';
import 'package:untitled6/Home/HomeScreen.dart';
import 'package:untitled6/Home/Questions/DrivingRules.dart';
import 'package:untitled6/Home/Questions/GeneralQuestions.dart';
import 'package:untitled6/Home/Questions/InstructionForTesting.dart';
import 'package:untitled6/Home/Questions/PointsTable.dart';
import 'package:untitled6/Home/Questions/QuestionsTypes.dart';
import 'package:untitled6/Home/Questions/StepsToStop.dart';
import 'package:untitled6/Home/Questions/TrafficViolations.dart';
import 'package:untitled6/Home/SelfTest/TestResult.dart';
import 'package:untitled6/Home/SelfTest/TestScreen.dart';
import 'package:untitled6/Home/SelfTest/TestsScreen.dart';
import 'package:untitled6/Home/Signs/SignCategory.dart';
import 'package:untitled6/Home/Signs/SignsTypes.dart';


final Map <String,WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  SignsTypes.routeName: (context) => const SignsTypes(),
  SignCategory.routeName: (context) => SignCategory(title: '',),
  TestsScreen.routeName: (context) => const TestsScreen(),
  TestScreen.routeName: (context) => const TestScreen(numberOfTest: 0,),
  TestResult.routeName: (context) => const TestResult(answersTrue: 0,results: [],),
  DrivingRules.routeName: (context) => const DrivingRules(),
  GeneralQuestions.routeName: (context) => const GeneralQuestions(),
  PointsTable.routeName: (context) => const PointsTable(),
  QuestionsTypes.routeName: (context) => const QuestionsTypes(),
  TrafficViolations.routeName: (context) => const TrafficViolations(),
  LicenseTestScreen.routeName: (context) => const LicenseTestScreen(),
  EmailVerificationScreen.routeName: (context) => const EmailVerificationScreen(),
  ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
  StepsToStop.routeName: (context) => const StepsToStop(),
  InstructionForTesting.routeName: (context) => const InstructionForTesting(),
  SettingsScreen.routeName: (context) => const SettingsScreen(),
};