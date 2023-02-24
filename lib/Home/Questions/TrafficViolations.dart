
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/translations/locale_keys.g.dart';

class TrafficViolations extends StatelessWidget {
  const TrafficViolations({Key? key}) : super(key: key);
  static String routeName = '/TrafficViolations';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.TrafficViolations.tr(),),
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
                decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Text(
                      'جدول المخالفات رقم (${index+1})',
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      violations[index]['violation']!,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: violations[index]['rules'].length!,
                  itemBuilder: (context,i)=>Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: i%2 == 0 ?Colors.black12:Theme.of(context).iconTheme.color
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('${i+1}. ',style: const TextStyle(fontSize: 18),),
                        Container(
                          child: Text(
                            '${violations[index]['rules'][i]['${i+1}']}',
                            overflow:TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(fontSize: 18),),
                        )
                      ],
                    ),
                  )
              ),

            ],
          ),
          separatorBuilder: (context,index)=>const SizedBox(height: 10,),
          itemCount: violations.length,
        ),
      ),
    );
  }
}

const List<Map> violations = [
  {
    'violation':'غرامة مالية لا تقل عن (5000) ولا تزيد عن (9000)',
    'rules' : [
      {'1':'قيادة المركبة قبل الحصول على رخصة القيادة'},
      {'2':'سير المركبة بدون لوحة خلفية'},
      {'3':'قيادة المركبة بالاتجاه المعاكس'},
      {'4':'المراوغة بسرعة بين المركبات'},
      {'5':'تجاوز السرعة المحددة'},
    ]
  },
  {
    'violation':'غرامة مالية لا تقل عن (3000) ولا تزيد عن (5000)',
    'rules' : [
      {'1':'اجراء أي تعديل أو إضافة على هيكل المركبة'},
      {'2':'تسسير مركبة تحدث تلوث بالبيئة'},
      {'3':'عدم التقيد بتنظيمات السير عند التقاطعات'},
      {'4':'استعمال المركبة لغير الذي خصصت من اجله'},
      {'5':'القيادة برخصة قيادة منتهية الصلاحية'},
    ]
  },
  {
    'violation':'غرامة مالية لا تقل عن (1500) ولا تزيد عن (3000)',
    'rules' : [
      {'1':'عدم تقديم المركبة للفحص الفني الدوري'},
      {'2':'عدم حمل رخصة القيادة'},
      {'3':'عدم استخدام مقاعد الامان المخصصة للأطفال'},
      {'4':'استخدام الهاتف المحمول اثناء القيادة'},
      {'5':'إساءة استعمال زمور المركبة'},
    ]
  },
];
