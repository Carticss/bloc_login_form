import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_using_bloc/auth/auth_repository.dart';
import 'package:login_using_bloc/auth/form_submission_status.dart';
import 'package:login_using_bloc/auth/login/login_event.dart';
import 'package:login_using_bloc/auth/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{

  final AuthRepository authRepo;

  LoginBloc(this.authRepo)
      : super(LoginState()) {
    on<LoginEvent>(_onEvent);
  }

  Future<void> _onEvent(LoginEvent event, Emitter<LoginState> emit) async {

    if (event is LoginUsernameChanged) {
      emit(state.copyWith(username: event.username));
    }

    else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));
    }

    else if (event is LoginSubmitted) {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        await authRepo.login();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(formStatus: SubmissionFailed(e.toString())));
      }
    }
  }


}