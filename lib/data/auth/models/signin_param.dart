
class SignInParam {
  final String email;
  final String password;

  SignInParam({
    required this.email,
    required this.password,
  });

  /// Convert class object to JSON map
  Map<String, dynamic> toMap() {
    return<String,dynamic>  {
      'email': email,
      'password': password,
    };
  }

}

