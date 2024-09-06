import 'package:e_commers_app/presentation/ui/utils/app_colors.dart';
import 'package:e_commers_app/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';

class EmailVarificationScreen extends StatefulWidget {
  const EmailVarificationScreen({super.key});

  @override
  State<EmailVarificationScreen> createState() => _EmailVarificationScreenState();
}

class _EmailVarificationScreenState extends State<EmailVarificationScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 350,),
          const Center(child: AppLogoWidget()),
          const SizedBox(height: 24,),
          Text("Welcome Back",style: Theme.of(context).textTheme.headlineLarge,),
          const SizedBox(height: 8,),
          Text("Please Enter Your Email",style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.bodyLargeColor,
          ),),
          const SizedBox(height: 8,),
          TextField(
            decoration:Theme.of(context).inputDecorationTheme.border
          ),

        ],
      ),
    );
  }
}
