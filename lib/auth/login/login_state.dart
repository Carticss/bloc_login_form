import 'package:login_using_bloc/auth/form_submission_status.dart';

class LoginState {

  LoginState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  final String username;
  bool isValidUsername() => username.length > 3 && username.isNotEmpty;

  final String password;
  bool isValidPassword() => password.length > 6 && username.isNotEmpty;

  final FormSubmissionStatus formStatus;

  LoginState copyWith({
    String username,
    String password,
    FormSubmissionStatus formStatus,
  })=>
    LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus
    );
}