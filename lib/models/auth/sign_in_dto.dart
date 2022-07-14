/// Class which serves as a Data Transfer Object for sending a SignIn Request to the Backend
///
/// @author: PascalM13
class SignInDto {
  final String email;
  final String password;

  const SignInDto(this.email, this.password);

  //Function to create a Json from an object of class SignInDto
  Map<String, dynamic> toJson() {
    return {
      'email': email.toLowerCase(),
      'password': password,
    };
  }
}
