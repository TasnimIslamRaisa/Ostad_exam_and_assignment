import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager_project/data/models/network_response.dart';
import 'package:task_manager_project/data/restAPI/network_caller.dart';
import 'package:task_manager_project/ui/screens/auth/SignInScreen.dart';
import 'package:task_manager_project/ui/widgets/bg_widget.dart';
import 'package:task_manager_project/utility/appConstant.dart';
import '../../../style/appColors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  bool showPassWord=false;
  bool registrationInProgress=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BgWidget(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SafeArea(
              child: Form(
                key: _formkey,
                autovalidateMode: AutovalidateMode.onUserInteraction,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 250,
                    ),
                    Text(
                      "Join With Us",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "emailaddress@gmail.com",
                      ),

                      validator: (String? value){
                        if(value?.trim().isEmpty?? true){
                          return "Enter Your Email ";
                        }
                        if(AppConstant.emailRegExp.hasMatch(value!)==false){
                          return "Enter a valid email address";
                        }
                        return "";
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: firstNameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "First Name",
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty?? true){
                          return "Enter Your First Name ";
                        } return "";
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: lastNameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hintText: "Last Name",
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty?? true){
                          return "Enter Your Last name ";
                        } return "";
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Mobile",
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty?? true){
                          return "Enter Your Phone Number ";
                        }
                        if(AppConstant.phoneRegExp.hasMatch(value!)==false){
                          return "Enter a valid mobile number";
                        }
                        return "";
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: passWordController,
                      obscureText: showPassWord==false,
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: IconButton(
                          onPressed:(){
                            showPassWord=!showPassWord;
                            if(mounted){
                              setState(() {});
                            }
                          } ,
                             icon: Icon(showPassWord? Icons.visibility : Icons.visibility_off),) ,
                      ),
                      validator: (String? value){
                        if(value?.trim().isEmpty?? true){
                          return "Enter Your Password ";
                        } return "";
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if(_formkey.currentState!.validate()){
                          //TODO : Call reg api
                        }
                      },
                      child: const Icon(Icons.arrow_right),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Center(
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColor,
                                  letterSpacing: 0.4),
                              text: "Have an account?",
                              children: [
                                TextSpan(
                                  text: "  Sign-In",
                                  style: const TextStyle(
                                    color: AppColors.themeColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      onTabSignInButton();
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onTabSignInButton(){
    Navigator.pop(context);
  }

  Future<void> registerUser() async{
    registrationInProgress=true;
    if(mounted){
      setState(() {});
    }
    Map<String,dynamic> requestInput={
      "email": emailController.text.trim(),
      "firstName": firstNameController.text.trim(),
      "lastName": lastNameController.text.trim(),
      "mobile": mobileController.text.trim(),
      "password": passWordController.text,
      "photo": ""
    };
    NetworkResponse response =await NetworkCaller.postRequest("url");
  }


  @override
  void dispose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    mobileController.dispose();
    passWordController.dispose();
    super.dispose();
  }
}
