
import 'package:flutter/material.dart';
import 'package:untitled6/Home/Questions/DrivingRules.dart';
import 'package:untitled6/Home/Questions/GeneralQuestions.dart';
import 'package:untitled6/Home/Questions/PointsTable.dart';
import 'package:untitled6/Home/Questions/TrafficViolations.dart';

class QuestionsTypes extends StatelessWidget {
  const QuestionsTypes({Key? key}) : super(key: key);
  static String routeName = '/QuestionsTypes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context,index) => InkWell(
            onTap: (){
              switch(index){
                case 0:
                  Navigator.pushNamed(context, GeneralQuestions.routeName);
                break;
                case 1:
                  Navigator.pushNamed(context, PointsTable.routeName);
                break;
                case 2:
                  Navigator.pushNamed(context, TrafficViolations.routeName);
                break;
                case 3:
                  Navigator.pushNamed(context, DrivingRules.routeName);
                break;
              }
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Center(child: Text(questions[index],),),
            ),
          )
      ),
    );
  }
}

const questions = [
  'الأسئلة العامة',
  'جدول النقاط',
  'المخالفات المرورية',
  'القواعد الأساسة للقيادة',
  'أهم الإرشادات عند الاختبار العملي',
  'خطوات توقف المركبة',
];
