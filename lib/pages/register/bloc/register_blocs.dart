import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fultter_courseapp/pages/register/bloc/register_events.dart';
import 'package:fultter_courseapp/pages/register/bloc/register_states.dart';



class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBlocs() : super(const RegisterStates()) {
    on<UserNameEvent>(_UserNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_repasswordEvent);
  }

  void _UserNameEvent(UserNameEvent event, Emitter<RegisterStates> emit) {
    print("${event.userName}");
    emit(state.copyWith(userName: event.userName));
  }
  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    print("${event.email}");
    emit(state.copyWith(email: event.email));
  }
  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    print("${event.password}");
    emit(state.copyWith(password: event.password));
  }
  void _repasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emit) {
    print("${event.repassword}");
    emit(state.copyWith(rePassword: event.repassword));
  }
}
