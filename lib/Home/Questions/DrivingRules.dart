
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/translations/locale_keys.g.dart';

class DrivingRules extends StatelessWidget {
  const DrivingRules({Key? key}) : super(key: key);
  static String routeName = '/DrivingRules';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.DrivingMainRules.tr(),),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder<List<String>?>(
        future: readQuestion(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              );
            case ConnectionState.done:
            default:
              if (snapshot.hasError) {
                return Container(
                  constraints: const BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/background/background1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.pink.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'Error, please try again',
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasData) {
                List items = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                    itemBuilder: (context,index)=>Container(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                                color: Colors.purple,
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Text(
                                '${index+1}',
                                overflow: TextOverflow.visible,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8,),
                          Expanded(
                            child: Text(
                              items[index],
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context,index)=>const SizedBox(height: 10,),
                    itemCount: rules.length,
                  ),
                );
              } else {
                return Container(
                  constraints: const BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/background/background1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.pink.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        'No Data',
                      ),
                    ),
                  ),
                );
              }
          }

        }
      ),
    );
  }
  Future<List<String>?> readQuestion()async{

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('rules',rules);
    await Future.delayed(const Duration(seconds: 2));
    final List<String>? items = prefs.getStringList('rules');
    return items;
  }
}

const List<String> rules = [
  'يجب التأكد من وضع العجلات الأمامية قبل التحرك',
  'يجب تبديل الاطارات كل 7500 كم',
  'يجب التأكد من إغلاق أبواب المركبة قبل التحرك',
  'يجب التأكد من ضبط الأنوار الأمامية',
  'يجب ضبط المرايا قبل التحرك',
  'يجب اختبار الفرامل قبل التحرك لرحلة على الطريق السريع',
  'يجب عدم ركوب الأطفال دون سن السابعة بالمقاعد الأميمة للسيارات',
  'يجب ارتداء حزام الأمان حتى على السرعات البطيئة',



];
