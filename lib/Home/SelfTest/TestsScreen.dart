


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Home/SelfTest/TestScreen.dart';
import 'package:untitled6/translations/locale_keys.g.dart';


class TestsScreen extends StatelessWidget {
  const TestsScreen({Key? key}) : super(key: key);
  static String routeName = '/TestsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.TestSelf.tr()),
        backgroundColor: Colors.purple,
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index) => InkWell(
            onTap: (){
              Navigator.pushNamed(context, TestScreen.routeName,arguments: {'numberOfTest':index,});
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: ListTile(
                  leading: Image.asset('assets/images/png/winning.png'),
                  title: Text(
                    '${LocaleKeys.TestNumber.tr()} : ${index+1}',
                    textAlign: TextAlign.start,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              )
            ),
          )
      ),
    );
  }
}

