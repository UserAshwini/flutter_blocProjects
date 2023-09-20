import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_interneconnection/blocs/internet_bloc/internet_bloc.dart';
import 'package:flutter_bloc_interneconnection/blocs/internet_bloc/internet_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: BlocConsumer<InternetBloc,InternetState>(
          builder: (context,state){
            if(state is InternetGainedState){
              return const Text('Connected!');
            }else if (state is InternetLostState){
              return const Text('Not Connected!');
            } else {return const Text('Loading...');}
          }, 
          listener: (context, state){
            if(state is InternetGainedState){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Internet Connected Successfully'),
                backgroundColor: Colors.green,)
              );
            } else if(state is InternetLostState){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Internet Not Connected'),
                backgroundColor: Colors.red,)
              );
          }}),
      )),
    );
  }
}