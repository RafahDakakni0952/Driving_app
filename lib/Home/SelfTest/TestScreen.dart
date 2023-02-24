
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Home/SelfTest/TestResult.dart';
import 'package:untitled6/translations/locale_keys.g.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key,required this.numberOfTest}) : super(key: key);
  final int numberOfTest;
  static String routeName = '/TestScreen';

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int currentStep = 0;
  int selectedAnswer = -1;
  int answersTrue = 0;
  List <bool> results = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Tests.tr()),
        backgroundColor: Colors.purple,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(primary: Colors.purple)
        ),
        child: Stepper(
          type: StepperType.horizontal,
          currentStep: currentStep,
          steps: getSteps(),
          onStepContinue: (){
            final isLastStep = currentStep == getSteps().length -1;
            if(_questions[currentStep]['answers'][selectedAnswer]['result']){
              results.add(true);
              answersTrue++;
            }else{
              results.add(false);
            }
            if(isLastStep){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TestResult(answersTrue: answersTrue,results: results,)));
            }else if(selectedAnswer!=-1){
              setState(() {
                currentStep++;
                selectedAnswer = -1;
              });
            }
          },
          onStepCancel: (){
            if(currentStep !=0){
              setState(() {
                currentStep--;
              });
            }
          },
          controlsBuilder: (BuildContext context,ControlsDetails details){
            return ElevatedButton(
                onPressed: details.onStepContinue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(LocaleKeys.Next.tr()),
                )
            );
          },
        ),
      ),
    );
  }

  List<Step> getSteps(){
    return List.generate(_questions.length, (index) => Step(
        title: const SizedBox(),
        isActive: currentStep >= index,
        state: currentStep > index ? StepState.complete : StepState.indexed,
        content: SingleChildScrollView(
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
                  _questions[index]['question'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
              const SizedBox(height: 150,),
              ListView.builder(
                  itemCount: _questions[index]['answers'].length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,i){
                    return GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedAnswer = i;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: selectedAnswer == i ? Colors.red : Colors.purple,
                          borderRadius: BorderRadius.circular(20),
                          border: selectedAnswer == i ? Border.all(color: Colors.black38,width: 2):null
                        ),
                        child: Text(
                          _questions[index]['answers'][i]['answer'],
                          textAlign: TextAlign.end,
                          style: const TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ),
                    );
                  }
              ),
              const SizedBox(height: 150,),
            ],
          ),
        ),
    ),);
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
 */