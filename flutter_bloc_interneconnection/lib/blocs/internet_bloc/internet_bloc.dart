import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_interneconnection/blocs/internet_bloc/internet_events.dart';
import 'package:flutter_bloc_interneconnection/blocs/internet_bloc/internet_states.dart';
import 'package:connectivity/connectivity.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{
  StreamSubscription? connectiveSubscription;
  InternetBloc() : super(InternetInitialState()){

    Connectivity connectivity = Connectivity();
    

    on<InternetLostEvent>((event,emit) => emit(InternetLostState()));
    on<InternetGainedEvent>((event, emit) =>emit(InternetGainedState()));

    connectiveSubscription =connectivity.onConnectivityChanged.listen((result) { 
      if(result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
        add(InternetGainedEvent());
      } else {
      add(InternetLostEvent());
    }
    }
    );
  }
  
  @override
  Future<void> close() {
    connectiveSubscription?.cancel();
    return super.close();
  }
}