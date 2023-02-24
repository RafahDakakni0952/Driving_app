
import 'package:flutter/material.dart';

class GeneralQuestions extends StatelessWidget {
  const GeneralQuestions({Key? key}) : super(key: key);
  static String routeName = '/GeneralQuestions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الأسئلة العامة'),
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
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                        generalQuestions[index]['question']!,
                        overflow: TextOverflow.visible,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
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
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      generalQuestions[index]['answer']!,
                      overflow: TextOverflow.visible,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
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
    'question':'يمنع منعاً باتاً قيادة المركبات على الطرقات بدون:',
    'answer' : 'الحصول على تصريح أو رخصة قيادة.'
  },
  {
    'question':'رخصة القيادة الخصوصية خاصة بمن يقود مركبة خاصة لا يتجاوز وزنها :',
    'answer' : '3.5 طن'
  },
  {
    'question':'يمنع منعاً باتاً قيادة المركبات على الطرقات بدون:',
    'answer' : 'الحصول على تصريح أو رخصة قيادة.'
  },
  {
    'question':'رخصة القيادة الخصوصية خاصة بمن يقود مركبة خاصة لا يتجاوز وزنها :',
    'answer' : '3.5 طن'
  },
  {
    'question':'يمنع منعاً باتاً قيادة المركبات على الطرقات بدون:',
    'answer' : 'الحصول على تصريح أو رخصة قيادة.'
  },
  {
    'question':'رخصة القيادة الخصوصية خاصة بمن يقود مركبة خاصة لا يتجاوز وزنها :',
    'answer' : '3.5 طن'
  },

];
