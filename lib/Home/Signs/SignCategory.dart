

import 'package:flutter/material.dart';


class SignCategory extends StatefulWidget {
  @override
  _SignCategoryState createState() => _SignCategoryState();

  SignCategory({super.key, required this.title,required this.category});
  late String title;
  late int category;
  static String routeName = '/SignCategory';
}

class _SignCategoryState extends State<SignCategory> {

  @override
  Widget build(BuildContext context) {
    if(widget.category == 1){
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
                  itemCount: signs1.length,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(signs1[index]['path'],),
                          ),
                          Text(signs1[index]['name'],style: const TextStyle(fontSize: 20),),
                        ],
                      ),
                    );
                  }
              ),
            ),
          )
      );
    }else if (widget.category == 2){
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
                  itemCount: signs2.length,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(signs2[index]['path'],),
                          ),
                          Text(signs2[index]['name'],style: const TextStyle(fontSize: 20),),
                        ],
                      ),
                    );
                  }
              ),
            ),
          )
      );
    }else if(widget.category == 3){
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
                  itemCount: signs3.length,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(signs3[index]['path'],),
                          ),
                          Text(signs3[index]['name'],style: const TextStyle(fontSize: 20),),
                        ],
                      ),
                    );
                  }
              ),
            ),
          )
      );
    }else{
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
                  itemCount: signs4.length,
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(signs4[index]['path'],),
                          ),
                          Text(signs4[index]['name'],style: const TextStyle(fontSize: 20),),
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

  List signs1 = [
    {
      'name':'??????????',
      'path':'assets/images/Signs/1/1.png',
      'category':'1',
    },
    {
      'name':'???????? ??????????????',
      'path':'assets/images/Signs/1/2.png',
      'category':'1',
    },
    {
      'name':'?????????? ????????????',
      'path':'assets/images/Signs/1/3.png',
      'category':'1',
    },
    {
      'name':'????',
      'path':'assets/images/Signs/1/4.png',
      'category':'1',
    },

  ];

  List signs2 = [
    {
      'name':'???????????? ????????????',
      'path':'assets/images/Signs/2/1.png',
      'category':'2',
    },
    {
      'name':'?????? ????????',
      'path':'assets/images/Signs/2/2.png',
      'category':'2',
    },
    {
      'name':'???????? ??????????',
      'path':'assets/images/Signs/2/3.png',
      'category':'2',
    },
    {
      'name':'???????? ????????',
      'path':'assets/images/Signs/2/4.png',
      'category':'2',
    },
    {
      'name':'???????????? ??????????',
      'path':'assets/images/Signs/2/5.png',
      'category':'2',
    },
    {
      'name':'???????? ????????',
      'path':'assets/images/Signs/2/6.png',
      'category':'2',
    },
  ];

  List signs3 = [
    {
      'name':'???????? ????????',
      'path':'assets/images/Signs/3/1.png',
      'category':'3',
    },
    {
      'name':'???????????? ????????',
      'path':'assets/images/Signs/3/2.png',
      'category':'3',
    },
    {
      'name':'???????? ????????',
      'path':'assets/images/Signs/3/3.png',
      'category':'3',
    },
    {
      'name':'???????? ????????????',
      'path':'assets/images/Signs/3/4.png',
      'category':'3',
    },
    {
      'name':'???????????? ??????????',
      'path':'assets/images/Signs/3/5.png',
      'category':'3',
    },
    {
      'name':'???????? ????????????',
      'path':'assets/images/Signs/3/6.png',
      'category':'3',
    },
  ];

  List signs4 = [
    {
      'name':'???????? ???????????? 30',
      'path':'assets/images/Signs/4/1.png',
      'category':'4',
    },
    {
      'name':'???????? ????????',
      'path':'assets/images/Signs/4/2.png',
      'category':'4',
    },
    {
      'name':'?????????? ???????? ????????????????',
      'path':'assets/images/Signs/4/3.png',
      'category':'4',
    },
    {
      'name':'?????????? ?????????????? ????????????',
      'path':'assets/images/Signs/4/4.png',
      'category':'4',
    },
  ];
}

