import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fultter_courseapp/pages/welcome/blocs/welcome_events.dart';
import 'package:fultter_courseapp/pages/welcome/blocs/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelcomeStates>{
  WelcomeBloc():super(WelcomeStates()){
    print("Welcome");
    on((event, emit) => emit(WelcomeStates(page: state.page)));
  }
}