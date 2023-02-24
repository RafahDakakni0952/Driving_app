
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled6/Widgets/Form_Error.dart';
import 'package:untitled6/constants.dart';
import 'package:untitled6/main.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  static String routeName = '/ForgetPasswordScreen';

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late final TextEditingController emailController;
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
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 250,
              ),
              const Text(
                'Forget Password',
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Please enter your email address',
                style: TextStyle(
                  color: Colors.grey.shade200,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).iconTheme.color,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(196, 135, 198, .3),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    )
                  ],
                ),
                child: Form(
                  key: _formKey,
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
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormError(errors: errors),
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                  onTap: () {
                    if(_formKey.currentState!.validate() && errors.isEmpty){
                      resetPassword(emailController.text.trim());
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.pink,
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future resetPassword(String email) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.purple,),)
    );
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e);
      showToast(context, 'Error, please try again');
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}

