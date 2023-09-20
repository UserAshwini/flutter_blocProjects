import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocformvalidation/sign-in/bloc/sign_in_bloc.dart';
// import 'package:flutter_blocformvalidation/route/route.dart';
import 'package:flutter_blocformvalidation/sign-in/sign_in.dart';
import 'package:flutter_blocformvalidation/styles/colors.dart';
import 'package:flutter_blocformvalidation/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child:  Text('WELCOME',style: TextStyle(fontSize: 31,fontWeight: FontWeight.bold,color: Palette.appPrimaryColor),),
            ),
            const SizedBox(height: 80,),
            CustomButton(text: 'Sign In with Email', onPressed: () { 
              Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider(create: (context) => SignInBloc(),
              child: const SignIn())));
             }, ),
             const SizedBox(height: 40,),
            CustomButton(text: 'Sign In with Google', onPressed: () {  },)
          ],
        ),
      ),
    );
  }
}