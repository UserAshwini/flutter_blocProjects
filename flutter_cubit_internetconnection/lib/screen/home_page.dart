import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_internetconnection/cubits/internet_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: BlocConsumer<InternetCubit,InternetState>(
          builder: (context,state){
            if(state == InternetState.gained){
              return const Text('Connected!');
            }else if (state == InternetState.lost){
              return const Text('Not Connected!');
            } else {return const Text('Loading...');}
          }, 
          listener: (context, state){
            if(state == InternetState.gained){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Internet Connected Successfully'),
                backgroundColor: Colors.green,)
              );
            } else if(state == InternetState.lost){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Internet Not Connected'),
                backgroundColor: Colors.red,)
              );
          }}),
      )),
    );
  }
}