import 'package:flutter/material.dart';
import 'package:untitled6/Home/HomeScreen.dart';

class TestResult extends StatelessWidget {
  const TestResult({Key? key,required this.results,required this.answersTrue}) : super(key: key);
  final List<bool> results;
  final int answersTrue;
  static String routeName = '/TestResult';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.purple,
            ),
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
                icon: Icon(
                  Icons.arrow_back_outlined,
                  size: 24,
                  color: Theme.of(context).iconTheme.color,
                ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                ),
                Center(
                  child: Text(
                    'Result $answersTrue/${results.length}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: height - (height / 4),
              margin: EdgeInsets.only(top: height/4),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              child: ListView.separated(
                  itemBuilder: (context,index)=> Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: results[index]? Colors.green:Colors.red,
                      border: Border.all(
                        color: Colors.white54
                      )
                    ),
                    child: Center(
                      child: Text(
                        'Question ${index+1}'
                      ),
                    ),
                  ),
                  separatorBuilder: (context,index)=> const SizedBox(height: 10,),
                  itemCount: results.length
              ),
            )
          ],
        ),
      ),
    );
  }
}
