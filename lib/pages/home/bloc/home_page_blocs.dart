import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fultter_courseapp/pages/home/bloc/home_page_evnts.dart';
import 'package:fultter_courseapp/pages/home/bloc/home_page_states.dart';

class HomePageBlocs extends Bloc<HomePageEvents,HomePageStates>{
  HomePageBlocs():super( HomePageStates()){
    on<HomePageDots>(_HomePageDots);
  }
  void _HomePageDots(HomePageDots event, Emitter<HomePageStates> emit){
    emit(state.copyWith(index: event.index));
  }
}