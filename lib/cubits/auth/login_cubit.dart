import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:podeo_assignment_one/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  String fullName = '';
  String email = '';
  String password = '';

  void setFullName(String value) {
    fullName = value;
  }

  void setEmail(String value) {
    email = value;
  }

  void setPassword(String value) {
    password = value;
  }

  void reset() {
    fullName = '';
    email = '';
    password = '';
    emit(LoginInitial());
  }

  bool validateInput() {
    fullName.trim();
    email.trim();
    password.trim();

    if (fullName.isEmpty) {
      emit(LoginValidationError(message: 'Name cannot be empty.'));
      return false;
    } else if (email.isEmpty) {
      emit(LoginValidationError(message: 'Email cannot be empty'));
      return false;
    } else if (password.isEmpty) {
      emit(LoginValidationError(message: 'Password cannot be empty'));
      return false;
    } else if (password.length < 6) {
      emit(LoginValidationError(message: 'Please use a stronger password with a minimum length of 6 characters.'));
      return false;
    } else {
      return true;
    }
  }

  void onLoginPressed() {
    emit(LoginLoading());
    bool result = validateInput();
    if (result) {
      Future.delayed(const Duration(seconds: 2), () {
        emit(LoginSuccess(user: User(fullName: fullName, email: email)));
      });
    }
  }
}
