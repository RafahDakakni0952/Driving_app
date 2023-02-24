

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Authentication/EmailVerification/EmailVerificationScreen.dart';
import 'package:untitled6/Authentication/ForgetPassword/ForgetPasswordScreen.dart';
import 'package:untitled6/Authentication/SignIn/FadeAnimation.dart';
import 'package:untitled6/Authentication/SignUp/SignUpScreen.dart';
import 'package:untitled6/Home/HomeScreen.dart';
import 'package:untitled6/Widgets/Form_Error.dart';
import 'package:untitled6/constants.dart';

import '../../main.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static String routeName = '/SignInScreen';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with SingleTickerProviderStateMixin {

  late final TextEditingController emailController,passwordController;
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
    _myStream =  FirebaseAuth.instance.authStateChanges();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  late Stream<User?> _myStream;


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder<User?>(
      stream: _myStream,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(color: Colors.purple,),);
        }else if(snapshot.hasError){
          return const Center(child: Text('Something went wrong'),);
        }else if(snapshot.hasData){
          final user = FirebaseAuth.instance.currentUser!;
          //FirebaseAuth.instance.signOut();
          return const EmailVerificationScreen();
          //return const HomeScreen();
        }else{
        return Scaffold(
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 400,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: -40,
                        height: 400,
                        width: width,
                        child: FadeAnimation(
                          1,
                          Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/SignInImages/background.png'),
                                  fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        height: 400,
                        width: width + 20,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/SignInImages/background-2.png'),
                                      fit: BoxFit.fill)),
                            )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const FadeAnimation(
                            1.5,
                            Text(
                              "Login",
                              style: TextStyle(
                                  color: Color.fromRGBO(49, 39, 79, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                            1.7,
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).iconTheme.color,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(196, 135, 198, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10),
                                    )
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(color: Theme.of(context).scaffoldBackgroundColor))),
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
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: TextFormField(
                                      keyboardType: TextInputType.name,
                                      obscureText: true,
                                      controller: passwordController,
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
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FormError(errors: errors),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          1.7,
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Color.fromRGBO(196, 135, 198, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                            1.9,
                            GestureDetector(
                              onTap: () {
                                if(_formKey.currentState!.validate() && errors.isEmpty) {
                                  signIn();
                                }
                              },
                              child: Container(
                                height: 50,
                                margin: const EdgeInsets.symmetric(horizontal: 60),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color.fromRGBO(49, 39, 79, 1),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                          2,
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, SignUpScreen.routeName);
                              },
                              child: const Text(
                                "Create Account",
                                style: TextStyle(

                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                          2,
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, HomeScreen.routeName);
                              },
                              child: const Text(
                                "Continue as guest",
                                style: TextStyle(

                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
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
      }
    );
  }

  Future signIn()async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.purple,),)
    );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      User user = FirebaseAuth.instance.currentUser!;
      String name = user.email!;
      name = name.substring(0, name.indexOf('@'));
      await user.updateDisplayName(name);
      await user.reload();
    }catch(e){
      print(e);
      showToast(context, 'Error, please try again');
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

}
