import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fultter_courseapp/pages/application/bloc/app_events.dart';
import 'package:fultter_courseapp/pages/application/bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvent,AppSate>{
   AppBlocs():super(const AppSate()){
     on<TriggerAppEvent>((event, emit) {
       emit(AppSate(index: event.index));
     });
   }
}