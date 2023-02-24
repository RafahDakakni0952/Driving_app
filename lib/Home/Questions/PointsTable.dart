
import 'package:flutter/material.dart';


class PointsTable extends StatelessWidget {
  const PointsTable({Key? key}) : super(key: key);
  static String routeName = '/PointsTable';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جدول النقاط'),
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
                  child: Directionality(
                    textDirection: TextDirection.rtl,
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
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      table[index]['rule']!,
                      overflow: TextOverflow.visible,
                      style: const TextStyle(
                        fontSize: 18,

                      ),
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
    'rule':'يمنع منعاً باتاً قيادة المركبات على الطرقات بدون:',
    'points' : '20'
  },
  {
    'rule':'رخصة القيادة الخصوصية خاصة بمن يقود مركبة خاصة لا يتجاوز وزنها :',
    'points' : '5'
  },
  {
    'rule':'يمنع منعاً باتاً قيادة المركبات على الطرقات بدون:',
    'points' : '15'
  },
  {
    'rule':'رخصة القيادة الخصوصية خاصة بمن يقود مركبة خاصة لا يتجاوز وزنها :',
    'points' : '12'
  },
  {
    'rule':'يمنع منعاً باتاً قيادة المركبات على الطرقات بدون:',
    'points' : '8'
  },
  {
    'rule':'رخصة القيادة الخصوصية خاصة بمن يقود مركبة خاصة لا يتجاوز وزنها :',
    'points' : '6'
  },
];
