class SignInDto {
  final String email;
  final String password;

  const SignInDto(this.email, this.password);

  Map<String, dynamic> toJson() {
    return {
      'email': email.toLowerCase(),
      'password': password,
    };
  }
}
