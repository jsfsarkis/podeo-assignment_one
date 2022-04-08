part of 'user_cubit.dart';

@immutable
class UserState {
  final User user;
  final bool isLoggedIn;

  const UserState({required this.user, required this.isLoggedIn});

  Map<String, dynamic> toMap() {
    Map userMap = user.toMap();
    return {
      'user': userMap,
      'isLoggedIn': isLoggedIn,
    };
  }

  factory UserState.fromMap(Map<String, dynamic> map) {
    if (map.isEmpty) {
      return UserState(user: User(email: '', fullName: ''), isLoggedIn: false);
    }
    return UserState(
      user: User.fromMap(map['user']),
      isLoggedIn: map['isLoggedIn'],
    );
  }
}
