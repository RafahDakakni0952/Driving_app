
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Home/SelfTest/TestResult.dart';
import 'package:untitled6/main.dart';
import 'package:untitled6/translations/locale_keys.g.dart';

class LicenseTestScreen extends StatefulWidget {
  const LicenseTestScreen({Key? key}) : super(key: key);
  static String routeName = '/LicenseTestScreen';

  @override
  State<LicenseTestScreen> createState() => _LicenseTestScreenState();
}

class _LicenseTestScreenState extends State<LicenseTestScreen> {

  int currentStep = 0;
  int selectedAnswer = -1;
  int answersTrue = 0;
  List <bool> results = [];
  bool trueAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.DrivingLicenseTest.tr(),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _questions[currentStep]['question'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white
                    ),
                  ),
                ),
                const SizedBox(height: 25,),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  height: MediaQuery.of(context).size.width/2,
                  child: Image.asset(
                      'assets/images/png/teaching.png',
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 25,),
                ListView.builder(
                    itemCount: _questions[currentStep]['answers'].length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context,i){
                      return GestureDetector(
                        onTap: (){
                          if(selectedAnswer == -1){
                            setState(() {
                              selectedAnswer = i;
                            });
                            if(_questions[currentStep]['answers'][selectedAnswer]['result']){
                              results.add(true);
                              answersTrue++;
                              trueAnswer = true;
                            }else{
                              results.add(false);
                              trueAnswer = false;
                            }
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: selectedAnswer == i ? (trueAnswer? Colors.green:Colors.red) : (selectedAnswer == -1 ?Colors.purple : Colors.black38),
                              borderRadius: BorderRadius.circular(20),
                              border: selectedAnswer == i ? Border.all(color: Colors.black38,width: 2):null
                          ),
                          child: Text(
                            _questions[currentStep]['answers'][i]['answer'],
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      );
                    }
                ),
                const SizedBox(height: 90,),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.all(15),
              color: Colors.white,
              child: InkWell(
                onTap: (){
                    final isLastStep = currentStep == _questions.length -1;
                    if(isLastStep){
                      //ResultScreen
                      deleteTest();
                    }else{
                    setState(() {
                      currentStep++;
                      selectedAnswer = -1;
                    });
                  }
                },
                child: Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.purple,
                  ),
                  child: Center(
                    child: Text(
                        LocaleKeys.Next.tr(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Future deleteTest()async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.purple,),)
    );
    try{
      final user = FirebaseAuth.instance.currentUser!;
      await FirebaseFirestore.instance.collection('Bookings').doc('${user.email}').delete();
      
    }catch(e){
      print(e);
    }
    navigatorKey.currentState!.pushReplacement(MaterialPageRoute(builder: (context)=>TestResult(answersTrue: answersTrue,results: results,)));
  }
}

const List _questions = [
  {
    'question' : 'عند اقترابك من تقاطع الدوار لمن تكون الأفضلية',
    'answers' : [
      {
        'answer': 'بداخل الدوار',
        'result': true,
      },
      {
        'answer': 'بخارج الدوار',
        'result': false,
      },
      {
        'answer': 'الذي يسير بخط مستقيم',
        'result': false,
      },
    ]
  },
  {
    'question' : 'عند اقترابك من تقاطع الدوار لمن تكون الأفضلية',
    'answers' : [
      {
        'answer': 'x',
        'result': true,
      },
      {
        'answer': 'x',
        'result': false,
      },
      {
        'answer': 'x',
        'result': false,
      },
    ]
  },
  {
    'question' : 'عند اقترابك من تقاطع الدوار لمن تكون الأفضلية',
    'answers' : [
      {
        'answer': 'بداخل الدوار',
        'result': true,
      },
      {
        'answer': 'بخارج الدوار',
        'result': false,
      },
      {
        'answer': 'الذي يسير بخط مستقيم',
        'result': false,
      },
    ]
  },

];

/*

 */
