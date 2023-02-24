import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Authentication/SignUp/FadeAnimation2.dart';
import 'package:untitled6/Home/HomeScreen.dart';

import '../../Widgets/Form_Error.dart';
import '../../constants.dart';
import '../../main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static String routeName = '/SignUpScreen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController emailController, passwordController;
  final List <String> errors = [];
  void addError(String error){
    if(!errors.contains(error)){
      setState(() {
        errors.add(error);
      });
    }
  }
  void removeError(String error) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else if (snapshot.hasData) {
            final user = FirebaseAuth.instance.currentUser!;
            //FirebaseAuth.instance.signOut();
            return const HomeScreen();
          } else {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 400,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/SignUpImages/background.png'),
                              fit: BoxFit.fill)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 30,
                            width: 80,
                            height: 200,
                            child: FadeAnimation2(
                              1,
                              Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/SignUpImages/light-1.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 140,
                            width: 80,
                            height: 150,
                            child: FadeAnimation2(
                              1.3,
                              Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/SignUpImages/light-2.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 40,
                            top: 40,
                            width: 80,
                            height: 150,
                            child: FadeAnimation2(
                              1.5,
                              Container(
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/SignUpImages/clock.png',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            child: FadeAnimation2(
                                1.6,
                                Container(
                                  margin: const EdgeInsets.only(top: 50),
                                  child: const Center(
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            FadeAnimation2(
                                1.8,
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(143, 148, 251, .2),
                                          blurRadius: 20.0,
                                          offset: Offset(0, 10),
                                        ),
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        child: TextFormField(
                                          controller: emailController,
                                          keyboardType: TextInputType.emailAddress,
                                          onChanged: (value){
                                            if(value.isNotEmpty && errors.contains('Please Enter an Email')){
                                              setState(() {
                                                errors.remove('Please Enter an Email');
                                              });
                                            }else if(emailValidatorRegExp.hasMatch(value) && errors.contains('Invalid Email')){
                                              setState(() {
                                                errors.remove('Invalid Email');
                                              });
                                            }
                                          },
                                          validator: (value){
                                            if(value!.isEmpty && !errors.contains('Please Enter an Email')){
                                              setState(() {
                                                errors.add('Please Enter an Email');
                                              });
                                            }else if(!emailValidatorRegExp.hasMatch(value) && !errors.contains('Invalid Email')){
                                              setState(() {
                                                errors.add('Invalid Email');
                                              });
                                            }
                                            return null ;
                                          },
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email",
                                            hintStyle: TextStyle(
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: passwordController,
                                          obscureText: true,
                                          onChanged: (value){
                                            if(value.isNotEmpty && errors.contains('Please Enter Password')){
                                              setState(() {
                                                errors.remove('Please Enter Password');
                                              });
                                            }else if(value.length >= 8 && errors.contains('Password Short')){
                                              setState(() {
                                                errors.remove('Password Short');
                                              });
                                            }
                                          },
                                          validator: (value){
                                            if(value!.isEmpty && !errors.contains('Please Enter Password')){
                                              setState(() {
                                                errors.add('Please Enter Password');
                                              });
                                            }else if(value.length < 8 && !errors.contains('Password Short')){
                                              setState(() {
                                                errors.add('Password Short');
                                              });
                                            }
                                            return null ;
                                          },
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                              color: Colors.grey[400],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FormError(errors: errors),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FadeAnimation2(
                              2,
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: const LinearGradient(colors: [
                                      Color.fromRGBO(143, 148, 251, 1),
                                      Color.fromRGBO(143, 148, 251, .6),
                                    ])),
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {
                                      if(_formKey.currentState!.validate() && errors.isEmpty) {
                                        signUp();
                                      }
                                    },
                                    child: const Text(
                                      "Sign up",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            const FadeAnimation2(
                              1.5,
                              Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        });
  }

  Future signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      User user = FirebaseAuth.instance.currentUser!;
      String name = user.email!;
      name = name.substring(0, name.indexOf('@'));
      await user.updateDisplayName(name);
      await user.reload();
    } catch (e) {
      showToast(context, 'Error, please try again');
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
