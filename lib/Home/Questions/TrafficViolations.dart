
import 'package:flutter/material.dart';

class TrafficViolations extends StatelessWidget {
  const TrafficViolations({Key? key}) : super(key: key);
  static String routeName = '/TrafficViolations';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المخالفات المرورية'),
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
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${i+1}. ',style: const TextStyle(fontSize: 18),),
                          Text('${violations[index]['rules'][i]['${i+1}']}',style: const TextStyle(fontSize: 18),)
                        ],
                      ),
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
    'violation':'غرامة مالية لا تقل عن (500) ولا تزيد عن (900)',
    'rules' : [
      {'1':'قيادة المركبة قبل الحصول على رخصة القيادة'},
      {'2':'سير المركبة بدون لوحة خلفية'},
      {'3':'قيادة المركبة بالاتجاه المعاكس'},
      {'4':'المراوغة بسرعة بين المركبات'},
      {'5':'تجاوز السرعة المحددة'},
    ]
  },
  {
    'violation':'غرامة مالية لا تقل عن (500) ولا تزيد عن (900)',
    'rules' : [
      {'1':'قيادة المركبة قبل الحصول على رخصة القيادة'},
      {'2':'سير المركبة بدون لوحة خلفية'},
      {'3':'قيادة المركبة بالاتجاه المعاكس'},
      {'4':'المراوغة بسرعة بين المركبات'},
      {'5':'تجاوز السرعة المحددة'},
    ]
  },
  {
    'violation':'غرامة مالية لا تقل عن (500) ولا تزيد عن (900)',
    'rules' : [
      {'1':'قيادة المركبة قبل الحصول على رخصة القيادة'},
      {'2':'سير المركبة بدون لوحة خلفية'},
      {'3':'قيادة المركبة بالاتجاه المعاكس'},
      {'4':'المراوغة بسرعة بين المركبات'},
      {'5':'تجاوز السرعة المحددة'},
    ]
  },
  {
    'violation':'غرامة مالية لا تقل عن (500) ولا تزيد عن (900)',
    'rules' : [
      {'1':'قيادة المركبة قبل الحصول على رخصة القيادة'},
      {'2':'سير المركبة بدون لوحة خلفية'},
      {'3':'قيادة المركبة بالاتجاه المعاكس'},
      {'4':'المراوغة بسرعة بين المركبات'},
      {'5':'تجاوز السرعة المحددة'},
    ]
  },
  {
    'violation':'غرامة مالية لا تقل عن (500) ولا تزيد عن (900)',
    'rules' : [
      {'1':'قيادة المركبة قبل الحصول على رخصة القيادة'},
      {'2':'سير المركبة بدون لوحة خلفية'},
      {'3':'قيادة المركبة بالاتجاه المعاكس'},
      {'4':'المراوغة بسرعة بين المركبات'},
      {'5':'تجاوز السرعة المحددة'},
    ]
  },


];
