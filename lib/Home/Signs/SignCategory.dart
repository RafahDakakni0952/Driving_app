

import 'package:flutter/material.dart';


class SignCategory extends StatefulWidget {
  @override
  _SignCategoryState createState() => _SignCategoryState();

  SignCategory({super.key, required this.title});
  late String title;
  static String routeName = '/SignCategory';
}

class _SignCategoryState extends State<SignCategory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.purple,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            height: 350,

            child: PageView.builder(
                itemCount: 4,
                controller: PageController(viewportFraction: 0.5),
                itemBuilder: (context,index){
                  return Container(
                    margin: const EdgeInsets.all(15),
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.pink.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/SignsTypes/${index+1}_signs.png',),
                        const Text('Max Speed',style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  );
                }
            ),
          ),
        )
    );
  }
}
