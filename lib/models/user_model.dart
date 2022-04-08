class User {
  late String fullName;
  late String email;

  User({
    required this.fullName,
    required this.email,
  });

  User.fromMap(Map<String, dynamic> map) {
    fullName = map['fullName'];
    email = map['email'];
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
    };
  }
}
