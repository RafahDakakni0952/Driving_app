
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
    'question':'يمنع منعاً باتاً قيادة المركبات على الطرقات بدون:',
    'answer' : 'الحصول على تصريح أو رخصة قيادة.'
  },
  {
    'question':'رخصة القيادة الخصوصية خاصة بمن يقود مركبة خاصة لا يتجاوز وزنها :',
    'answer' : '3.5 طن'
  },
  {
    'question':'هل يجب التقيد بالسرعة المحددة في كافة الظروف؟',
    'answer' : 'التقيد بها مع مراعاة الظروف المحيطة'
  },
  {
    'question':'حصولك على رخضة قيادة يعني:',
    'answer' : 'قبولك بمسؤولية التقيد بأنظمة و قواعد المرور'
  },
  {
    'question':'السرعة القصوى للمركبات الصغيرة داخل المدن',
    'answer' : '80 كم في الساعة'
  },
  {
    'question':'السرعة القصوى للمركبات الصغيرة خارج المدن',
    'answer' : '120 كم في الساعة'
  },
  {
    'question':'تعرف المنطقة العمياء ب',
    'answer' : 'المنطقة التي لا يمكن رؤيتها إلا بتحريك الرأس'
  },

];
