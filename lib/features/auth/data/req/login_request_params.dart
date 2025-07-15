class LoginRequestParams {
  String? email;
  String? password;

  LoginRequestParams({this.email, this.password});

  factory LoginRequestParams.fromJson(Map<String, dynamic> json) {
    return LoginRequestParams(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
