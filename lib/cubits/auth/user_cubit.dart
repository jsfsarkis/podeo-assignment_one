import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:podeo_assignment_one/models/user_model.dart';

part 'user_state.dart';

class UserCubit extends HydratedCubit<UserState> {
  UserCubit() : super(UserState(user: User(email: '', fullName: ''), isLoggedIn: false));

  void login(User user) {
    emit(UserState(user: user, isLoggedIn: true));
  }

  void logout() {
    emit(UserState(user: User(email: '', fullName: ''), isLoggedIn: false));
  }

  @override
  UserState fromJson(Map<String, dynamic> json) {
    return UserState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(UserState state) {
    return state.toMap();
  }
}
