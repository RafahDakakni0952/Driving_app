
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/translations/locale_keys.g.dart';


class PointsTable extends StatelessWidget {
  const PointsTable({Key? key}) : super(key: key);
  static String routeName = '/PointsTable';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.PointsTable.tr(),),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          itemBuilder: (context,index)=>Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    table[index]['points']!,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    table[index]['rule']!,
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
          itemCount: table.length,
        ),
      ),
    );
  }
}

const table = [
  {
    'rule':'التفحيط',
    'points' : '24'
  },
  {
    'rule':'تجاوز اشارة المرور الضوئية اثناء الضوء الأحمر',
    'points' : '12'
  },
  {
    'rule':'قيادة المركبة بالاتجاه المعاكس',
    'points' : '12'
  },
  {
    'rule':'المراوغة بسرعة بين المركبات',
    'points' : '8'
  },
  {
    'rule':'قيادة المركبة بدون مكابح أو أنوار',
    'points' : '8'
  },
  {
    'rule':'عدم مراعاة قواعد الأفضلية',
    'points' : '6'
  },
  {
    'rule':'القيادة في مسارات غير مخصصة لك',
    'points' : '4'
  },
  {
    'rule':'عدم ربط حزام الأمان',
    'points' : '2'
  },
];
