import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocformvalidation/sign-in/bloc/sign_in_bloc.dart';
import 'package:flutter_blocformvalidation/sign-in/bloc/sign_in_event.dart';
import 'package:flutter_blocformvalidation/sign-in/bloc/sign_in_state.dart';
import 'package:flutter_blocformvalidation/styles/colors.dart';
import 'package:flutter_blocformvalidation/widgets/custom_button.dart';
import 'package:flutter_blocformvalidation/widgets/custom_textField.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.appPrimaryColor,
        title: const Text('Sign In with Email'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Center(
            child: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
                  if (state is SignInErrorState) {
                    return Text(
                      state.errorMessage,
                      style: const TextStyle(
                          color: Colors.redAccent, fontSize: 15),
                    );
                  } else {
                    return Container();
                  }
                }),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: (val) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangeEvent(
                            _emailController.text, _passwordController.text));
                  },
                  hintText: 'Email Address',
                  inputType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: (val) {
                    BlocProvider.of<SignInBloc>(context).add(
                        SignInTextChangeEvent(
                            _emailController.text, _passwordController.text));
                  },
                  hintText: 'Password',
                  controller: _passwordController,
                  // obscureText: true,
                  inputType: TextInputType.visiblePassword,
                  suffixIcon: Icons.visibility,
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SignInLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return CustomButton(
                      text: 'Sign In',
                      onChanged: (val) {
                        if (state is SignInValidState) {
                          BlocProvider.of<SignInBloc>(context).add(
                              SignInSubmittedEvent(_emailController.text,
                                  _passwordController.text));
                        }
                      },
                      enabled: (state is SignInValidState) ? true : false,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
