
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/translations/locale_keys.g.dart';

class GeneralQuestions extends StatelessWidget {
  const GeneralQuestions({Key? key}) : super(key: key);
  static String routeName = '/GeneralQuestions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.GeneralSignals.tr(),),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
            itemBuilder: (context,index)=>Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                      generalQuestions[index]['question']!,
                      overflow: TextOverflow.visible,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    generalQuestions[index]['answer']!,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            separatorBuilder: (context,index)=>const SizedBox(height: 10,),
            itemCount: generalQuestions.length,
        ),
      ),
    );
  }
}


const generalQuestions = [
  {
    'question':'???????? ?????????? ?????????? ?????????? ???????????????? ?????? ?????????????? ????????:',
    'answer' : '???????????? ?????? ?????????? ???? ???????? ??????????.'
  },
  {
    'question':'???????? ?????????????? ???????????????? ???????? ?????? ???????? ?????????? ???????? ???? ???????????? ?????????? :',
    'answer' : '3.5 ????'
  },
  {
    'question':'???? ?????? ???????????? ?????????????? ?????????????? ???? ???????? ??????????????',
    'answer' : '???????????? ?????? ???? ???????????? ???????????? ??????????????'
  },
  {
    'question':'?????????? ?????? ???????? ?????????? ????????:',
    'answer' : '?????????? ???????????????? ???????????? ???????????? ?? ?????????? ????????????'
  },
  {
    'question':'???????????? ???????????? ???????????????? ?????????????? ???????? ??????????',
    'answer' : '80 ???? ???? ????????????'
  },
  {
    'question':'???????????? ???????????? ???????????????? ?????????????? ???????? ??????????',
    'answer' : '120 ???? ???? ????????????'
  },
  {
    'question':'???????? ?????????????? ?????????????? ??',
    'answer' : '?????????????? ???????? ???? ???????? ???????????? ?????? ???????????? ??????????'
  },

];
